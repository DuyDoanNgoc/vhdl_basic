----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/30/2020 10:04:33 PM
-- Design Name: 
-- Module Name: COUNTER_163x2_LED7s_TB - Behavioral
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

entity COUNTER_163x2_LED7s_TB is
--  Port ( );
end COUNTER_163x2_LED7s_TB;

architecture Behavioral of COUNTER_163x2_LED7s_TB is
----add component---
    component COUNTER_163x2_7s_DISPLAY
        PORT(           
           CLR : in STD_LOGIC;
           LOAD : in STD_LOGIC;
           ENP : in STD_LOGIC;
           ENT : in STD_LOGIC;
           DATA7_IN : in STD_LOGIC_VECTOR ( 7 downto 0);
           DATA7_OUT : out STD_LOGIC_VECTOR (13 downto 0);
           CLK : in STD_LOGIC;
           RCO : out STD_LOGIC);
    end component;
    ---- inputs-----
    SIGNAL CLR : STD_LOGIC := '0';
    SIGNAL ENP : STD_LOGIC := '0';
    SIGNAL ENT : STD_LOGIC := '0';
    SIGNAL LOAD : STD_LOGIC := '0';
    SIGNAL CLK : STD_LOGIC := '1';
    SIGNAL DATA7_IN : STD_LOGIC_VECTOR(7 downto 0) := "00010001";
    ----outputs---
    SIGNAL RCO : STD_LOGIC;
    SIGNAL DATA7_OUT : STD_LOGIC_VECTOR(13 downto 0);
    -----Clock priod---
    constant CLK_PERIOD : time := 10ns;
begin
    ----PORT MAP----
    U1: COUNTER_163x2_7s_DISPLAY PORT MAP(
        CLR => CLR,
        LOAD => LOAD,
        ENT => ENT,
        ENP => ENP,
        CLK => CLK,
        DATA7_IN => DATA7_IN,
        RCO =>RCO,
        DATA7_OUT => DATA7_OUT
    );
    CLK <= not CLK after CLK_PERIOD;
    PROCESS
    BEGIN
    wait for 50ns;
    -----STIMULUS-----
        CLR <= '1' after 75ns, '0' after 100ns;
        LOAD <='1' after 550ns, '0' after 570ns;
        ENT <='1' after 200ns;
        ENP <='1' after 250ns;
        wait;
        END PROCESS;

end Behavioral;
