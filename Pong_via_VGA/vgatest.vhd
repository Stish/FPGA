Library IEEE;
use IEEE.STD_Logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity vgatest is
  port(clock, clk_ctrl, left_up, left_down, right_up, right_down, start : in std_logic;
       R, G, B, H, V : out std_logic);
end entity;

architecture test of vgatest is

  component vgadrive is
    port( clock          : in std_logic;  -- 25.175 Mhz clock
        red, green, blue : in std_logic;  -- input values for RGB signals
        row, column      : out std_logic_vector(9 downto 0); -- for current pixel
        Rout, Gout, Bout, H, V : out std_logic); -- VGA drive signals
  end component;
  
  signal row, column : std_logic_vector(9 downto 0);
  signal red, green, blue : std_logic := '0';
  signal beam_pos_left, beam_pos_right, ball_pos_x, ball_pos_y: integer range 0 to 650 := 0;
  --variable cnt : integer range 0 to 10000000;
  signal dir_ball : bit := '0';
  
  signal s_l, s_r : integer range 0 to 10 := 0;
  --signal reset : boolean := false;
begin

  -- for debugging: to view the bit order
  VGA : component vgadrive
    port map ( clock => clock, red => red, green => green, blue => blue,
               row => row, column => column,
               Rout => R, Gout => G, Bout => B, H => H, V => V);

  -- 640 x 480
	control: process(clk_ctrl, start)
		--variable cnt : integer range 0 to 1000000 := 0;
		variable random : integer range 0 to 10 := 0;
		variable dir_x, dir_y : integer range -3 to 3;
	begin
		if (clk_ctrl'event and clk_ctrl = '1') then

			if (start = '0') then
				random  := random  + 1;
				if (random = 10) then
					random := 0;
				end if;
				ball_pos_x <= 320;
				ball_pos_y <= 240;
				s_l <= 0;
				s_r <= 0;
				case (random) is 
					when 0 =>
						dir_x := -1;
						dir_y := -1;
					when 1 =>
						dir_x := -2;
						dir_y := -1;
					when 2 =>
						dir_x := -1;
						dir_y := -2;
					when 3 =>
						dir_x := -3;
						dir_y := -1;
					when 4 =>
						dir_x := -1;
						dir_y := -3;
					when 5 =>
						dir_x := 1;
						dir_y := 1;
					when 6 =>
						dir_x := 2;
						dir_y := 1;
					when 7 =>
						dir_x := 1;
						dir_y := 2;
					when 8 =>
						dir_x := 3;
						dir_y := 1;
					when 9 =>
						dir_x := 1;
						dir_y := 3;
					when others =>
						dir_x := -1;
						dir_y := -1;
				end case;			
			else
			
				ball_pos_y <= ball_pos_y + dir_y;
				ball_pos_x <= ball_pos_x + dir_x;
				
				if (s_l = 10) or (s_r = 10) then
					s_l <= 0;
					s_r <= 0;
				end if;
				if (left_up = '1' and left_down = '0' and beam_pos_left > 1) then
					beam_pos_left <= beam_pos_left - 2;
				end if;
				if (left_up = '0' and left_down = '1' and beam_pos_left < 408) then
					beam_pos_left <= beam_pos_left + 2;
				end if;
				if (right_up = '1' and right_down = '0' and beam_pos_right > 1) then
					beam_pos_right <= beam_pos_right - 2;
				end if;
				if (right_up = '0' and right_down = '1' and beam_pos_right < 408) then
					beam_pos_right <= beam_pos_right + 2;
				end if;

				if (ball_pos_y <= 3) then 
					dir_y := (-1*dir_y);
					ball_pos_y <= 4;
				end if;
				
				if (ball_pos_y >= (479-15)) then
					dir_y := (-1*dir_y);
					ball_pos_y <= 479-16;
				end if;

				if (ball_pos_x >= (623-15) and dir_x > 0 and ball_pos_y > (beam_pos_right - 14) and ball_pos_y < (beam_pos_right + 70 + 14)) then
					dir_x := (-1*dir_x);
				end if;

				if (ball_pos_x <= 16 and dir_x < 0 and ball_pos_y > (beam_pos_left - 14) and ball_pos_y < (beam_pos_left + 70 + 14)) then
					dir_x := (-1*dir_x);
				end if;

				if (ball_pos_x >= (639-15-10)) then
					dir_x := (-1 * dir_x);
					ball_pos_x <= 320;
					ball_pos_y <= 240;
					s_l <= s_l + 1;
				end if;	

				if (ball_pos_x <= 10) then
					dir_x := (-1 * dir_x);
					ball_pos_x <= 320;
					ball_pos_y <= 240;
					s_r <= s_r + 1;
				end if;


	--			if (dir_ball = '0') then
	--				ball_pos_x <= ball_pos_x + 1;
	--			else
	--				ball_pos_x <= ball_pos_x - 1;
	--			end if;
	--			if (ball_pos_x >= (623-15) and dir_ball = '0' and ball_pos_y > (beam_pos_right - 14) and ball_pos_y < (beam_pos_right + 70 + 14)) then
	--				dir_ball <= '1';
	--			end if;
	--			if (ball_pos_x >= (639-15)) then
	--				dir_ball <= '1';
	--				s_l <= s_l + 1;
	--				--s_r <= s_r + 1;
	--			end if;			
	--			if (ball_pos_x <= 16 and dir_ball = '1' and ball_pos_y > (beam_pos_left - 14) and ball_pos_y < (beam_pos_left + 70 + 14)) then
	--				dir_ball <= '0';
	--			end if;
	--			if (ball_pos_x <= 1) then
	--				dir_ball <= '0';
	--				s_r <= s_r + 1;
	--			end if;
				--ball_pos_y <= beam_pos_left + 30;
			end if;
		 end if;
	end process;
	
  RGB : process(row, column)

  begin
	 
	 -- left beam --
	 if (row > beam_pos_left and row < (beam_pos_left + 70) and column > 0 and column < 15)  then
		red <= '1';
		green <= '0';
		blue <= '0';
	 else
	 -- right beam --
		 if (row > beam_pos_right and row < (beam_pos_right + 70) and column > 624 and column < 639) then
			blue <= '1';
			red <= '0';
			green <= '0';
		 else
	 -- middle line
			 if (row > 0 and row < 479 and column > 317 and column < 323)  then
				blue <= '1';
				red <= '1';
				green <= '1';
			 else
	 -- score left - Seg A --
				 if ((row > 20 and row < 45 and column > 275 and column < 280) and (s_l = 0 or s_l = 1 or s_l = 2 or s_l = 3 or s_l = 4 or s_l = 7 or s_l = 8 or s_l = 9))  then
					blue <= '0';
					red <= '1';
					green <= '0';
				 else
	 -- score left - Seg B --
				 if ((row > 50 and row < 75 and column > 275 and column < 280) and (s_l = 0 or s_l = 1 or s_l = 5 or s_l = 6 or s_l = 3 or s_l = 4 or s_l = 7 or s_l = 8 or s_l = 9)) then
					blue <= '0';
					red <= '1';
					green <= '0';
				 else
	 -- score left - Seg C --
				 if ((row > 75 and row < 80 and column > 250 and column < 275) and (s_l = 0 or s_l = 2 or s_l = 3 or s_l = 5 or s_l = 6 or s_l = 8 or s_l = 9))  then
					blue <= '0';
					red <= '1';
					green <= '0';
				 else
	 -- score left - Seg D --
				 if ((row > 50 and row < 75 and column > 245 and column < 250) and (s_l = 0 or s_l = 2 or s_l = 6 or s_l = 8))  then
					blue <= '0';
					red <= '1';
					green <= '0';
				 else
	 -- score left - Seg E --
				 if ((row > 20 and row < 45 and column > 245 and column < 250) and (s_l = 0 or s_l = 4 or s_l = 5 or s_l = 6 or s_l = 8 or s_l = 9))  then
					blue <= '0';
					red <= '1';
					green <= '0';
				 else
	 -- score left - Seg F --
				 if ((row > 15 and row < 20 and column > 250 and column < 275) and (s_l = 0 or s_l = 2 or s_l = 3 or s_l = 5 or s_l = 6 or s_l = 7 or s_l = 8 or s_l = 9))  then
					blue <= '0';
					red <= '1';
					green <= '0';
				 else
	 -- score left - Seg G --
				 if ((row > 45 and row < 50 and column > 250 and column < 275) and (s_l = 2 or s_l = 3 or s_l = 4 or s_l = 5 or s_l = 6 or s_l = 8 or s_l = 9))  then
					blue <= '0';
					red <= '1';
					green <= '0';
				 else
		 -- score right - Seg A --
					 if ((row > 20 and row < 45 and column > 390 and column < 395) and (s_r = 0 or s_r = 1 or s_r = 2 or s_r = 3 or s_r = 4 or s_r = 7 or s_r = 8 or s_r = 9))  then
						blue <= '1';
						red <= '0';
						green <= '0';
					 else
		 -- score right - Seg B --
					 if ((row > 50 and row < 75 and column > 390 and column < 395) and (s_r = 0 or s_r = 1 or s_r = 5 or s_r = 6 or s_r = 3 or s_r = 4 or s_r = 7 or s_r = 8 or s_r = 9))  then
						blue <= '1';
						red <= '0';
						green <= '0';
					 else
		 -- score right - Seg C --
					 if ((row > 75 and row < 80 and column > 365 and column < 390) and (s_r = 0 or s_r = 2 or s_r = 3 or s_r = 5 or s_r = 6 or s_r = 8 or s_r = 9))  then
						blue <= '1';
						red <= '0';
						green <= '0';
					 else
		 -- score right - Seg D --
					 if ((row > 50 and row < 75 and column > 360 and column < 365) and (s_r = 0 or s_r = 2 or s_r = 6 or s_r = 8))  then
						blue <= '1';
						red <= '0';
						green <= '0';
					 else
		 -- score right - Seg E --
					 if ((row > 20 and row < 45 and column > 360 and column < 365) and (s_r = 0 or s_r = 4 or s_r = 5 or s_r = 6 or s_r = 8 or s_r = 9))  then
						blue <= '1';
						red <= '0';
						green <= '0';
					 else
		 -- score right - Seg F --
					 if ((row > 15 and row < 20 and column > 365 and column < 390) and (s_r = 0 or s_r = 2 or s_r = 3 or s_r = 5 or s_r = 6 or s_r = 7 or s_r = 8 or s_r = 9))  then
						blue <= '1';
						red <= '0';
						green <= '0';
					 else
		 -- score right - Seg G --
					 if ((row > 45 and row < 50 and column > 365 and column < 390) and (s_r = 2 or s_r = 3 or s_r = 4 or s_r = 5 or s_r = 6 or s_r = 8 or s_r = 9))  then
						blue <= '1';
						red <= '0';
						green <= '0';
					 else
	 -- ball --
						 if (row > ball_pos_y and row < (ball_pos_y + 15) and column > ball_pos_x and column < (ball_pos_x + 15))  then
							blue <= '1';
							red <= '1';
							green <= '1';
						 else
							blue <= '0';
							red <= '0';
							green <= '0';
						 end if;	
					 end if;	
					 end if;
					 end if;
					 end if;
					 end if;
					 end if;
					 end if;	
				 end if;
				 end if;
				 end if;
				 end if;
				 end if;
				 end if;
				 end if;				 
			 end if;
		 end if;
	 end if;
	end process;

end architecture;