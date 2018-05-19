/*
 * main.c
 *
 *  Created on: Apr 8, 2018
 *      Author: lane
 */

#include <xparameters.h>
#include <xiomodule.h>
#include <xstatus.h>

XIOModule dev;

#define BUF_SIZE 16

u8 sendBuffer[BUF_SIZE];
u8 recvBuffer[BUF_SIZE];

u8 recvFilled;
u32 frames;

u32 palette[256];

/*void dataAvailable(void *ref) {
        recvBuffer[0] = XIo_In8(0xD0000000);
        recvFilled = 1;
}*/

void delay(u32 ms) {
        u32 ct = 0; // set the counter to 0
        while (ct < ms) // wait for ms number of milliseconds
                ct++;
}

#define OP_SETFBDATA 0
#define OP_SETFBOFFSET 1
#define OP_SETDBGEN 2
#define OP_CLKDBGDATA 3
#define OP_SETPALETTE 4
#define OP_SETFRAME 5

#define STATE_IDLE 0
#define STATE_EXECUTING 1
#define STATE_START_STREAM 2
#define STATE_STREAMING 3

u8 state, bytes_to_read, current_opcode;

// When streaming, stream_atom_size is the number of bytes to collect per call, and stream_num_atoms is the number of calls to make before finishing
u8 stream_atom_size, stream_num_atoms;

void setfbdata_cb(u64 data) {
	XIo_Out8(0xD1000000 + (u32)(data & 0xFFFF), (data >> 16) & 0xFF);
}

void setfboffset_cb(u64 data) {
	XIo_Out16(0xD0000004, (u16)(data & 0xFFFF));
}

void setdbgen_cb(u64 data) {
	XIo_Out8(0xD000000C, data & 0xFF);
}

void clkdbgdata_cb(u64 data) {
	XIo_Out8(0xD0000008, data & 0xFF);
}

void setpalette_cb(u64 data) {
	//
}

void setpalette_stream_cb(u64 data, u32 atom_id) {
	palette[atom_id] = data & 0xFFFFFF;
}

u16 stream_frame_offset;

void setframe_cb(u64 data) {
	stream_frame_offset = data & 0xFFFF;
}

void setframe_stream_cb(u64 data, u32 atom_id) {
	u16 base_idx = 3 * (atom_id & 0xFFFF) + stream_frame_offset;
	u8 r = palette[data] & 0xFF;
	u8 g = (palette[data] >> 8) & 0xFF;
	u8 b = (palette[data] >> 16) & 0xFF;
	XIo_Out8(0xD1000000 + base_idx + 0, r);
	XIo_Out8(0xD1000000 + base_idx + 1, g);
	XIo_Out8(0xD1000000 + base_idx + 2, b);
}

// The opcode is the index into this struct
static const struct {
	u8 next_state;
	void (*cb)(u64 data);
	u8 bytes_to_read;
	u8 stream_atom_size;
	u32 stream_num_atoms;
	void (*atom_cb)(u64 data, u32 atom_id);
} opcodes[] = {
		// Note: bytes_to_read cannot be 0, for technical reasons :/
		//    next_state,                cb, bytes_to_read, stream_atom_size, stream_num_atoms, atom_cb
		{STATE_EXECUTING,      setfbdata_cb,             3,                0,                0,       0}, // SETFBDATA
		{STATE_EXECUTING,    setfboffset_cb,             2,                0,                0,       0}, // SETFBOFFSET
		{STATE_EXECUTING,       setdbgen_cb,             1,                0,                0,       0}, // SETDBGEN
		{STATE_EXECUTING,     clkdbgdata_cb,             1,                0,                0,       0}, // CLKDBGDATA
		{STATE_START_STREAM,  setpalette_cb,             1,                3,              256,       setpalette_stream_cb}, // SETPALETTE
		{STATE_START_STREAM,    setframe_cb,             2,                1,            24*24,       setframe_stream_cb}, // SETFRAME
};

void process_opcode(u8 opcode) {
	current_opcode = opcode;
	state = opcodes[opcode].next_state;
	bytes_to_read = opcodes[opcode].bytes_to_read;
	stream_atom_size = opcodes[opcode].stream_atom_size;
	stream_num_atoms = opcodes[opcode].stream_num_atoms;
	/*switch (opcode) {

	case OP_SETDBGEN:
	case OP_CLKDBGDATA:
		state = STATE_EXECUTING;
		bytes_to_read = 1;
		break;

	case OP_SETFBOFFSET:
		state = STATE_EXECUTING;
		bytes_to_read = 2;
		break;

	case OP_SETFBDATA:
		state = STATE_EXECUTING;
		bytes_to_read = 3;
		break;

	case OP_SETPALETTE:
		state = STATE_STREAMING;
		break;
	default:
		// Error! Unrecognized opcode
		break;
	}*/
}

void execute_with_data(u8 opcode, u64 cmd_data) {
	opcodes[opcode].cb(cmd_data);
	/*switch (opcode) {
	case OP_SETFBDATA:
		XIo_Out8(0xD1000000 + (u32)(cmd_data & 0xFFFF), (cmd_data >> 16) & 0xFF);
		break;
	case OP_SETFBOFFSET:
		XIo_Out16(0xD0000004, (u16)(cmd_data & 0xFFFF));
		break;
	case OP_SETDBGEN:
		// Enabled/disable the debug data display
		XIo_Out8(0xD000000C, cmd_data & 0xFF);
		break;
	case OP_CLKDBGDATA:
		// Clock in 8 bits of driver debug data
		XIo_Out8(0xD0000008, cmd_data & 0xFF);
		break;
	default:
		break;
	}*/
}

void stream_data(u8 opcode, u64 data, u32 atom_id) {
	opcodes[opcode].atom_cb(data, atom_id);
}

int main() {
        recvFilled = 0;

        XIOModule_Initialize(&dev, XPAR_IOMODULE_0_DEVICE_ID); // Initialize the GPO module

        microblaze_register_handler(XIOModule_DeviceInterruptHandler, XPAR_IOMODULE_0_DEVICE_ID); // register the interrupt handler

        XIOModule_Start(&dev); // start the GPO module
        XIOModule_CfgInitialize(&dev, NULL, 1);

        //XIOModule_Connect(&dev, XIN_IOMODULE_EXTERNAL_INTERRUPT_INTR+1, dataAvailable, NULL); // register timerTick() as our interrupt handler
        //XIOModule_Enable(&dev, XIN_IOMODULE_EXTERNAL_INTERRUPT_INTR+1); // enable the interrupt

        //XIOModule_Connect(&dev, XIN_IOMODULE_EXTERNAL_INTERRUPT_INTR+0, vsync, NULL); // register timerTick() as our interrupt handler
        //XIOModule_Enable(&dev, XIN_IOMODULE_EXTERNAL_INTERRUPT_INTR+0); // enable the interrupt

        microblaze_enable_interrupts(); // enable global interrupts

        //u32 leds = 0;
        frames = 0;
        //u32 opcode = 1024;
        //u32 cmd_data = 0;
        //u32 cmd_bytesleft = 0;
        u64 cmd_data = 0;
        u32 atoms_left = 0;
        bytes_to_read = 0;
        state = 0;
        while (1) {
#if 0
        	if (XIo_In8(0xD0000004) > 0) {
        		delay(100000);
        		u8 c = XIo_In8(0xD0000000);
        		XIo_Out8(0xD0000000, c);
        	}
        	delay(100000);
#endif
        	//XIo_Out8(0xD0000000, XIo_In8(0xD0000004));
        	//delay(100000);

        	if (XIo_In8(0xD0000004) > 0) {
        		u8 c = XIo_In8(0xD0000000);
        		if (bytes_to_read > 0) {
        			cmd_data = (cmd_data << 8) | bytes_to_read;
        			bytes_to_read--;
        		}

        		if (bytes_to_read == 0) {
					switch (state) {
					case STATE_IDLE:
						process_opcode(c);
						break;
					case STATE_EXECUTING:
						execute_with_data(current_opcode, cmd_data);
						cmd_data = 0;
						state = STATE_IDLE;
						break;
					case STATE_START_STREAM:
						execute_with_data(current_opcode, cmd_data);
						cmd_data = 0;
						bytes_to_read = stream_atom_size;
						atoms_left = stream_num_atoms;
						state = STATE_STREAMING;
						break;
					case STATE_STREAMING:
						stream_data(current_opcode, cmd_data, stream_num_atoms - atoms_left);
						if (atoms_left > 0) {
							bytes_to_read = stream_atom_size;
							atoms_left--;
						} else {
							state = STATE_IDLE;
						}
						break;
					default:
						// Error! How'd we get here?
						break;
					};
        		}
        	}

#if 0
        	if (XIo_In8(0xD0000004) > 0) {
				u8 c = XIo_In8(0xD0000000);
				recvFilled = 0;
				if (cmd_bytesleft == 0 && opcode > 255) {
					opcode = c;
					cmd_bytesleft = 3;
				} else if (cmd_bytesleft > 0) {
					cmd_data = (cmd_data<<8) | c;
					cmd_bytesleft--;
				} else {
					if (opcode == 0) {
						// Set fb offset
						XIo_Out16(0xD0000004, cmd_data&0xFFFF);
						XIo_Out8(0xD0000000, 'Z');//132);
					} else if (opcode == 1) {
						// Set pixel in the framebuffer
						XIo_Out8(0xD1000000 + (cmd_data & 0xFFFF), (cmd_data >> 16) & 0xFF);
						XIo_Out8(0xD0000000, cmd_data & 0xFF); delay(1000);
						XIo_Out8(0xD0000000, (cmd_data & 0xFF00) >> 8);

						/*int i;
						for (i=0; i<1728; i++) {
							XIo_Out8(0xD1000000 + i, 255);
						}*/
					} else if (opcode == 2) {
						// Enable/disable driver debug data
						XIo_Out8(0xD000000C, cmd_data & 0xFF);
					} else if (opcode == 3) {
						// Clock in 8 bits of driver debug data
						XIo_Out8(0xD0000008, cmd_data & 0xFF);
					} else {
						// Unknown opcode!
						XIo_Out8(0xD0000000, 'X');//opcode);
					}
					opcode = 1024;
					cmd_bytesleft = 0;
				}
			}
#endif

#if 0
                // The external IO starts at 0xC000 0000, ostensibly
                XIo_Out8(0xD0000000, 'h'); delay(100000);
                XIo_Out8(0xD0000000, 'e'); delay(100000);
                XIo_Out8(0xD0000000, 'l'); delay(100000);
                XIo_Out8(0xD0000000, 'l'); delay(100000);
                XIo_Out8(0xD0000000, 'o'); delay(100000);
                XIo_Out8(0xD0000000, '\n'); delay(100000);
                /*if (recvFilled > 0) {
                        char c = recvBuffer[0];
                        XIo_Out8(0xD0000000, c);
                        recvFilled = 0;
                }*/
                //leds++;
                //XIOModule_DiscreteWrite(&dev, 1, ((leds>>20)&0xF0)|(frames&0xF));//leds++);

                // Set the framebuffer pixel
                /*int i;
                for (i=0; i<1728; i++) {
                	XIo_Out8(0xD1000000 + i, 255);
                }*/
                //XIo_Out8(0xD1000003, 255);

                // Set the offset
                //XIo_Out8(0xD0000004, 0);

                //delay(10000000);
#endif
        }
}
