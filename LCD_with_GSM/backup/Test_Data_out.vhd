library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Test_Data_out is
    Port ( DATA_OUT : out  STD_LOGIC_VECTOR (7 downto 0);
				FLAG_T : in std_logic;
				FLAG_R : in std_logic;
				DATA_IN : in  STD_LOGIC_VECTOR (7 downto 0);
				RAM_OUT : out  STD_LOGIC_VECTOR (7 downto 0);
				RAM_ADDRESS : out  STD_LOGIC_VECTOR (7 downto 0);
				RD_RAM : out std_logic;
				WRT_RAM : out std_logic;
				clk : in std_logic);
	 
end Test_Data_out;



architecture Behavioral of Test_Data_out is
	type arr is array(0 to 14) of std_logic_vector(7 downto 0);
	shared variable token : arr;
	signal at_cmgl_all : arr;	
	
	procedure init_tokens is
	begin
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
		token(12) := "00001101"; --<cr>
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
	process(clk)

		variable cnt : integer range 0 to 13 := 0;
		variable cnt_clk : integer range 0 to 100000000 := 0;
		variable send : boolean;
		variable sending : boolean;
		variable ram_add : std_logic_vector (7 downto 0);
	begin
		init_tokens;
		if (clk = '1') and (clk'event) then
			if (cnt_clk = 100000000) then
				cnt_clk := 0;
				send := true;
				ram_add := "00000000";
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
				if (FLAG_R'event and FLAG_R = '0') then
					RAM_ADDRESS <= ram_add;
					RAM_OUT <= DATA_IN;
					WRT_RAM <= '1';
				end if;
			end if;
			cnt_clk := cnt_clk + 1;
		end if;
	end process;

end Behavioral;

