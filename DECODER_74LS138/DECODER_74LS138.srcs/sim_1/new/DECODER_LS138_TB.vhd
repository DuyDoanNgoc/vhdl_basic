----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/31/2020 01:16:07 AM
-- Design Name: 
-- Module Name: DECODER_LS138_TB - Behavioral
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

entity DECODER_LS138_TB is
--  Port ( );
end DECODER_LS138_TB;

architecture Behavioral of DECODER_LS138_TB is
component DECODER_74LS138
    PORT ( DATA_OUT : out STD_LOGIC_VECTOR (7 downto 0);
           DATA_IN : in STD_LOGIC_VECTOR (2 downto 0);
           E1 : in STD_LOGIC;
           E2 : in STD_LOGIC;
           E3 : in STD_LOGIC);
end component;
----INPUTS----
signal E1 : STD_LOGIC := '0';
signal E2 : STD_LOGIC := '0';
signal E3 : STD_LOGIC := '0';
signal DATA_IN : STD_LOGIC_VECTOR(2 downto 0) := "011";
----OUTPUT-----
signal DATA_OUT: STD_LOGIC_VECTOR (7 downto 0);

begin
U1:DECODER_74LS138 PORT MAP (
    E1 => E1,
    E2 => E2,
    E3 => E3,
    DATA_IN => DATA_IN,
    DATA_OUT => DATA_OUT);
    process
    begin
        wait for 50ns;
        ----INSERT STIMULUS ----
        E1 <= '1' after 70ns, '0' after 80ns,'0' after 90ns, '0' after 100ns, '1' after 100ns, '0' after 110ns ;
        E2 <= '0' after 70ns, '0' after 80ns, '1' after 90ns, '0' after 100ns, '1' after 100ns, '0' after 110ns;
        E3 <= '0' after 70ns, '0' after 80ns, '0' after 90ns, '1' after 100ns, '0' after 100ns, '1' after 110ns;
        DATA_IN <= "001" after 70ns,"010" after 90ns,"100" after 100ns,"010" after 130ns, "000" after 150ns, "001" after 170ns, "010" after 190ns,"011" after 210ns,"100" after 230ns,"101" after 250ns,"110" after 270ns,"111" after 290ns;
        wait;
    end process;


end Behavioral;
