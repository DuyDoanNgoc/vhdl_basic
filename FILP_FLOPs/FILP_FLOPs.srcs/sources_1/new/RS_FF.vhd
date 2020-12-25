----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/31/2020 02:18:50 PM
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
    Port ( R : in STD_LOGIC;
           S : in STD_LOGIC;
           CLK : in STD_LOGIC;
           Q : out STD_LOGIC;
           QBAR : out STD_LOGIC);
end SR_FF;

architecture Behavioral of SR_FF is
begin
    process (CLK)
    variable tmp : STD_LOGIC;
    begin
        if CLK ='1' and CLK'event then
            if (S = '0' and R = '0') then
                tmp := tmp;
            elsif ( S= '0' and R ='1') then
                tmp := '0';
            elsif (S = '1' and R ='0') then
                tmp := '1';
            else tmp := 'Z';
            end if;
            end if;
        Q <= tmp;
        QBAR <= not tmp;
    end process;
end Behavioral;
