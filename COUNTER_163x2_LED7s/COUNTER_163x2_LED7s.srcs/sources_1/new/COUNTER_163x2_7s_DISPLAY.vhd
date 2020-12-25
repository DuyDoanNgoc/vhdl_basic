----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/30/2020 09:44:42 PM
-- Design Name: 
-- Module Name: COUNTER_163x2_7s_DISPLAY - Behavioral
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

entity COUNTER_163x2_7s_DISPLAY is
    Port ( CLR : in STD_LOGIC;
           LOAD : in STD_LOGIC;
           ENP : in STD_LOGIC;
           ENT : in STD_LOGIC;
           DATA7_IN : in STD_LOGIC_VECTOR ( 7 downto 0);
           DATA7_OUT : out STD_LOGIC_VECTOR (13 downto 0);
           CLK : in STD_LOGIC;
           RCO : out STD_LOGIC);
end COUNTER_163x2_7s_DISPLAY;

architecture Behavioral of COUNTER_163x2_7s_DISPLAY is
    COMPONENT COUNTER_163x2 
        PORT( CLR : in STD_LOGIC;
               LOAD : in STD_LOGIC;
               ENP : in STD_LOGIC;
               ENT : in STD_LOGIC;
               DATA_IN : in STD_LOGIC_VECTOR (7 downto 0);
               DATA_OUT : out STD_LOGIC_VECTOR (7 downto 0);
               CLK : in STD_LOGIC;
               RCO : out STD_LOGIC);
       END COMPONENT;
   COMPONENT LED7s
    PORT( LED7_IN : in STD_LOGIC_VECTOR (3 downto 0);
          LED7_OUT : out STD_LOGIC_VECTOR (6 downto 0));
    END COMPONENT;
    Signal L1: STD_LOGIC_VECTOR (7 downto 0);
begin
    U1: COUNTER_163x2 PORT MAP (
            CLK => CLK,
            CLR => CLR,
            ENP => ENP,
            ENT => ENT,
            LOAD => LOAD,
            DATA_IN => DATA7_IN,
            DATA_OUT => L1,
            RCO => RCO
        );
    LED1: LED7s PORT MAP (
        LED7_IN => L1( 3 downto 0),
        LED7_OUT => DATA7_OUT(6 downto 0));
    LED2: LED7s PORT MAP(
            LED7_IN => L1( 7 downto 4),
            LED7_OUT => DATA7_OUT(13 downto 7));
        

end Behavioral;
