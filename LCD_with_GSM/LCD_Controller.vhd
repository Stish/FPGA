library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity LCD_Controller is
    Port ( CLK : in  STD_LOGIC;
			  CLK_1000Hz : inout STD_LOGIC;
           RESET : in  STD_LOGIC;
           DATA_OUT : out  STD_LOGIC_VECTOR (7 downto 0);
			  RAM_ADDRESS : out  STD_LOGIC_VECTOR (7 downto 0);
           ENABLE : out  STD_LOGIC;
			  RD_RAM : out  STD_LOGIC;
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
		variable ram_add : std_logic_vector (7 downto 0);
		variable cntTime : integer := 0;
		variable cntLimit : integer := 0;
		variable letterOffset : integer := 0;
	begin
		if (RESET = '1') then
			isInit := false;			--controll var for initilize display
			initStep := 0;				--controll var for different commands
			cntTime := 0;				--timer for waiting times
			cntLimit := 0;				--timer limit
			writeStep := 0;			--controll var for writing on display (which char)
			letterOffset := 0;		--offset for shifting effect on display
			ram_add := "00000000";	--RAM address lines resetz
			RD_RAM <= '1';				--Read RAM allways 1
		elsif (CLK_1ms'Event) and (CLK_1ms = '1') then
			RAM_ADDRESS <= ram_add;	--setting RAM address
			if (isInit = false) then 	--initilize LCD
				if (cntTime = 0) then
					case initStep is		-- define commands and waiting times
						when 0 => cmd := "00111000"; cntLimit := 100;	--0x38
						when 1 => cmd := "00111000"; cntLimit := 50;		--0x38
						when 2 => cmd := "00111000"; cntLimit := 10;		--0x38
						when 3 => cmd := "00111000"; cntLimit := 10;		--0x38
						when 4 => cmd := "00111000"; cntLimit := 10;		--0x38
						when 5 => cmd := "00000110"; cntLimit := 10;		--0x06
						when 6 => cmd := "00001100"; cntLimit := 10;		--0x0C
						when 7 => cmd := "00010100"; cntLimit := 10;		--0x14
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
				if (cntTime >= cntLimit) then	--waiting times
					cntTime := 0;	--reset waiting time counter
					initStep := initStep + 1;	--change between different commands
				end if;
			else	--LCD is init
				if (cntTime = 0) then
					if (writeStep = 0) then	--Reset cursor position
						cntLimit := 100;		--prev 10, now for waiting for shift
						cmd := "10000000";	--Reset cursor position to 0x00
						DATA_OUT <= cmd;		--command ist outputted
						RS <= '0';				--writing command
					else
						if (DATA_IN = "00000001") then	--empty data from RAM changed to <space>
							DATA_OUT <= "00100000";
						else
							DATA_OUT <= DATA_IN;	--Output data from RAM
						end if;
						RS <= '1';			--writing data
						cntLimit := 10;	--define waiting time
					end if;
					ENABLE <= '1'; 	--high stroke
				end if;
				
				cntTime := cntTime + 1;
				if (cntTime = 5) then
					ENABLE <= '0'; 	--end of stroke (4ms length)
				end if;
				if (cntTime >= cntLimit) then --waiting time for LCD
					cntTime := 0;	--reset counter for waiting
					writeStep := writeStep + 1;	--writing next char
					ram_add := ram_add + 1;	--next databyte from RAM
					if (writeStep > 20) then	--end of display line
						writeStep := 0;	--start from beginning
						letterOffset := letterOffset + 1;	--Offset for shifting the LCD
						if (letterOffset >= 180) then
							letterOffset := 0;
						end if;
						ram_add := "00000000";	--reset RAM address
						ram_add := ram_add + letterOffset;	--starting with offset for shifting effect on display
					end if;
				end if;				
			end if;
		end if;
	end process;
end Behavioral;

