----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:38:07 12/25/2010 
-- Design Name: 
-- Module Name:    Clk_div_2 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Clk_div_2 is
    Port ( Clk_in : in  STD_LOGIC;
           Clk_out : inout  STD_LOGIC);
end Clk_div_2;

architecture Behavioral of Clk_div_2 is

begin

process (Clk_in)
begin
  if Clk_in'event and Clk_in='1' then
    if (Clk_out = '0') then
      Clk_out <= '1';
    else
      Clk_out <= '0';
    end if;
  end if;
end process;

end Behavioral;

