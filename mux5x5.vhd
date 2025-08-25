library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux5x5 is
port (
		sel : in std_logic;
		i_a, i_b : in std_logic_vector(4 downto 0);
		i_z : out std_logic_vector(4 downto 0)
	);
end entity;

architecture muxBehave of mux5x5 is

component mux1x2 is	
port(
		sel : in std_logic;
		a, b : in std_logic;
		z : out std_logic
	);	
end component;	
begin
	
	generate8: for i in 0 to 4 generate
	
	mux_gen: mux1x2 port map(a => i_a(i), b => i_b(i), sel => sel, z => i_z(i));	
	end generate;
end architecture muxBehave;