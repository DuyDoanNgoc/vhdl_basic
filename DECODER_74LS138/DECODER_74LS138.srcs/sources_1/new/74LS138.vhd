----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/31/2020 01:04:20 AM
-- Design Name: 
-- Module Name: 74LS138 - Behavioral
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

entity DECODER_74LS138 is
    Port ( DATA_OUT : out STD_LOGIC_VECTOR (7 downto 0);
           DATA_IN : in STD_LOGIC_VECTOR (2 downto 0);
           E1 : in STD_LOGIC;
           E2 : in STD_LOGIC;
           E3 : in STD_LOGIC);
end DECODER_74LS138;

architecture Behavioral of DECODER_74LS138 is

begin
    process (DATA_IN)
    begin
        if ( E1 ='0' and E2 = '0' and E3 = '1') then
           case DATA_IN is
            when "000" => DATA_OUT <= "01111111";
            when "100" => DATA_OUT <= "10111111";
            when "010" => DATA_OUT <= "11011111";
            when "110" => DATA_OUT <= "11101111";
            when "001" => DATA_OUT <= "11110111";
            when "101" => DATA_OUT <= "11111011";
            when "011" => DATA_OUT <= "11111101";
            when "111" => DATA_OUT <= "11111110";
            when others => DATA_OUT <= "11111111";
            end case;
         else DATA_OUT <= (others =>'1');
        end if;
     end process;
       
end Behavioral;
