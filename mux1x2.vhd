library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux1x2 is
port(
		sel : in std_logic;
		a, b : in std_logic;
		z : out std_logic
	);
end entity;

architecture muxBehave of mux1x2 is
	
begin
	z <= (not(sel) and (b)) or (sel and a);

end architecture muxBehave;