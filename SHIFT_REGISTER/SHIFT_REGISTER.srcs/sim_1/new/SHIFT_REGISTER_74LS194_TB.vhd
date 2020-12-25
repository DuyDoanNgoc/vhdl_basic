----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/31/2020 04:13:54 PM
-- Design Name: 
-- Module Name: SHIFT_REGISTER_74LS194_TB - Behavioral
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

entity SHIFT_REGISTER_74LS194_TB is
--  Port ( );
end SHIFT_REGISTER_74LS194_TB;

architecture Behavioral of SHIFT_REGISTER_74LS194_TB is
component SHIFT_REGISTER_74LS194
    Port ( CLK : in STD_LOGIC;
           CLR : in STD_LOGIC;
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           R : in STD_LOGIC;
           L : in STD_LOGIC;
           DATA_IN : in STD_LOGIC_VECTOR (3 downto 0);
           DATA_OUT : out STD_LOGIC_VECTOR (3 downto 0));
end component;
----INPUTS----
signal CLK : STD_LOGIC := '1';
signal CLR : STD_LOGIC := '0';
signal S0 : STD_LOGIC := '0';
signal S1 : STD_LOGIC := '0';
signal R : STD_LOGIC := '0';
signal L : STD_LOGIC := '0';
signal DATA_IN : STD_LOGIC_VECTOR(7 downto 0) := "10101010";

-----OUTPUTS-----------
signal DATA_OUT : STD_LOGIC_VECTOR( 7 downto 0);

-----TIME_PERIOD-------
constant clock_period :time := 5ns;
begin
    U1: SHIFT_REGISTER_74LS194 PORT MAP(
        CLK => CLK,
        CLR => CLR,
        S0 => S0,
        S1 => S1,
        R => R,
        L => L,
        DATA_IN => DATA_IN,
        DATA_OUT => DATA_OUT
        );
        CLK <= not CLK after clock_period ;
        process
        begin
        wait for 10ns;
        
        ------ stimulus----
        S0 <= '1' after 100ns, '0' after 200ns;
        S1 <= '1' after 100ns, '0' after 140ns, '1' after 200ns, '0' after 260ns;
        CLR <= '1' after 110ns, '0' after 130ns;
        R <=  '1' after 170ns, '0' after 180ns, '1' after 330ns, '0' after 350ns, '1' after 360ns, '0' after 370ns;
        L <= '1' after 300ns, '0' after 310ns, '1' after 320ns, '0' after 330ns, '1' after 350ns, '0' after 360ns, '1' after 370ns, '0' after 380ns;
        DATA_IN <= "0000" after 145ns;
           wait;
        
        
        end process;

end Behavioral;
