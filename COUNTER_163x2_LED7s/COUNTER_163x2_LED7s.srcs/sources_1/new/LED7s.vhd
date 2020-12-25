----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/30/2020 09:31:26 PM
-- Design Name: 
-- Module Name: LED7s - Behavioral
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

entity LED7s is
    Port ( LED7_IN : in STD_LOGIC_VECTOR (3 downto 0);
           LED7_OUT : out STD_LOGIC_VECTOR (6 downto 0));
end LED7s;

architecture Behavioral of LED7s is

begin
    PROCESS (LED7_IN)
    BEGIN
    CASE LED7_IN IS
      WHEN "0000" => LED7_OUT <="0000001" ;
      WHEN "0001" => LED7_OUT <="1001111" ;
      WHEN "0010" => LED7_OUT <="0010010" ;
      WHEN "0011" => LED7_OUT <="0000110" ;
      WHEN "0100" => LED7_OUT <="1001100" ;
      WHEN "0101" => LED7_OUT <="0100100" ;
      WHEN "0110" => LED7_OUT <="0100000" ;
      WHEN "0111" => LED7_OUT <="0001111" ;
      WHEN "1000" => LED7_OUT <="0000000" ;
      WHEN "1001" => LED7_OUT <="0000100" ;
      WHEN others => LED7_OUT <= (others => '1');
      END CASE; 
    END PROCESS;
end Behavioral;
