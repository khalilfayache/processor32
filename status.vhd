library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity status_reg is
    Port ( in_s: in  std_logic_vector(3 downto 0);
out_s: out   std_logic_vector(3 downto 0);
status_ce : in  std_logic;
clk : in  std_logic;
rst: in  std_logic);
end status_reg;

architecture arch_status of status_reg is
begin
  process(clk)
begin
if(clk'event and clk='1') then
  
 if(status_ce='1') then
  out_s <= in_s; 
 elsif(rst='1') then
  out_s <="0000";
end if;

end if;
end process;
end arch_status;

