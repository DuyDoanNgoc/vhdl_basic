----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/29/2020 10:00:20 PM
-- Design Name: 
-- Module Name: COUNTER_163x2 - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity COUNTER_163x2 is
    Port ( CLR : in STD_LOGIC;
           LOAD : in STD_LOGIC;
           ENP : in STD_LOGIC;
           ENT : in STD_LOGIC;
           DATA_IN : in STD_LOGIC_VECTOR (7 downto 0);
           DATA_OUT : out STD_LOGIC_VECTOR (7 downto 0);
           CLK : in STD_LOGIC;
           RCO : out STD_LOGIC);
end COUNTER_163x2;

architecture Behavioral of COUNTER_163x2 is
    COMPONENT COUNTER_163
    PORT ( CLK : in STD_LOGIC;
               CLR : in STD_LOGIC;
               ENP : in STD_LOGIC;
               ENT : in STD_LOGIC;
               LOAD : in STD_LOGIC;
               DATA_IN : in STD_LOGIC_VECTOR (3 downto 0);
               DATA_OUT : out STD_LOGIC_VECTOR (3 downto 0);
               RCO : out STD_LOGIC);
   END COMPONENT;
   SIGNAL Ripple1,Ripple2: STD_LOGIC;
begin
    U1: COUNTER_163 PORT MAP(
        CLK => CLK,
        CLR => CLR,
        ENP => ENP,
        ENT => ENT,
        LOAD => LOAD,
        DATA_IN => DATA_IN (3 downto 0),
        DATA_OUT => DATA_OUT (3 downto 0),
        RCO => Ripple1
        );
    U2: COUNTER_163 PORT MAP(
            CLK => CLK,
            CLR => CLR,
            LOAD => LOAD,
            ENT => Ripple1,
            ENP => ENP,
            RCO => Ripple2,
            DATA_IN => DATA_IN (7 downto 4),
            DATA_OUT => DATA_OUT (7 downto 4)
            ); 

    RCO <= Ripple1 and Ripple2;
end Behavioral;
