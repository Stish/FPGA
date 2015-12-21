----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:41:49 12/29/2010 
-- Design Name: 
-- Module Name:    clk_div_ctrl - Behavioral 
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

entity clk_div_ctrl is
    Port ( clk_50mhz : in  STD_LOGIC;
           clk_ctrl : inout  STD_LOGIC);
end clk_div_ctrl;

architecture Behavioral of clk_div_ctrl is
	--signal cnt : integer range 0 to 62502 := 0;
begin

 	clk_teiler:	process (clk_50mhz)							--
		variable cnt : integer range 0 to 400002 := 0;
	begin
		if (clk_50mhz'event and clk_50mhz = '1') then
			cnt := cnt +1;
			if (cnt <= 200000) then
				clk_ctrl <= '1';
			end if;
			if (cnt > 200000) then
				clk_ctrl <= '0';
			end if;
			if (cnt > 400000) then
				cnt := 0;
			end if;
		end if;
	end process clk_teiler;

end Behavioral;

