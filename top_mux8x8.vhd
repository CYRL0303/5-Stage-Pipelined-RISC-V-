library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity top_mux8x8 is
	
	port(PC, ALUresult, readData1, readData2, writeData, other, i6, i7: in std_logic_vector(7 downto 0); -- i6 and i7 not used
		sel :in std_logic_vector(2 downto 0);
		muxOut: out std_logic_vector(7 downto 0));
		
end top_mux8x8;

architecture Behavior of top_mux8x8 is
	
component mux1x8 is
	
port(in0, in1, in2, in3, in4, in5, in6, in7 : in std_logic;  -- in6 and in7 not used
		sel :in std_logic_vector(2 downto 0);
		muxOut: out std_logic);
		
end component;	

begin
	
	generate8: for i in 0 to 7 generate
	mux_gen: mux1x8 port map(in0 => PC(i), in1 => ALUresult(i), in2 => readData1(i), 
					in3 => readData2(i), in4 => writeData(i), in5 => other(i),
					 in6 => i6(i), in7 => i7(i), sel => sel, muxOut => muxOut(i));	
	end generate;
end Behavior;
