--------------------------------------------------------------------------------
-- Copyright (c) 1995-2010 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 12.3
--  \   \         Application : sch2hdl
--  /   /         Filename : Miniprojekt.vhf
-- /___/   /\     Timestamp : 01/04/2011 22:25:49
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan3e -flat -suppress -vhdl C:/Work/_Uni/Sem_04/EDA/Xilinx/EDA_Miniprojekt/Miniprojekt.vhf -w C:/Work/_Uni/Sem_04/EDA/Xilinx/EDA_Miniprojekt/Miniprojekt.sch
--Design Name: Miniprojekt
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

entity Miniprojekt is
   port ( B8     : in    std_logic; 
          l_down : in    std_logic; 
          l_up   : in    std_logic; 
          r_down : in    std_logic; 
          r_up   : in    std_logic; 
          start  : in    std_logic; 
          P6     : out   std_logic; 
          R8     : out   std_logic; 
          T4     : out   std_logic; 
          U3     : out   std_logic; 
          U4     : out   std_logic);
end Miniprojekt;

architecture BEHAVIORAL of Miniprojekt is
   signal XLXN_1 : std_logic;
   signal XLXN_2 : std_logic;
   component vgatest
      port ( clock      : in    std_logic; 
             clk_ctrl   : in    std_logic; 
             left_up    : in    std_logic; 
             left_down  : in    std_logic; 
             right_up   : in    std_logic; 
             right_down : in    std_logic; 
             R          : out   std_logic; 
             G          : out   std_logic; 
             B          : out   std_logic; 
             H          : out   std_logic; 
             V          : out   std_logic; 
             start      : in    std_logic);
   end component;
   
   component Clk_div_2
      port ( Clk_in  : in    std_logic; 
             Clk_out : inout std_logic);
   end component;
   
   component clk_div_ctrl
      port ( clk_50mhz : in    std_logic; 
             clk_ctrl  : inout std_logic);
   end component;
   
begin
   XLXI_2 : vgatest
      port map (clk_ctrl=>XLXN_2,
                clock=>XLXN_1,
                left_down=>l_down,
                left_up=>l_up,
                right_down=>r_down,
                right_up=>r_up,
                start=>start,
                B=>U4,
                G=>P6,
                H=>T4,
                R=>R8,
                V=>U3);
   
   XLXI_3 : Clk_div_2
      port map (Clk_in=>B8,
                Clk_out=>XLXN_1);
   
   XLXI_4 : clk_div_ctrl
      port map (clk_50mhz=>B8,
                clk_ctrl=>XLXN_2);
   
end BEHAVIORAL;


