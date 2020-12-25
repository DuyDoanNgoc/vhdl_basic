----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/15/2020 01:56:18 PM
-- Design Name: 
-- Module Name: COUNTER_160 - Behavioral
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

entity COUNTER_160 is
    Port ( CLK : in STD_LOGIC;
           CLR : in STD_LOGIC;
           ENP : in STD_LOGIC;
           ENT : in STD_LOGIC;
           LOAD : in STD_LOGIC;
           DATA_IN : in STD_LOGIC_VECTOR (3 downto 0);
           DATA_OUT : out STD_LOGIC_VECTOR (3 downto 0);
           RCO : out STD_LOGIC);
end COUNTER_160;

architecture Behavioral of COUNTER_160 is
SIGNAL count: STD_LOGIC_VECTOR ( 3 downto 0);
begin
    PROCESS (CLK)
    BEGIN
    IF CLK ='1' and CLK'event THEN
        IF CLR = '1' THEN
            count <= (OTHERS =>'0');
        ELSIF (ENT ='0' AND ENP ='0') THEN
            IF LOAD = '1' THEN
                count <= DATA_IN;
            ELSIF count ="1001" THEN
                count <= "0000";
                ELSE
                count <= count +1;
            END IF;
        END IF;
    END IF;
    IF count = "1001" THEN 
        RCO <='1';
        ELSE RCO <='0';
    END IF;
      
    DATA_OUT <= count;
    END PROCESS;

end Behavioral;
