library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Test_Data_out is
    Port ( DATA_OUT : out  STD_LOGIC_VECTOR (7 downto 0);
				FLAG_T : in std_logic;
				FLAG_R : in std_logic;
				RESET : in  STD_LOGIC;
				DATA_IN : in  STD_LOGIC_VECTOR (7 downto 0);
				RAM_OUT : out  STD_LOGIC_VECTOR (7 downto 0);
				RAM_ADDRESS : out  STD_LOGIC_VECTOR (7 downto 0);
				--RD_RAM : out std_logic;
				WRT_RAM : out std_logic;
				clk : in std_logic);
	 
end Test_Data_out;

architecture Behavioral of Test_Data_out is
	type arr is array(0 to 13) of std_logic_vector(7 downto 0);
	--shared variable token : arr;
	signal at_cmgl_all : arr;	
	
begin

	process(clk, RESET)
		variable cnt : integer range 0 to 13 := 0;
		variable cnt_clk : integer range 0 to 100000000 := 90000000;
		variable send : boolean;
		variable ram_wrt : boolean;
		variable sending : boolean;
		variable ram_add : std_logic_vector (7 downto 0);
		procedure init_tokens is
		begin
			at_cmgl_all(0) <= "01100001";		--a
			at_cmgl_all(1) <= "01110100";		--t
			at_cmgl_all(2) <= "00101011";		--+
			at_cmgl_all(3) <= "01100011";		--c
			at_cmgl_all(4) <= "01101101";		--m
			at_cmgl_all(5) <= "01100111";		--g
			at_cmgl_all(6) <= "01101100";		--l
			at_cmgl_all(7) <= "00111101";		--=
			at_cmgl_all(8) <= "00100010";		--"
			at_cmgl_all(9) <= "01100001";		--a
			at_cmgl_all(10) <= "01101100";	--l
			at_cmgl_all(11) <= "01101100";	--l
			at_cmgl_all(12) <= "00100010";	--"
			at_cmgl_all(13) <= "00001101";	--<cr>
		end init_tokens;
	begin
		init_tokens;
		if (RESET = '1') then
			ram_add := "00010100"; --20 for text start position
			cnt_clk := 0;
		elsif (clk = '1') and (clk'event) then
			if (cnt_clk = 100000000) then
				cnt_clk := 0;
				send := true;
				ram_add := "00010100"; --20 for text start position
			end if;
			if (send = true) then
				if (FLAG_T = '0') then
					DATA_OUT <= at_cmgl_all(cnt);
				end if;
				if (FLAG_T = '1') then
					sending := true;
				end if;
				if (FLAG_T = '0') and (sending = true) then
					sending := false;
					cnt := cnt + 1;
				end if;
				if (cnt = 14) then
					cnt := 0;
					send := false;
					DATA_OUT <= "00000000";
				end if;
			else
				if (FLAG_R = '0') then
					ram_wrt := true;
					RAM_ADDRESS <= ram_add;
					RAM_OUT <= DATA_IN;
					WRT_RAM <= '1';
				else
					if (ram_wrt = true) then
						ram_add := ram_add + 1;
						ram_wrt := false;
					end if;
				end if;
			end if;
			cnt_clk := cnt_clk + 1;
		end if;
	end process;
end Behavioral;

