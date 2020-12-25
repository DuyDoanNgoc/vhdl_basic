----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/12/2020 01:38:20 AM
-- Design Name: 
-- Module Name: COUNTER8 - Behavioral
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

entity COUNTER8 is
    Port ( CTEN : in STD_LOGIC;
       RST : in STD_LOGIC;
       LOAD : in STD_LOGIC;
       R : in STD_LOGIC;
       S: in STD_LOGIC;
       CLK_IN : in STD_LOGIC;
       DATA_IN : in STD_LOGIC_VECTOR (7 downto 0);
       DATA_OUT : out STD_LOGIC_VECTOR (7 downto 0));
end COUNTER8;

architecture Behavioral of COUNTER8 is
signal CLK, tmp : STD_LOGIC;
signal count: STD_LOGIC_VECTOR ( 7 downto 0);
component SR_FF is
    Port ( S : in STD_LOGIC;
           R : in STD_LOGIC;
           CLK : in STD_LOGIC;
           Q : out STD_LOGIC);
end component;
begin
    U_FF: SR_FF PORT MAP(
        S => S,
        R => R,
        CLK => CLK,
        Q => tmp);
    FreDiv: Process (CLK_IN)
        variable count1: integer range 0 to 100000000;
        begin
        if RST = '1' then
            count1 :=0;
            CLK <= '0';
            elsif (CLK_IN ='1' and CLK_IN'event) then
                count1 := count1 +1;
                if count1 = 50000000 then
                    CLK <= not CLK;
                    count1 := 0;
                end if;
        end if;
        end process;
    Main: process(CLK, CLK_IN)
            begin
            if RST ='1' then
                count<= (others => '0');
                elsif CLK ='1' and CLK'event then
                    if CTEN = '0' then
                        if LOAD= '1' then
                            count <= DATA_IN;
                        elsif tmp='1' then
                            count <= count -1;
                            else 
                            count <= count +1;
                            end if;
                    end if;
                end if;
            end process;
        DATA_OUT <= count;
end Behavioral;



















