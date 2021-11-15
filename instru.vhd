library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity instruction is
 Port ( ce : in  STD_LOGIC;
 rst : in  STD_LOGIC;
clk : in  STD_LOGIC;
inst: in  std_logic_vector(15 downto 0);
cond : out  std_logic_vector(3 downto 0);
 op : out  std_logic_vector(3 downto 0);
updt : out  STD_LOGIC;
imm : out std_logic;
val : out  std_logic_vector(5 downto 0));

end instruction;

architecture arch_ins of instruction is
begin
  
process(clk)
begin
  
if(clk'event and clk='1') then
if(ce='1') then
  cond <= inst(15 downto 12);
  op <= inst(11 downto 8);
  updt <= inst(7);
  imm <= inst(6);
  val <= inst(5 downto 0);
  
  
elsif(rst='1') then
  
  cond <= "0000";
  op <= "0000";
  updt <='0';
  imm <= '0';
  val <= "000000";
  
  
end if;
end if;
  




end process;
end arch_ins;

