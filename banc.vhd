library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;


entity banc_reg is
    Port ( rx_num : in  std_logic_vector(5 downto 0);
din : in  std_logic_vector(15 downto 0);
 rx_ce : in  std_logic;
acc_ce : in  std_logic;
pc_ce : in  std_logic;
rpc_ce : in  std_logic;
clk : in  std_logic;
rst: in  std_logic;
 rx_out : out  std_logic_vector(15 downto 0);
acc_out : out  std_logic_vector(15 downto 0);
pc_out : out  std_logic_vector(15 downto 0));
end banc_reg;

 
architecture arch_banc of banc_reg is

type T_DATA is array (63 downto 0) of std_logic_vector(15 downto 0);
signal  data : T_DATA;
signal sel:std_logic_vector(5 downto 0);
signal sel_int:integer;

begin

rxn: process(rx_num,rx_ce)
	
	sel <= rx_num;
sel_int <= to_integer(unsigned(sel));

	begin
	  
if rising_edge (clk) then
if (rx_ce='1') then 
  
  

for i in 0 to 63 loop
  
  case sel_int is
    
 when i => rx_out<= data(i);
   


end case;
end loop;

end if;

acc_out <= data(0);
pc_out <= data(63);
 
		end process rxn;

	
update: process(clk,acc_ce,pc_ce,rpc_ce,rx_ce,din)


begin
if(clk'event and clk='1') then
  
if(acc_ce='1') then
data(0) <= din;
elsif(pc_ce='1') then
data(63)<=din;
elsif(rpc_ce='1') then
data(62)<=din;
elsif(rx_ce='1') then
data(sel_int)<=din;
end if;

end if;
end process update;

rstn : process(rst)
begin
if (rst='1') then
for i in 0 to 63 loop
data(i)<="0000000000000000";
end loop;
end if;
end process rstn;






end arch_banc;

 
