-- hds header_start
-- ==============================================================================
-- Cordic Shift Right preserving sign bit
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
-- 0.1       Hans Tiggeler   10/03/2000    Tested on Modelsim SE 5.5
-- ==============================================================================
-- hds header_end
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


ENTITY shiftn IS
   GENERIC( 
      width : integer := 32
   );
   PORT( 
      ibus : IN     std_logic_vector (WIDTH-1 DOWNTO 0);
      obus : OUT    std_logic_vector (WIDTH-1 DOWNTO 0);
      n    : IN     std_logic_vector (4 DOWNTO 0)
   );

-- Declarations

END shiftn ;

-- hds interface_end


architecture synthesis of shiftn is

-- Note fixed barrel shifter, do not change 31 to WIDTH
constant null_s : std_logic_vector(31 downto 0):=X"00000000";
signal ibus_s 	: std_logic_vector(31 DOWNTO 0);
signal obus_s 	: std_logic_vector(31 DOWNTO 0);

begin

  ibus_s <= ibus & null_s(31-WIDTH downto 0);
  obus   <= obus_s(31 downto 32-WIDTH);

  process(n,ibus_s)
    begin
      case n is 
        when "00000" => obus_s <= ibus_s(31)&ibus_s(30 downto 0); -- ibus_s
        when "00001" => obus_s <= ibus_s(31)&ibus_s(31)&ibus_s(30 downto 1);
        when "00010" => obus_s <= ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(30 downto 2); 
        when "00011" => obus_s <= ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(30 downto 3);      
        when "00100" => obus_s <= ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(30 downto 4);     
        when "00101" => obus_s <= ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(30 downto 5);     
        when "00110" => obus_s <= ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(30 downto 6);     
        when "00111" => obus_s <= ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&
        					           ibus_s(31)&ibus_s(30 downto 7);     
        when "01000" => obus_s <= ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&
                                ibus_s(31)&ibus_s(31)&ibus_s(30 downto 8);     
        when "01001" => obus_s <= ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&
                                ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(30 downto 9);     
        when "01010" => obus_s <= ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&
                                ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(30 downto 10);     
        when "01011" => obus_s <= ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&
                                ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(30 downto 11);     
        when "01100" => obus_s <= ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&
                                ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(30 downto 12);     
        when "01101" => obus_s <= ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&
                                ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(30 downto 13);     
        when "01110" => obus_s <= ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&
                                ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(30 downto 14);     
        when "01111" => obus_s <= ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&
                                ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(30 downto 15);                
        when "10000" => obus_s <= ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&
		                          ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&
										  ibus_s(30 downto 16);    
        when "10001" => obus_s <= ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&
		                          ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&
										  ibus_s(31)&ibus_s(30 downto 17);  
        when "10010" => obus_s <= ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&
		                          ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&
										  ibus_s(31)&ibus_s(31)&ibus_s(30 downto 18);  
        when "10011" => obus_s <= ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&
		                          ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&
										  ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(30 downto 19);     
        when "10100" => obus_s <= ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&
		                          ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&
										  ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(30 downto 20);    
        when "10101" => obus_s <= ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&
		                          ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&
										  ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(30 downto 21);   
        when "10110" => obus_s <= ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&
		                          ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&
										  ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(30 downto 22);      
        when "10111" => obus_s <= ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&
		                          ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&
										  ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(30 downto 23);      
        when "11000" => obus_s <= ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&
		                          ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&
										  ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(30 downto 24);  
        when "11001" => obus_s <= ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&
		                          ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&
										  ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(30 downto 25);  
        when "11010" => obus_s <= ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&
		                          ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&
										  ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&
										  ibus_s(30 downto 26);    
        when "11011" => obus_s <= ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&
		                          ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&
										  ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&
										  ibus_s(31)&ibus_s(30 downto 27);      
        when "11100" => obus_s <= ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&
		                          ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&
										  ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&
										  ibus_s(31)&ibus_s(31)&ibus_s(30 downto 28);      
        when "11101" => obus_s <= ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&
		                          ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&
										  ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&
										  ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(30 downto 29);      
        when "11110" => obus_s <= ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&
		                          ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&
										  ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&
										  ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(30);     
        when others  => obus_s <= ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&
		                          ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&
										  ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&
										  ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31)&ibus_s(31);  
      end case;        
  end process;  
      
end synthesis;


