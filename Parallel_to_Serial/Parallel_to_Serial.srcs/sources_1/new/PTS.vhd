----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/15/2020 10:58:09 PM
-- Design Name: 
-- Module Name: PTS - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PTS is
    Port ( DATA_IN : in STD_LOGIC_VECTOR (7 downto 0);
           CLK : in STD_LOGIC;
           CLR : in STD_LOGIC;
           DATA_OUT : out STD_LOGIC_VECTOR (7 downto 0);
           LOAD : in STD_LOGIC);
end PTS;

architecture Behavioral of PTS is
signal tmp : STD_LOGIC_VECTOR (7 downto 0);
signal data : STD_LOGIC_VECTOR (7 downto 0):= "00000000";
signal CLK_div: STD_LOGIC;
begin
    Fre_div: process (CLK)
    variable count1: integer range 0 to 60000000;
            begin
            if CLR = '1' then
                count1 :=0;
                CLK_div <= '0';
                elsif (CLK ='1' and CLK'event) then
                    count1 := count1 +1;
                    if count1 = 50000000 then
                        CLK_div <= not CLK_div;
                        count1 := 0;
                    end if;
            end if;
    end process;
    process (CLK_div)
    variable count : integer range 0 to 10;
    begin 
        if CLR ='1' then
            tmp <= ( others => '0');
            data <= (others => '0');
            count := 0;
        elsif CLK_div ='1' and CLK_div'event then
            if LOAD ='1' then
            tmp <= DATA_IN;
            count := 0;
            elsif count < 8 then 
             tmp <= '0' & tmp (7 downto 1);
            data <= data(6 downto 0) & tmp(0);
            count := count +1;
            else tmp <= tmp;
                data <= data;
            end if;

    end if;
        DATA_OUT <= data;
        end process;

end Behavioral;
