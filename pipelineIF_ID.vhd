library ieee;
use ieee.std_logic_1164.all;

entity pipelineIF_ID is
    port (
            i_Greset, i_clock	        : IN STD_LOGIC;
            i_enable			        : IN STD_LOGIC;

            i_IFIDWrite                 : in std_logic; 
            i_Flush                     : in std_logic; 

            i_PCAddress                 : in std_logic_vector (7 downto 0);
            i_Intsruction               : in std_logic_vector (31 downto 0);


            o_PCAddress                 : out std_logic_vector (7 downto 0);
            o_Intsruction               : out std_logic_vector (31 downto 0)
		);
end pipelineIF_ID;



architecture rtl of pipelineIF_ID is
    


    COMPONENT eightBitRegister
        PORT ( 
            i_GReset, i_clock : IN STD_LOGIC;
            i_enable : IN STD_LOGIC;
            i_A : IN STD_LOGIC_VECTOR(7 downto 0);
            o_q : OUT STD_LOGIC_VECTOR(7 downto 0)
        );
    END COMPONENT;

    COMPONENT thirtyTwoBitRegister
        PORT(
            i_resetBar, i_en	: IN	STD_LOGIC;
            i_clock			: IN	STD_LOGIC;
            i_Value			: IN	STD_LOGIC_VECTOR(31 downto 0);
            o_Value			: OUT	STD_LOGIC_VECTOR(31 downto 0)
        );
    END COMPONENT;



    signal int_PCAddress :std_logic_vector (7 downto 0);
    signal int_Intsruction :std_logic_vector (31 downto 0);

    
    BEGIN
    
    pcAddress: eightBitRegister 
        PORT MAP (i_Greset, i_enable, i_clock, i_PCAddress, int_PCAddress);
    intruction: thirtyTwoBitRegister 
        PORT MAP (i_Greset, i_enable, i_clock, i_Intsruction, int_Intsruction);


    o_PCAddress            <= int_PCAddress;
    o_Intsruction          <= int_Intsruction;


end architecture rtl; 