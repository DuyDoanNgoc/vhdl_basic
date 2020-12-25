----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/31/2020 05:42:29 PM
-- Design Name: 
-- Module Name: COUNTER_UD_LS190_TB - Behavioral
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

entity COUNTER_UD_LS190_TB is
--  Port ( );
end COUNTER_UD_LS190_TB;

architecture Behavioral of COUNTER_UD_LS190_TB is

--- Component Declaration for the Unit Under Test (UUT)
    COMPONENT LS190
    PORT( CTEN : in STD_LOGIC;
           LOAD : in STD_LOGIC;
           UpDn : in STD_LOGIC;
           CLK : in STD_LOGIC;
           DATA_IN : in STD_LOGIC_VECTOR (3 downto 0);
           DATA_OUT : out STD_LOGIC_VECTOR (3 downto 0);
           RCO : out STD_LOGIC);
   END COMPONENT;
 --- Inputs
    signal CTEN: std_logic := '0';

    signal LOAD : std_logic := '0';
    signal UpDn : std_logic := '0';
    signal CLK : std_logic := '0';
    signal DATA_IN : std_logic_vector(3 downto 0) :="0101";
-- Outputs
    signal DATA_OUT : std_logic_vector(3 downto 0);
    signal RCO : std_logic;
-- Clock period definitions
    constant CLK_period : time := 10ns;
    BEGIN
    --- instantiate the UNIT UNDER TEST (UUT)
    uut: LS190 PORT MAP(
            CTEN => CTEN,
            LOAD => LOAD,
            UpDn => UpDn,
            CLK => CLK,
            DATA_IN => DATA_IN,
            DATA_OUT => DATA_OUT,
            RCo => RCO
        );
        CLK <= not CLK after  CLK_period;
        process
        begin
        -- hold reset state for 100 ns.
        wait for 100 ns;
        -- insert stimulus here
        CTEN <= '1' after 50ns;
        LOAD <= '1' after 300 ns, '0' after 400ns ;
        UpDn <= '1' after 650ns , '0' after 800ns  ;
        wait;
        end process;
              


end Behavioral;

