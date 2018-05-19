

 
 
 




window new WaveWindow  -name  "Waves for BMG Example Design"
waveform  using  "Waves for BMG Example Design"

      waveform add -signals /fifo_ram_8x256_tb/status
      waveform add -signals /fifo_ram_8x256_tb/fifo_ram_8x256_synth_inst/bmg_port/CLKA
      waveform add -signals /fifo_ram_8x256_tb/fifo_ram_8x256_synth_inst/bmg_port/ADDRA
      waveform add -signals /fifo_ram_8x256_tb/fifo_ram_8x256_synth_inst/bmg_port/DINA
      waveform add -signals /fifo_ram_8x256_tb/fifo_ram_8x256_synth_inst/bmg_port/WEA
      waveform add -signals /fifo_ram_8x256_tb/fifo_ram_8x256_synth_inst/bmg_port/CLKB
      waveform add -signals /fifo_ram_8x256_tb/fifo_ram_8x256_synth_inst/bmg_port/ADDRB
      waveform add -signals /fifo_ram_8x256_tb/fifo_ram_8x256_synth_inst/bmg_port/DOUTB

console submit -using simulator -wait no "run"
