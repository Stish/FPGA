--------------------------------------------------------------------------------
-- Copyright (c) 1995-2010 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 12.3
--  \   \         Application : sch2hdl
--  /   /         Filename : TestSchem.vhf
-- /___/   /\     Timestamp : 06/26/2011 14:36:22
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan3e -flat -suppress -vhdl C:/Users/Alex/Dropbox/_Uni/Sem_05/HSD_Labor/RS232_test/TestSchem.vhf -w C:/Users/Alex/Dropbox/_Uni/Sem_05/HSD_Labor/RS232_test/TestSchem.sch
--Design Name: TestSchem
--Device: spartan3e
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity TestSchem is
   port ( CLK        : in    std_logic; 
          RESET      : in    std_logic; 
          RXD        : in    std_logic; 
          bit_clk    : out   std_logic; 
          DATA       : out   std_logic_vector (7 downto 0); 
          ENA        : out   std_logic; 
          LED        : out   std_logic_vector (7 downto 0); 
          RS         : out   std_logic; 
          TXD        : out   std_logic; 
          CLK_1000Hz : inout std_logic; 
          FLAG_R     : inout std_logic; 
          FLAG_T     : inout std_logic);
end TestSchem;

architecture BEHAVIORAL of TestSchem is
   signal XLXN_4     : std_logic_vector (7 downto 0);
   signal XLXN_14    : std_logic_vector (7 downto 0);
   signal XLXN_17    : std_logic;
   signal XLXN_18    : std_logic;
   signal XLXN_19    : std_logic_vector (7 downto 0);
   signal XLXN_20    : std_logic_vector (7 downto 0);
   signal LED_DUMMY  : std_logic_vector (7 downto 0);
   component receiver
      port ( CLK      : in    std_logic; 
             RXD      : in    std_logic; 
             RESET    : in    std_logic; 
             FLAG_R   : inout std_logic; 
             DATA_OUT : out   std_logic_vector (7 downto 0));
   end component;
   
   component transmitter
      port ( CLK     : in    std_logic; 
             RESET   : in    std_logic; 
             DATA_IN : in    std_logic_vector (7 downto 0); 
             FLAG_T  : inout std_logic; 
             TXD     : out   std_logic; 
             bit_clk : out   std_logic);
   end component;
   
   component Test_Data_out
      port ( FLAG_T      : in    std_logic; 
             clk         : in    std_logic; 
             DATA_OUT    : out   std_logic_vector (7 downto 0); 
             FLAG_R      : in    std_logic; 
             DATA_IN     : in    std_logic_vector (7 downto 0); 
             RD_RAM      : out   std_logic; 
             WRT_RAM     : out   std_logic; 
             RAM_OUT     : out   std_logic_vector (7 downto 0); 
             RAM_ADDRESS : out   std_logic_vector (7 downto 0));
   end component;
   
   component LCD_Controller
      port ( CLK        : in    std_logic; 
             RESET      : in    std_logic; 
             DATA_IN    : in    std_logic_vector (7 downto 0); 
             CLK_1000Hz : inout std_logic; 
             ENABLE     : out   std_logic; 
             RS         : out   std_logic; 
             DATA_OUT   : out   std_logic_vector (7 downto 0));
   end component;
   
   component RAM
      port ( RD       : in    std_logic; 
             WRT      : in    std_logic; 
             DATA_IN  : in    std_logic_vector (7 downto 0); 
             ADDRESS  : in    std_logic_vector (7 downto 0); 
             DATA_OUT : out   std_logic_vector (7 downto 0); 
             CLK      : in    std_logic);
   end component;
   
begin
   LED(7 downto 0) <= LED_DUMMY(7 downto 0);
   XLXI_4 : receiver
      port map (CLK=>CLK,
                RESET=>RESET,
                RXD=>RXD,
                DATA_OUT(7 downto 0)=>LED_DUMMY(7 downto 0),
                FLAG_R=>FLAG_R);
   
   XLXI_5 : transmitter
      port map (CLK=>CLK,
                DATA_IN(7 downto 0)=>XLXN_4(7 downto 0),
                RESET=>RESET,
                bit_clk=>bit_clk,
                TXD=>TXD,
                FLAG_T=>FLAG_T);
   
   XLXI_6 : Test_Data_out
      port map (clk=>CLK,
                DATA_IN(7 downto 0)=>LED_DUMMY(7 downto 0),
                FLAG_R=>FLAG_R,
                FLAG_T=>FLAG_T,
                DATA_OUT(7 downto 0)=>XLXN_4(7 downto 0),
                RAM_ADDRESS(7 downto 0)=>XLXN_19(7 downto 0),
                RAM_OUT(7 downto 0)=>XLXN_20(7 downto 0),
                RD_RAM=>XLXN_17,
                WRT_RAM=>XLXN_18);
   
   XLXI_8 : LCD_Controller
      port map (CLK=>CLK,
                DATA_IN(7 downto 0)=>XLXN_14(7 downto 0),
                RESET=>RESET,
                DATA_OUT(7 downto 0)=>DATA(7 downto 0),
                ENABLE=>ENA,
                RS=>RS,
                CLK_1000Hz=>CLK_1000Hz);
   
   XLXI_9 : RAM
      port map (ADDRESS(7 downto 0)=>XLXN_19(7 downto 0),
                CLK=>CLK,
                DATA_IN(7 downto 0)=>XLXN_20(7 downto 0),
                RD=>XLXN_17,
                WRT=>XLXN_18,
                DATA_OUT(7 downto 0)=>XLXN_14(7 downto 0));
   
end BEHAVIORAL;


