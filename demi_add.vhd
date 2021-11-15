Library IEEE ;
USE ieee.std_logic_1164.all ;

entity PORTE is
 Port ( A, B : in std_logic ;
 S : out std_logic ) ;
end PORTE;

architecture ARCH_PORTE of porte is
begin
 S<= A and B ;
end ARCH_PORTE ; 