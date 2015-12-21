library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity receiver is
    Port ( CLK : in  STD_LOGIC;
           RXD : in  STD_LOGIC;
           FLAG_R : inout  STD_LOGIC;
           DATA_OUT : out  STD_LOGIC_VECTOR (7 downto 0);
           RESET : in  STD_LOGIC);
end receiver;

architecture Behavioral of receiver is
constant baudDivide : std_logic_vector(9 downto 0) := "1010001011"; 		--baude rate divider for 9600 by 4*baude rate = sample rate
																								-- by dividing 50Mhz by 2 and 38400
signal clkDiv : std_logic_vector(9 downto 0) := "0000000000";
signal rClk : std_logic := '0';	-- sample clock (38400)
signal readBuffer : std_logic_vector(7 downto 0);
begin
	process (CLK)	 					--Define rClk
	begin
		if CLK = '1' and CLK'Event then
			if clkDiv = baudDivide then
				rClk <= not rClk;
				clkDiv <= "0000000000";
			else
				clkDiv <= clkDiv +1;
			end if;
		end if;
	end process;

	process(rClk,RESET)
		variable count : integer;
	begin
		if(RESET='1') then          -- asynchrous reset
			FLAG_R   <=  '0' ;
			count := 0;
			DATA_OUT <=  "00000000" ;
		elsif(rClk'event and rClk='1' ) then
			if(RXD='0' and FLAG_R='0')then   -- Start-Bit
				FLAG_R  <= '1' ;
				count := 0;
			elsif(FLAG_R='1') then
				case count is
					when 5 => readBuffer(0) <= RXD ; --  6. Takt LSB
					when 9 => readBuffer(1) <= RXD ; -- 10. Takt
					when 13 => readBuffer(2) <= RXD ; -- 14. Takt
					when 17 => readBuffer(3) <= RXD ; -- 18. Takt
					when 21 => readBuffer(4) <= RXD ; -- 22. Takt
					when 25 => readBuffer(5) <= RXD ; -- 26. Takt
					when 29 => readBuffer(6) <= RXD ; -- 30. Takt
					when 33 => readBuffer(7) <= RXD ; -- 34. Takt MSB
					when 37 => FLAG_R <= '0' ;
					when others => null;       
				end case ;
				count := count + 1;
				DATA_OUT <= readBuffer;
			end if ;
		end if ;
	end process ;
end Behavioral;

