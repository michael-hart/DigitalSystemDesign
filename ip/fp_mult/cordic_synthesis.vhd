-- hds header_start
--
-- VHDL Entity Cordic.cordic.symbol
--
-- Created:
--          by - Hans.UNKNOWN (ACHILLES)
--          at - 14:55:58 03/29/03
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2002.1b (Build 7)
--
-- This library is free software; you can redistribute it and/or modify it 
-- under the terms of the GNU Lesser General Public License as published 
-- by the Free Software Foundation; either version 2.1 of the License, or 
-- (at your option) any later version.
--
-- This library is distributed in the hope that it will be useful, but WITHOUT 
-- ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-- FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public 
-- License for more details.	 See http://www.gnu.org/copyleft/lesser.txt
--
-- hds header_end
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library cordic;
use cordic.all;

ENTITY cordic IS
   GENERIC( 
      WIDTH : integer := 24
   );
   PORT( 
      clk   : IN     std_logic;
      reset : IN     std_logic;                            -- Active low reset
      angle : IN     std_logic_vector (WIDTH-1 DOWNTO 0);  -- input radian
      sin   : OUT    std_logic_vector (WIDTH-1 DOWNTO 0);
      cos   : OUT    std_logic_vector (WIDTH-1 DOWNTO 0);
      start : IN     std_logic;
      done  : OUT    std_logic
   );

-- Declarations

END cordic ;

-- hds interface_end
--
-- VHDL Architecture Cordic.cordic.synthesis
--
-- Created:
--          by - Hans.UNKNOWN (ACHILLES)
--          at - 14:55:59 03/29/03
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2002.1b (Build 7)
--
-- This library is free software; you can redistribute it and/or modify it 
-- under the terms of the GNU Lesser General Public License as published 
-- by the Free Software Foundation; either version 2.1 of the License, or 
-- (at your option) any later version.
--
-- This library is distributed in the hope that it will be useful, but WITHOUT 
-- ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-- FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public 
-- License for more details.	 See http://www.gnu.org/copyleft/lesser.txt

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;

LIBRARY cordic;

ARCHITECTURE synthesis OF cordic IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL cnt_s   : std_logic_vector(4 DOWNTO 0);          -- -- bit counter, 2^5
   SIGNAL newx_s  : std_logic_vector(WIDTH-1 DOWNTO 0);
   SIGNAL newy_s  : std_logic_vector(WIDTH-1 DOWNTO 0);
   SIGNAL newz_s  : std_logic_vector(WIDTH-1 DOWNTO 0);
   SIGNAL xreg_s  : std_logic_vector(WIDTH-1 DOWNTO 0);
   SIGNAL yreg_s  : std_logic_vector(WIDTH-1 DOWNTO 0);
   SIGNAL zreg_s  : std_logic_vector(WIDTH-1 DOWNTO 0);
   SIGNAL atan_s  : std_logic_vector(WIDTH-1 DOWNTO 0);    -- -- arctan LUT
   SIGNAL init_s  : std_logic;
   SIGNAL load_s  : std_logic;
   SIGNAL as_s    : std_logic;
   SIGNAL syreg_s : std_logic_vector(WIDTH-1 DOWNTO 0);
   SIGNAL sxreg_s : std_logic_vector(WIDTH-1 DOWNTO 0);
   SIGNAL dout    : std_logic;


constant xinit_c : std_logic_vector(31 downto 0) := X"26dd3b44";


   -- Component Declarations
   COMPONENT addsub
   GENERIC (
      WIDTH : integer := 32
   );
   PORT (
      abus : IN     std_logic_vector (WIDTH-1 DOWNTO 0);
      bbus : IN     std_logic_vector (WIDTH-1 DOWNTO 0);
      obus : OUT    std_logic_vector (WIDTH-1 DOWNTO 0);
      as   : IN     std_logic 
   );
   END COMPONENT;
   COMPONENT atan32
   GENERIC (
      WIDTH : integer := 24
   );
   PORT (
      za    : IN     std_logic_vector (4 DOWNTO 0);
      zdata : OUT    std_logic_vector (WIDTH-1 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT fsm
   PORT (
      clk   : IN     std_logic ;
      reset : IN     std_logic ;                  -- Active low reset
      start : IN     std_logic ;
      cnt   : IN     std_logic_vector (4 DOWNTO 0);
      init  : OUT    std_logic ;
      load  : OUT    std_logic ;
      done  : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT shiftn
   GENERIC (
      width : integer := 32
   );
   PORT (
      ibus : IN     std_logic_vector (WIDTH-1 DOWNTO 0);
      obus : OUT    std_logic_vector (WIDTH-1 DOWNTO 0);
      n    : IN     std_logic_vector (4 DOWNTO 0)
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ADD1 : addsub USE ENTITY cordic.addsub;
   FOR ADD2 : addsub USE ENTITY cordic.addsub;
   FOR ADD3 : addsub USE ENTITY cordic.addsub;
   FOR ALL : atan32 USE ENTITY cordic.atan32;
   FOR ALL : fsm USE ENTITY cordic.fsm;
   FOR ALL : shiftn USE ENTITY cordic.shiftn;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 2 X_Register
   -- COS(X) Register
    process (clk,newx_s) 
     begin
       if (rising_edge(clk)) then
          if init_s='1' then xreg_s(WIDTH-1 downto 0) <= xinit_c(31 downto 32-WIDTH); -- 0.607     
          elsif load_s='1' then xreg_s <= newx_s;                   
          end if;
      end if;   
    end process;

   -- HDL Embedded Text Block 3 Y_Register
   -- SIN(Y) Register
    process (clk,newy_s) 
     begin
       if (rising_edge(clk)) then
          if init_s='1' then yreg_s <= (others => '0'); -- 0.0000
          elsif load_s='1' then yreg_s <= newy_s;                   
          end if;
      end if;   
    end process;

   -- HDL Embedded Text Block 4 Z_Register
   -- Z Register
    process (clk,newz_s,angle) 
     begin
       if (rising_edge(clk)) then
          if init_s='1' then zreg_s <= angle;          -- x
          elsif load_s='1' then zreg_s <= newz_s;                   
          end if;
      end if;   
    end process;

   -- HDL Embedded Text Block 5 eb5
   -- MSB=Sign bit
   as_s <= zreg_s(WIDTH-1);

   -- HDL Embedded Text Block 6 Counter
   process (clk,load_s,init_s) -- bit counter
     begin
       if (rising_edge(clk)) then   
          if init_s='1' then cnt_s<=(others=> '0');
           elsif (load_s='1') then cnt_s <= cnt_s + '1';
          end if;   
       end if;   
    end process;

   -- HDL Embedded Text Block 7 eb7
   sin   <= yreg_s;
   cos  <= xreg_s;


   -- ModuleWare code for instance 'I0' of 'inv'
      dout <= NOT(as_s);
   -- Instance port mappings.
   ADD1 : addsub
      GENERIC MAP (
         WIDTH => WIDTH
      )
      PORT MAP (
         abus => xreg_s,
         bbus => syreg_s,
         obus => newx_s,
         as   => as_s
      );
   ADD2 : addsub
      GENERIC MAP (
         WIDTH => WIDTH
      )
      PORT MAP (
         abus => yreg_s,
         bbus => sxreg_s,
         obus => newy_s,
         as   => dout
      );
   ADD3 : addsub
      GENERIC MAP (
         WIDTH => WIDTH
      )
      PORT MAP (
         abus => zreg_s,
         bbus => atan_s,
         obus => newz_s,
         as   => as_s
      );
   LUT : atan32
      GENERIC MAP (
         WIDTH => WIDTH
      )
      PORT MAP (
         za    => cnt_s,
         zdata => atan_s
      );
   FSM1 : fsm
      PORT MAP (
         clk   => clk,
         reset => reset,
         start => start,
         cnt   => cnt_s,
         init  => init_s,
         load  => load_s,
         done  => done
      );
   SHIFT1 : shiftn
      GENERIC MAP (
         width => WIDTH
      )
      PORT MAP (
         ibus => xreg_s,
         obus => sxreg_s,
         n    => cnt_s
      );
   SHIFT2 : shiftn
      GENERIC MAP (
         width => WIDTH
      )
      PORT MAP (
         ibus => yreg_s,
         obus => syreg_s,
         n    => cnt_s
      );

END synthesis;
