library ieee;
use ieee.std_logic_1164.all;

entity mux3 is port(
 A,B,C: in std_logic_vector(15 downto 0);
 Sel: in std_logic_vector(1 downto 0);
 Y: out std_logic_vector(15 downto 0));
    
end mux3;
architecture arch_mux3 of mux3 is
begin
 process (Sel, A, B) -- rerun process if any changes, sensitivity list, all inputs
 begin
 if (Sel = "01") then
 Y <= B;
elsif(Sel="10") then
Y<= C;
 else
 Y <= A;
 end if;
 end process;
end arch_mux3;
