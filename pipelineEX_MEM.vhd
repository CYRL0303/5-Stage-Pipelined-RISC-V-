library ieee;
use ieee.std_logic_1164.all;

entity pipelineEX_MEM is
    port (
            i_Greset, i_clock	        : IN STD_LOGIC;
            i_enable			        : IN STD_LOGIC;

            i_MEMSignals                : in std_logic_vector (1 downto 0);
            i_WBSignals                 : in std_logic_vector (1 downto 0);
            i_ALUresult                 : in std_logic_vector (7 downto 0);
            i_IDEX_RegisterRd           : in std_logic_vector (4 downto 0);

            o_MEMSignals                : out std_logic_vector (1 downto 0);
            o_WBSignals                 : out std_logic_vector (1 downto 0);
            o_ALUresult                 : out std_logic_vector (7 downto 0);
            o_IDEX_RegisterRd           : out std_logic_vector (4 downto 0)
		);
end pipelineEX_MEM;
architecture rtl of pipelineEX_MEM is
    

    COMPONENT twoBitRegister
        PORT(
            i_resetBar, i_en	: IN	STD_LOGIC;
            i_clock			: IN	STD_LOGIC;
            i_Value			: IN	STD_LOGIC_VECTOR(1 downto 0);
            o_Value			: OUT	STD_LOGIC_VECTOR(1 downto 0)
        );
    END COMPONENT;

    COMPONENT fiveBitRegister
        PORT(
            i_resetBar, i_en	: IN	STD_LOGIC;
            i_clock			    : IN	STD_LOGIC;
            i_Value			    : IN	STD_LOGIC_VECTOR(4 downto 0);
            o_Value			    : OUT	STD_LOGIC_VECTOR(4 downto 0)
        );
    END COMPONENT;

    COMPONENT eightBitRegister
        PORT ( 
            i_GReset, i_clock : IN STD_LOGIC;
            i_enable : IN STD_LOGIC;
            i_A : IN STD_LOGIC_VECTOR(7 downto 0);
            o_q : OUT STD_LOGIC_VECTOR(7 downto 0)
        );
    END COMPONENT;


    signal int_MEMSignals, int_WBSignals   :std_logic_vector (1 downto 0);
    signal int_ALUresult :std_logic_vector (7 downto 0);
    signal int_IDEX_RegisterRd :std_logic_vector (4 downto 0);

    
    BEGIN
    memSignals: twoBitRegister
        PORT MAP (i_Greset, i_enable, i_clock, i_MEMSignals, int_MEMSignals);
    wbSignals: twoBitRegister
        PORT MAP (i_Greset, i_enable, i_clock, i_WBSignals, int_WBSignals);
    aluResult: eightBitRegister 
        PORT MAP (i_Greset, i_clock, i_enable, i_ALUresult, int_ALUresult);
    registerRd: fiveBitRegister 
        PORT MAP (i_Greset, i_enable, i_clock, i_IDEX_RegisterRd, int_IDEX_RegisterRd);


    o_MEMSignals               <= int_MEMSignals;
    o_WBSignals               <= int_WBSignals;
    o_ALUresult                <= int_ALUresult;
    o_IDEX_RegisterRd          <= int_IDEX_RegisterRd;


end architecture rtl; 