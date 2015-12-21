library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RAM is
    Port ( DATA_OUT : out  STD_LOGIC_VECTOR (7 downto 0);
           DATA_IN : in  STD_LOGIC_VECTOR (7 downto 0);
           ADDRESS : in  STD_LOGIC_VECTOR (7 downto 0);
			  ADDRESS_OUT : in  STD_LOGIC_VECTOR (7 downto 0);
           RD : in  STD_LOGIC;
			  CLK : in  STD_LOGIC;
			  RESET : in STD_LOGIC;
           WRT : in  STD_LOGIC);
end RAM;

architecture Behavioral of RAM is
	type arr is array(0 to 255) of std_logic_vector(7 downto 0);
	
	function vec_to_int (vec : in STD_LOGIC_VECTOR (7 downto 0)) return integer is
		variable result : integer := 0;
	begin
		result := 0;
		if (vec(7) = '1') then
			result := result + 128;
		end if;
		if (vec(6) = '1') then
			result := result + 64;
		end if;
		if (vec(5) = '1') then
			result := result + 32;
		end if;
		if (vec(4) = '1') then
			result := result + 16;
		end if;
		if (vec(3) = '1') then
			result := result + 8;
		end if;
		if (vec(2) = '1') then
			result := result + 4;
		end if;
		if (vec(1) = '1') then
			result := result + 2;
		end if;
		if (vec(0) = '1') then
			result := result + 1;
		end if;
		return result;
	end;
begin
	process(CLK, RESET, ADDRESS)
		variable i : integer;
		variable data : arr;
	begin
		if (RESET = '1') then
			for i in 0 to 255 loop
				data(i) := "00000001";
			end loop;
			DATA_OUT <= "00000001";
		elsif (CLK'event and CLK = '1') then
		--else
			if (RD = '1') then	--Read data
				DATA_OUT <= data(vec_to_int(ADDRESS_OUT));
			end if;
			if (WRT = '1') then	--Write data
				data(vec_to_int(ADDRESS)) := DATA_IN;
			end if;
		end if;
	end process;
end Behavioral;

