-- hds header_start
-- ==============================================================================
-- Cordic Tester 
-- 
-- This library is free software; you can redistribute it and/or modify it 
-- under the terms of the GNU Lesser General Public License as published 
-- by the Free Software Foundation; either version 2.1 of the License, or 
-- (at your option) any later version.
-- 
-- This library is distributed in the hope that it will be useful, but WITHOUT
-- ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-- FITNESS FOR A PARTICULAR PURPOSE.   See the GNU Lesser General Public 
-- License for more details.   See http://www.gnu.org/copyleft/lesser.txt
-- 
-- ------------------------------------------------------------------------------
-- Version   Author          Date          Changes
-- 0.1       Hans Tiggeler   10/03/00      Tested on Modelsim SE 5.5
-- ==============================================================================
-- hds header_end
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.ALL;

LIBRARY Cordic;
USE Cordic.cordic_pkg.ALL;
LIBRARY std;
USE std.textio.all;

ENTITY cordic_tester IS
   GENERIC( 
      WIDTH       : integer := 24;
      COMPARE_END : integer := 8;
      FILENAME    : string  := "../src/cordic_tester/behavioral.vhd.info/testvec.txt"
   );
   PORT( 
      clk   : IN     std_logic;
      cos   : IN     std_logic_vector (WIDTH-1 DOWNTO 0);
      done  : IN     std_logic;
      reset : IN     std_logic;
      sin   : IN     std_logic_vector (WIDTH-1 DOWNTO 0);
      angle : OUT    std_logic_vector (WIDTH-1 DOWNTO 0);
      start : OUT    std_logic
   );

-- Declarations

END cordic_tester ;

-- hds interface_end
ARCHITECTURE behavioral OF cordic_tester IS

signal angle_s : std_logic_vector(WIDTH-1 downto 0);

function compare(vector1:bit_vector; vector2:bit_vector; cbit:integer)
  return boolean is
begin
  for K in WIDTH-1 downto COMPARE_END loop
      if vector1(k)/=vector2(k) then 
         return FALSE;
	  end if;
  end loop; 
  return TRUE;
end compare;

BEGIN

 process
   variable L, BUF : line; -- used for monitor
													 
   file testvec_file : text open Read_Mode  is FILENAME; 	 -- see side data of tester module
   variable angle_v : bit_vector(WIDTH-1 downto 0);
   variable sin_v 	: bit_vector(WIDTH-1 downto 0);
   variable cos_v 	: bit_vector(WIDTH-1 downto 0);

   begin
   	
     start <= '0';
     angle <= (others => '0');  
     wait for 200 ns;
     wait until reset='1'; 				-- Wait until reset negated
	 wait for 200 ns;

     write(L,string'("Comparing from bit "));
     write(L,WIDTH-1);
	 write(L,string'(" downto "));
	 write(L,COMPARE_END);
	 writeline(output,L);

	 while not ENDFILE(testvec_file) loop
	    readline(testvec_file,BUF);
        read (BUF,angle_v);		   		-- Read Angle
		read (BUF,sin_v);		   		-- Read Angle
		read (BUF,cos_v);		   		-- Read Angle

        angle <= To_UX01(angle_v);
	   		
		start <= '1';     				-- Start Cordic Conversion
		wait until rising_edge(clk);
		start <= '0';
		wait until falling_edge(done);

		write(L,string'("Angle="));
		write(L,std_to_hex(To_UX01(angle_v)));
		write(L,string'(" Sin="));
		write(L,std_to_hex(sin));
		write(L,string'(" Expected="));
		write(L,std_to_hex(To_UX01(sin_v)));
		write(L,string'("   Cos="));
		write(L,std_to_hex(cos));
		write(L,string'(" Expected="));
		write(L,std_to_hex(To_UX01(cos_v)));
		
		if compare(To_bitvector(sin),sin_v,COMPARE_END)=TRUE then
		   write (L,string'(" PASS"));	
	    else
		   write (L,string'(" *** FAIL ***"));	
		end if;
		writeline(output,L);
  		

     end loop;
 
	 assert FALSE report "*** End of Test ***" severity failure;

   end process;

END behavioral;
