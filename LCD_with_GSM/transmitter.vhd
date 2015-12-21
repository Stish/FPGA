library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity transmitter is
    Port ( CLK : in  STD_LOGIC;
           TXD : out STD_LOGIC;
			  bit_clk : out std_logic;
           RESET : in  STD_LOGIC;
           DATA_IN : in  STD_LOGIC_VECTOR (7 downto 0);
			  FLAG_T : inout  STD_LOGIC);
end transmitter;

architecture Behavioral of transmitter is
constant baudDivide : std_logic_vector(9 downto 0) := "1010001011"; --baude rate divider for 9600 by 4*baude rate = sample rate
																								-- by dividing 50Mhz by 2 and 38400
signal clkDiv : std_logic_vector(9 downto 0) := "0000000000";
signal tClk : std_logic := '0';	-- sample clock (38400)
signal sendBuffer : std_logic_vector(7 downto 0);
begin
	process (CLK)	 					--Define rClk
	begin
		if CLK = '1' and CLK'Event then
			if clkDiv = baudDivide then
				tClk <= not tClk;
				clkDiv <= "0000000000";
			else
				clkDiv <= clkDiv +1;
			end if;
		end if;
	end process;

	process(tClk,RESET)
		variable count : integer;
	begin

		if(RESET='1') then          -- asynchrous reset
			FLAG_T   <=  '0';
			count := 0;
			sendBuffer <=  "00000000";
		elsif(tClk'event and tClk='1' ) then
			if(FLAG_T='0')then
				if not(DATA_IN = "00000000") then
					FLAG_T  <= '1' ;
				end if;
				count := 0;
			elsif(FLAG_T='1') then
				sendBuffer <= DATA_IN;
				case count is
					when 0 => TXD <= '0' ; bit_clk <= '1'; -- Start-Bit
					when 4 => TXD <= sendBuffer(0);bit_clk <= '1'; --  6. Takt LSB
					when 8 => TXD <= sendBuffer(1);bit_clk <= '1'; -- 10. Takt
					when 12 => TXD <= sendBuffer(2);bit_clk <= '1'; -- 14. Takt
					when 16 => TXD <= sendBuffer(3);bit_clk <= '1'; -- 18. Takt
					when 20 => TXD <= sendBuffer(4);bit_clk <= '1'; -- 22. Takt
					when 24 => TXD <= sendBuffer(5);bit_clk <= '1'; -- 26. Takt
					when 28 => TXD <= sendBuffer(6);bit_clk <= '1'; -- 30. Takt
					when 32 => TXD <= sendBuffer(7);bit_clk <= '1'; -- 34. Takt MSB
					when 36 => TXD <= '1' ;bit_clk <= '1'; --stop-Bit
					when 60 => FLAG_T<='0' ;
					when others   => bit_clk <= '0';       -- 38. Takt Stop-Bit
				end case ;
				count := count + 1;
			end if ;
		end if ;
	end process ;
end Behavioral;

