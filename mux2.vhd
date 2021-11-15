library ieee;
use ieee.std_logic_1164.all;
entity MUX2 is port(
 A, B: in std_logic;
 Sel: in std_logic;
 Y: out std_logic);
end MUX2;
architecture behavior of MUX2 is
begin

 process (Sel, A, B)
  
 begin
 if (Sel = '1') then
 Y <= B;
 else
 Y <= A;
 end if;
 end process;
end behavior;
