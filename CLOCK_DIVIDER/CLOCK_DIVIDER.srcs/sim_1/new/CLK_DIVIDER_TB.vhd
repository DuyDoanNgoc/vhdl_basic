----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/31/2020 11:59:28 PM
-- Design Name: 
-- Module Name: CLK_DIVIDER_TB - Behavioral
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

entity CLK_DIVIDER_TB is
--  Port ( );
end CLK_DIVIDER_TB;

architecture Behavioral of CLK_DIVIDER_TB is
component CLK_DIVIDER 
    Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           CLK_out : out STD_LOGIC);
end component;
---inputs----
signal CLK : STD_LOGIC := '0';
signal RST : STD_LOGIC := '0';
---outputs---
signal CLK_out : STD_LOGIC;
---CLK_period----

constant clk_period : time := 5ns;

begin
U1: CLK_DIVIDER PORT MAP (
    CLK => CLK,
    RST => RST,
    CLK_out => CLK_out);
    CLK <= not CLK after clk_period;
    process
    begin
    wait for 100ns;
    
    RST <= '1' after 100ns, '0' after 120ns, '1' after 600ns, '0' after 650ns; 
    wait;
    end process;
end Behavioral;
