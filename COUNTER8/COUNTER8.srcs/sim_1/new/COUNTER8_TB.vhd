----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/12/2020 01:54:46 AM
-- Design Name: 
-- Module Name: COUNTER8_TB - Behavioral
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

entity COUNTER8_TB is
--  Port ( );
end COUNTER8_TB;

architecture Behavioral of COUNTER8_TB is
component COUNTER8 is
    Port ( CTEN : in STD_LOGIC;
           RST : in STD_LOGIC;
           LOAD : in STD_LOGIC;
           R : in STD_LOGIC;
           S: in STD_LOGIC;
           CLK_IN : in STD_LOGIC;
           DATA_IN : in STD_LOGIC_VECTOR (7 downto 0);
           DATA_OUT : out STD_LOGIC_VECTOR (7 downto 0));
end component;
----inputs----
signal CTEN : std_logic := '0';
signal RST : std_logic := '0';
signal LOAD : std_logic := '0';
signal R : std_logic := '0';
signal S : std_logic := '0';
signal CLK_IN : std_logic := '0';
signal DATA_IN : std_logic_vector(7 downto 0) := "01010101";
---outputs-----
signal DATA_OUT : std_logic_vector( 7 downto 0);
---clk_defines---
constant clock_periode :time := 5ns;

begin
----MAP-----
    UTT: COUNTER8 PORT MAP(
    CTEN => CTEN,
    LOAD => LOAD,
    R => R,
    S => S,
    CLK_IN => CLK_IN,
    DATA_IN => DATA_IN,
    RST =>RST,
    DATA_OUT => DATA_OUT
    );
    CLK_IN <= not CLK_IN after clock_periode;
    process
    begin
    wait for 100ns;
    RST <= '1' after 100ns, '0' after 130ns, '1' after 1010ms,'0' after 2200ms ;
    lOAD <= '1' after 300ns, '0' after 550ns;
    S <= '1' after 3500ms, '0' after 14000ms  ;
    R <= '1' after  7500ms, '0' after 10000ms, '1' after 15000ms;
    wait;
    end process;

end Behavioral;

























