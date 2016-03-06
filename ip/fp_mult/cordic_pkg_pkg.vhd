-- ==============================================================================
-- Cordic Package File
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
-- 0.1       Hans Tiggeler   10/03/2000      Tested on Modelsim SE 5.5
-- ==============================================================================
        
library IEEE;
use IEEE.std_logic_1164.all;

package cordic_pkg is

  function std_to_natural   (Bits_c : Std_Logic_Vector) return natural;
  function natural_to_strhex(Data_c : natural)          return string;
  function strhex_to_natural(str    : string)           return natural;
  function std_to_string    (inp    : std_logic_vector) return string;
  function std_to_hex       (Vec    : std_logic_vector) return string; -- Std to hex string
      
end cordic_pkg; 

  
package body cordic_pkg is

 function std_to_hex(Vec : std_logic_vector) return string is
    constant L       : natural := Vec'length;
    alias MyVec      : std_logic_vector(L - 1 downto 0) is Vec;
    constant LVecFul : natural := ((L - 1)/4 + 1)*4;
    variable VecFul  : std_logic_vector(LVecFul - 1 downto 0) 
                                    := (others => '0');
    constant StrLgth : natural := LVecFul/4;
    variable Res     : string(1 to StrLgth) := (others => ' ');
    variable TempVec : std_logic_vector(3 downto 0);
    variable i       : integer := LVecFul - 1;
    variable Index   : natural := 1;
  begin
    assert L > 1 report "(std_to_hex) requires a vector!" severity error;
    
    VecFul(L - 1 downto 0) := MyVec(L -1 downto 0);
    
    while (i - 3 >= 0) loop
      TempVec(3 downto 0) := VecFul(i downto i - 3);
      case TempVec(3 downto 0) is
         when "0000" => Res(Index) := '0';
         when "0001" => Res(Index) := '1';
         when "0010" => Res(Index) := '2';
         when "0011" => Res(Index) := '3';
         when "0100" => Res(Index) := '4';
         when "0101" => Res(Index) := '5';
         when "0110" => Res(Index) := '6';
         when "0111" => Res(Index) := '7';
         when "1000" => Res(Index) := '8';
         when "1001" => Res(Index) := '9';
         when "1010" => Res(Index) := 'A';
         when "1011" => Res(Index) := 'B';
         when "1100" => Res(Index) := 'C';
         when "1101" => Res(Index) := 'D';
         when "1110" => Res(Index) := 'E';
         when "1111" => Res(Index) := 'F';
         when others => Res(Index) := 'x';
      end case; -- TempVec(3 downto 0) 
      Index := Index + 1;
      i := i - 4;
    end loop;
    
    return Res;
    
  end std_to_hex;

-------------------------------------------------------------------------------
--  Function: Std_to_Natural  converts a Std_Logic_Vector to natural number
--            Std_Logic_Vector number is unsigned
--            Number of bits cannot exceed 31 since this is the
--            largest natural number = 2**31 -1 
--
--  Writen by Ben Cohen
-------------------------------------------------------------------------------
function std_to_natural(Bits_c  : Std_Logic_Vector)  return natural is
    alias ABits_c : Std_Logic_Vector(Bits_c'length - 1 downto 0) is Bits_c;
    variable  Result_v : natural := 0;
    type Powers_Typ is array(0 to 30) of natural;
    constant Powers_c : Powers_Typ :=    --   2**nth power weights
      (0  => 1,
       1  => 2,
       2  => 4,
       3  => 8,
       4  => 16,
       5  => 32,
       6  => 64,
       7  => 128,
       8  => 256,
       9  => 512,
       10 => 1024,
       11 => 2 ** 11,
       12 => 2 ** 12,
       13 => 2 ** 13,
       14 => 2 ** 14,
       15 => 2 ** 15,
       16 => 2 ** 16,
       17 => 2 ** 17,
       18 => 2 ** 18,
       19 => 2 ** 19,
       20 => 2 ** 20,
       21 => 2 ** 21,
       22 => 2 ** 22,
       23 => 2 ** 23,
       24 => 2 ** 24,
       25 => 2 ** 25,
       26 => 2 ** 26,
       27 => 2 ** 27,
       28 => 2 ** 28,
       29 => 2 ** 29,
       30 => 2 ** 30);
      begin
      if Abits_c'length > 31 then 
        return 0;
        assert false
          report " Input number is out of range"
          severity warning;
      end if;
      Weights_Lbl : for Ix_i in ABits_c'range loop
        if Abits_c(Ix_i) = '1' then
          Result_v := Result_v + Powers_c(Ix_i);
        end if;
      end loop Weights_Lbl;
      return Result_v;
end std_to_natural;

function natural_to_strhex(Data_c :natural) return string is  -- in hex notation
    constant MaxLen_c     : natural := 32;  
    variable Result_v     : string(80 downto 1) := (others => ' ');
    variable Data_v       : natural := Data_c;
    constant Base_c       : natural := 16;
      
  begin
   Lp_Lbl: for Ix_i in 1 to MaxLen_c loop
      case Data_v mod Base_c is
        when 0  => Result_v(Ix_i) := '0';
        when 1  => Result_v(Ix_i) := '1';
        when 2  => Result_v(Ix_i) := '2';
        when 3  => Result_v(Ix_i) := '3';
        when 4  => Result_v(Ix_i) := '4';
        when 5  => Result_v(Ix_i) := '5';
        when 6  => Result_v(Ix_i) := '6';
        when 7  => Result_v(Ix_i) := '7';
        when 8  => Result_v(Ix_i) := '8';
        when 9  => Result_v(Ix_i) := '9';
        when 10 => Result_v(Ix_i) := 'A';
        when 11 => Result_v(Ix_i) := 'B';
        when 12 => Result_v(Ix_i) := 'C';
        when 13 => Result_v(Ix_i) := 'D';
        when 14 => Result_v(Ix_i) := 'E';
        when 15 => Result_v(Ix_i) := 'F';
        when others => null;
      end case;
      Data_v := Data_v / Base_c;
      if Data_v = 0 then
        return Result_v(Ix_i downto 1);
      end if;
    end loop Lp_Lbl;
  end natural_to_strhex;


function strhex_to_natural(str : in string) return natural is
  variable result_v : natural:=0;  
  variable power  : natural := 1;
  variable ch0: character:='0';        -- Solved the type mismatch
  variable ch9: character:='9';   

begin
    
 for i in 1 to str'length loop
    if (ch0 <= str(i) and str(i) <= ch9) then  --Solved the type mismatch
       result_v := result_v + power * (character'pos(str(i)) - character'pos('0'));
    else
       result_v := result_v + power * (character'pos(str(i)) - character'pos('A') + 10);
    end if;
     
    power := power * 16; 
 end loop;
    
 return result_v;
end strhex_to_natural;


function std_to_string(inp: std_logic_vector) return string is
   variable temp: string(inp'left downto inp'right) := (others => 'X');   
 begin
   for i in inp'left downto inp'right loop
        if (inp(i) = '1') then
             temp(i) := '1';
          elsif (inp(i) = '0') then
              temp(i) := '0'; 
          end if;
       end loop;
       return temp;
 end std_to_string;

end package body cordic_pkg;

 



