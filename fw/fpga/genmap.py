GRIDW = 24

def boardRelativeAddress(r,c):
	return r + c * GRIDW

def absoluteAddress(r, c, Br, Bc):
	return boardRelativeAddress(r, c) + 8 * Br + GRIDW * 8 * Bc

MAPPING = [
	['c0', 'c1', 'c2', 'c3', 'c4', 'c5', 'c6', 'c7'],
	['g0', 'b2', 'g2', 'r2', 'r0', 'b1', 'g1', 'r1'],
	['b7', 'b4', 'g4', 'r4', 'b0', 'b3', 'g3', 'r3'],
	['r7', 'b6', 'g6', 'r6', 'g7', 'b5', 'g5', 'r5']
]

# Registers are clocked in backward!
for i in range(len(MAPPING)):
	MAPPING[i].reverse()

COLOR_OFFSET = {
	'r': 0,
	'g': 1,
	'b': 2,
	'c': 2048
}

addresses = {}
chain = {}
x = 0
lastaddr = -1
for bit in range(8):
	for Br in range(3):
		for Bc in range(3):
			for register in range(4):
				px = MAPPING[register][bit]
				colorOffset = COLOR_OFFSET[px[0]]
				r = int(px[1])
				if px[0] == 'c':
					addr = colorOffset + r + x*8
					x += 1
				else:
					addr = absoluteAddress(r, 0, Br, Bc)*3 + colorOffset
				if lastaddr in chain:
					raise Exception("Address in chain already!")
				chain[lastaddr] = addr
				lastaddr = addr
				addresses[addr] = ((Br,Bc), r, register, bit)
				#print(addr)

print("""
// Note: This file was codegenerated by genmap.py

`timescale 1ns / 1ps

module address_map(
	input [12:0] addr,
	output [12:0] next_addr
);

// Each 8x8 board has 4 shift registers, a column register and 3 row registers.
// We loop through each of these 4 registers before moving onto the next board.
// We loop through all of the boards before moving onto the next bit.
//
// The mapping from register/bit number to pixel/color is:
// Bit: A  B  C  D  E  F  G  H
// 1:   c0 c1 c2 c3 c4 c5 c6 c7
// 2:   g0 b2 g2 r2 r0 b1 g1 r1
// 3:   b7 b4 g4 r4 b0 b3 g3 r3
// 4:   r7 b6 g6 r6 g7 b5 g5 r5
// Bits are shifted in H first through A last.
//
// The address for pixel r,c relative to the board's origin is:
// boardRelativeAddress(r,c) = r + c*gridW
// where colorOffset = 0 for R, 1 for G, and 2 for B. (and gridW = 24 for us, 3 8x8 boards to a side)
//
// So the address for pixel r,c on board B with offset Br,Bc:
// absoluteAddress(r,c,Br,Bc) = boardRelativeAddress(r,c) + 8 * Br + gridW * 8 * Bc

assign next_addr =
""")
				
for k,v in chain.items():
	print("(addr == {0}) ? {1} :".format(k,v))

print("""
2055; // Loop back around

endmodule
""")