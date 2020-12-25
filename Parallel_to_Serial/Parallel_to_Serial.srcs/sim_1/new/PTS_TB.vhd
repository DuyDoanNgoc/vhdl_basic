----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/15/2020 11:16:18 PM
-- Design Name: 
-- Module Name: PTS_TB - Behavioral
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

entity PTS_TB is
--  Port ( );
end PTS_TB;

architecture Behavioral of PTS_TB is
component PTS is
    Port ( DATA_IN : in STD_LOGIC_VECTOR (7 downto 0);
           CLK : in STD_LOGIC;
           CLR : in STD_LOGIC;
           DATA_OUT : out STD_LOGIC_VECTOR (7 downto 0);
           LOAD : in STD_LOGIC);
end component;
---inputs---
signal CLK : STD_LOGIC := '0';
signal CLR : STD_LOGIC := '0';
signal LOAD : STD_LOGIC := '0';
signal DATA_IN : STD_LOGIC_VECTOR( 7 downto 0) := "10101001";
----outputs----
signal DATA_OUT : STD_LOGIC_VECTOR( 7 downto 0);
---clk_period---
constant CLK_period : time := 5ns;

begin
    U1: PTS PORT MAP (
    DATA_IN => DATA_IN,
    CLK => CLK,
    CLR => CLR,
    LOAD => LOAD,
    DATA_OUT => DATA_OUT);
    
    CLK <= not CLK after CLK_period;
    process
    begin
    wait for 100ns;
    
    CLR <= '1' after 500ms,'0' after 1600ms;
    LOAD <='1' after 2000ms,'0'after 2700ms;
    wait;
    end process;

end Behavioral;
