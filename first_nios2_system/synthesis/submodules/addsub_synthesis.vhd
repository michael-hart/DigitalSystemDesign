-- hds header_start
-- ==============================================================================
-- Cordic 
-- Adder/Subtracter
-- no overflow.
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


ENTITY addsub IS
   GENERIC( 
      WIDTH : integer := 32
   );
   PORT( 
      abus : IN     std_logic_vector (WIDTH-1 DOWNTO 0);
      bbus : IN     std_logic_vector (WIDTH-1 DOWNTO 0);
      obus : OUT    std_logic_vector (WIDTH-1 DOWNTO 0);
      as   : IN     std_logic
   );

-- Declarations

END addsub ;

-- hds interface_end


architecture synthesis of addsub is

begin

  process(as,abus,bbus)
    begin
      if as='1' then 
         obus <= abus + bbus;
      else
         obus <= abus - bbus;
    end if;        
  end process;  
      
end synthesis;


