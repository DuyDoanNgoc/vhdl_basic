----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/31/2020 11:18:48 PM
-- Design Name: 
-- Module Name: CLK_DIVIDER - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CLK_DIVIDER is
    Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           CLK_out : out STD_LOGIC);
end CLK_DIVIDER;

architecture Behavioral of CLK_DIVIDER is
signal tmp : STD_LOGIC ;
Signal count : integer := 0;

begin

process (CLK,RST)

begin
    if RST = '1' then
        tmp <= '0';
        count <= 0;
    elsif (CLK = '1' and CLK'event) then
        if count = 1 then
            tmp <= not tmp;
            count <= 0;
        else count <= count +1;
        end if;
    end if;
    CLK_out <= tmp;
end process;

        
        

end Behavioral;
