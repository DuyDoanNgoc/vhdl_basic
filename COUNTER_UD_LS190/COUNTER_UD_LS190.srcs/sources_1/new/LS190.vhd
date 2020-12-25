----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/31/2020 05:39:03 PM
-- Design Name: 
-- Module Name: LS190 - Behavioral
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
entity LS190 is
    Port ( CTEN : in STD_LOGIC;
           LOAD : in STD_LOGIC;
           UpDn : in STD_LOGIC;
           CLK : in STD_LOGIC;
           DATA_IN : in STD_LOGIC_VECTOR (3 downto 0);
           DATA_OUT : out STD_LOGIC_VECTOR (3 downto 0);
           RCO : out STD_LOGIC );
end LS190;

architecture Behavioral of LS190 is
    
    signal count: STD_LOGIC_VECTOR ( 3 downto 0);
begin
    PROCESS(CLK)
    begin
        if CLK ='1' and CLK'event then
           if CTEN ='1' then
              if LOAD ='1' then
                count <= DATA_IN;
                elsif UpDn ='1' then
                    if count = "0000" then 
                        count <= "1001";
                        RCO <= '1';
                        else 
                    count <= count - 1;
                    RCO<= '0';
                    end if;
                elsif count ="1001" then
                    count <= "0000";
                    RCO <= '1';
                    else
                count <=  count + 1;
                RCo <= '0';
                end if;
            end if;
            end if;
        DATA_OUT <=count;
       END PROCESS;
       

end Behavioral;
