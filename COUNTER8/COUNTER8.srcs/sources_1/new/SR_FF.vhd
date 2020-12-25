----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/15/2020 12:19:05 AM
-- Design Name: 
-- Module Name: SR_FF - Behavioral
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

entity SR_FF is
    Port ( S : in STD_LOGIC;
           R : in STD_LOGIC;
           CLK : in STD_LOGIC;
           Q : out STD_LOGIC);
end SR_FF;

architecture Behavioral of SR_FF is
signal tmp : std_logic;
begin
process (CLK)
    begin
        if CLK ='1' and CLK'event then
            if S='1' and R ='0' then
                tmp <= '1';
            elsif S='0' and R='0' then
                tmp <= tmp;
            else tmp <= '0';
            end if;
        end if;
    Q <= tmp;
    end process;
end Behavioral;
