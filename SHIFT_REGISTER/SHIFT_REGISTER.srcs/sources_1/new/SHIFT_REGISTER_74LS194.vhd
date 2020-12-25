----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/31/2020 03:41:54 PM
-- Design Name: 
-- Module Name: SHIFT_REGISTER_74LS194 - Behavioral
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

entity SHIFT_REGISTER_74LS194 is
    Port ( CLK : in STD_LOGIC;
           CLR : in STD_LOGIC;
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           R : in STD_LOGIC;
           L : in STD_LOGIC;
           DATA_IN : in STD_LOGIC_VECTOR (7 downto 0);
           DATA_OUT : out STD_LOGIC_VECTOR (7 downto 0));
end SHIFT_REGISTER_74LS194;

architecture Behavioral of SHIFT_REGISTER_74LS194 is
signal tmp : STD_LOGIC_VECTOR ( 7 downto 0);
begin
    process (CLK,CLR)
    begin
       if CLK ='1' and CLK'event then
        if CLR = '1' then
              tmp <= (others => '0');
            elsif ( S1 = '1' and S0 = '1') then 
                tmp <= DATA_IN;
             elsif ( S1 = '0' and S0 = '1') then
                    if R = '1' then
                        tmp <= '1' & tmp( 7 downto 1);
                    else tmp <= '0' & tmp (7 downto 1);
                    end if;
              elsif ( S1 = '1' and S0 = '0') then
                    if L ='1' then
                        tmp <= tmp ( 6 downto 0) & '1';
                    else tmp <= tmp ( 6 downto 0) & '0';
                    end if;
                else tmp <= tmp;
        end if;
        end if;
        DATA_OUT <= tmp;
        end process;
                       
end Behavioral;
