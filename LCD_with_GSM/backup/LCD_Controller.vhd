library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LCD_Controller is
    Port ( CLK : in  STD_LOGIC;
			  CLK_1000Hz : inout STD_LOGIC;
           RESET : in  STD_LOGIC;
           DATA_OUT : out  STD_LOGIC_VECTOR (7 downto 0);
           ENABLE : out  STD_LOGIC;
           RS : out  STD_LOGIC;
           DATA_IN : in  STD_LOGIC_VECTOR (7 downto 0));
end LCD_Controller;

architecture Behavioral of LCD_Controller is
	type arr is array(0 to 36) of std_logic_vector(7 downto 0);
	signal CLK_1ms : std_logic;
begin
	process(CLK)
		variable cnt : integer range 0 to 50000 := 0;
	begin
		if (CLK'Event) and (CLK = '1') then
			if (cnt >= 25000) then
				CLK_1ms <= not(CLK_1ms);
				CLK_1000Hz <= not(CLK_1000Hz);
				cnt := 0;
			end if;
			cnt := cnt + 1;
		end if;
	end process;
	
	process(CLK_1ms, RESET)
		variable token : arr;
		variable isInit : boolean := false;
		variable initStep : integer := 0;
		variable writeStep : integer := 0;
		variable cmd : std_logic_vector (7 downto 0);
		variable cntTime : integer := 0;
		variable cntLimit : integer := 0;
		variable letterOffset : integer := 0;
	begin
		if (RESET = '1') then
			token(0) := "01001000"; --H
			token(1) := "01100101"; --e
			token(2) := "01101100"; --l
			token(3) := "01101100"; --l
			token(4) := "01101111"; --o
			token(5) := "00100000"; --<space>
			token(6) := "01010111"; --W
			token(7) := "01101111"; --o
			token(8) := "01110010"; --r
			token(9) := "01101100"; --l
			token(10) := "01100100"; --d
			token(11) := "00100001"; --!
			token(12) := "00100000"; --<space>
			token(13) := "01010100"; --T
			token(14) := "01101000"; --h
			token(15) := "01101001"; --i
			token(16) := "01110011"; --s
			token(17) := "00100000"; --<space>
			token(18) := "01101001"; --i
			token(19) := "01110011"; --s
			token(20) := "00100000"; --<space>
			token(21) := "01100001"; --a
			token(22) := "00100000"; --<space>
			token(23) := "01100110"; --f
			token(24) := "01110101"; --u
			token(25) := "01100011"; --c
			token(26) := "00101011"; --k
			token(27) := "01101001"; --i
			token(28) := "01101110"; --n
			token(29) := "00100111"; --'
			token(30) := "00100000"; --<space>
			token(31) := "01010100"; --T
			token(32) := "01100101"; --e
			token(33) := "01110011"; --s
			token(34) := "01110100"; --t
			token(35) := "00100001"; --!
			token(36) := "00100000"; --<space>
			isInit := false;
			initStep := 0;
			cntTime := 0;
			cntLimit := 0;
			writeStep := 0;
			letterOffset := 0;
		elsif (CLK_1ms'Event) and (CLK_1ms = '1') then
			if (isInit = false) then
				if (cntTime = 0) then
					case initStep is
						when 0 => cmd := "00111000"; cntLimit := 100;	--0x38
						when 1 => cmd := "00111000"; cntLimit := 50;		--0x38
						when 2 => cmd := "00111000"; cntLimit := 10;		--0x38
						when 3 => cmd := "00111000"; cntLimit := 10;		--0x38
						when 4 => cmd := "00111000"; cntLimit := 10;		--0x38
						when 5 => cmd := "00000111"; cntLimit := 10;		--0x06
						when 6 => cmd := "00001100"; cntLimit := 10;		--0x0C
						when 7 => cmd := "00011100"; cntLimit := 10;		--0x1c
						when 8 => cmd := "00000001"; cntLimit := 50;		--0x01
						when 9 => cmd := "10000000"; cntLimit := 100;	--0x10
						when others => initStep := 0; isInit := true;
					end case;
					DATA_OUT <= cmd;	--command ist outputted
					RS <= '0';			--writing command
					ENABLE <= '1'; 	--high stroke
				end if;
				cntTime := cntTime + 1;
				if (cntTime = 5) then
					ENABLE <= '0'; 	--end of stroke (4ms length)
				end if;
				if (cntTime >= cntLimit) then
					cntTime := 0;
					initStep := initStep + 1;
					--isInit := true;
				end if;
			else
				if (cntTime = 0) then
					if (writeStep = 0) then	--Reset cursor position
						--cmd := "10000000"; 
						cntLimit := 10;
						DATA_OUT <= cmd;	--command ist outputted
						RS <= '0';			--writing command
					else
						DATA_OUT <= token(writeStep -1);
						RS <= '1';			--writing data
						cntLimit := 300;
					end if;
					ENABLE <= '1'; 	--high stroke
				end if;
				
				cntTime := cntTime + 1;
				if (cntTime = 5) then
					ENABLE <= '0'; 	--end of stroke (4ms length)
				end if;
				if (cntTime >= cntLimit) then
					cntTime := 0;
					writeStep := writeStep + 1;
--					if (writeStep = 21) then
--						writeStep := 0;
--						letterOffset := letterOffset + 1;
--					end if;
					if ((writeStep + 1) >= token'length) then
						writeStep := 0;
						letterOffset := 0;
					end if;
				end if;				
			end if;
		end if;
	end process;
end Behavioral;

