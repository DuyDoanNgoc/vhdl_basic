----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/29/2020 10:24:21 PM
-- Design Name: 
-- Module Name: COUNTER_163x2_TB - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity COUNTER_163x2_TB is
--  Port ( );
end COUNTER_163x2_TB;

architecture Behavioral of COUNTER_163x2_TB is
--- ADD COMPONENT----
COMPONENT COUNTER_163x2
    PORT( CLK : in STD_LOGIC;
           CLR : in STD_LOGIC;
           ENP : in STD_LOGIC;
           ENT : in STD_LOGIC;
           LOAD : in STD_LOGIC;
           DATA_IN : in STD_LOGIC_VECTOR (7 downto 0);
           DATA_OUT : out STD_LOGIC_VECTOR (7 downto 0);
           RCO : out STD_LOGIC);
END COMPONENT;
---INPUTS---
    SIGNAL CLR : STD_LOGIC := '0';
    SIGNAL ENP : STD_LOGIC := '0';
    SIGNAL ENT : STD_LOGIC := '0';
    SIGNAL LOAD : STD_LOGIC := '0';
    SIGNAL CLK : STD_LOGIC := '1';
    SIGNAL DATA_IN : STD_LOGIC_VECTOR(7 downto 0) := "00010001";
---OUTPUTS----
    SIGNAL RCO : STD_LOGIC;
    SIGNAL DATA_OUT : STD_LOGIC_VECTOR(7 downto 0);
----CLOCK PERIOD---
    CONSTANT CLK_PERIOD :time := 10ns;
     
begin
----MAP----
    UTT: COUNTER_163x2 PORT MAP(
        CLR => CLR,
        LOAD => LOAD,
        ENT => ENT,
        ENP => ENP,
        CLK => CLK,
        DATA_IN => DATA_IN,
        RCO =>RCO,
        DATA_OUT => DATA_OUT
        );
----CLK DEFINE-----
    CLK <= not CLK after CLK_PERIOD;
    PROCESS
    BEGIN
    WAIT FOR 50ns;
    
    -----STIMULUS-----
    CLR <= '1' after 75ns, '0' after 100ns;
    LOAD <='1' after 500ns, '0' after 520ns;
    ENT <='1' after 200ns;
    ENP <='1' after 250ns;
    wait;
    END PROCESS;

end Behavioral;
