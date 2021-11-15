library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;


entity ual is
port(op1,op2: in std_logic_vector(15 downto 0);
code : in std_logic_vector(3 downto 0);
port_in : out std_logic_vector(3 downto 0);
a : out std_logic_vector(15 downto 0)) ;
end ual;

architecture arch_ual of ual is
   begin
process(code)
begin

case code(3 downto 0) is
when "0000" => a <= op1 and op2;
when "0001" => a <= op1 or op2;
when "0010" => a <= op1 xor op2;
when "0011" => a <= not(op2);
when "0100" => a <= op1 + op2;
when "0101" => a <= op1 - op2;
when "0110" => a <= STD_LOGIC_VECTOR(shift_left(unsigned(op1), to_integer(unsigned(op2(15 downto 0)))));

when "0111" => a <= STD_LOGIC_VECTOR(shift_right(unsigned(op1), to_integer(unsigned(op2(15 downto 0)))));

when "1000" =>  a <= op1; 
when "1001" => a <= op2;
when "1010" => a <= op2;
when "1011" => a <= op1 ;
when "1100" => a <= op1 + op2;
when "1101" => a <= op1 - op2;
when "1110" => a <= op2;
when "1111" => a <= op2;

when others => a<=op1;

end case;

 

end process;

end arch_ual;

