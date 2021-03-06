library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity uc is
Port ( inst_cond: in  std_logic_vector(3 downto 0);
inst_op: in  std_logic_vector(3 downto 0);
inst_updt: in  std_logic;
 rx_ce : out  std_logic;
acc_ce : out  std_logic;
pc_ce : out  std_logic;
rpc_ce : out  std_logic;
status_ce : out  std_logic;
inst_ce : out  std_logic;
sel_op1 : out  std_logic;
sel_ram_addr : out std_logic;
sel_rf_din : out std_logic_vector(1 downto 0);
status : in std_logic_vector(3 downto 0);
clk : in  std_logic;
rst: in  std_logic;
ram_we : out std_logic);
end uc;

architecture arch_uc of uc is
signal V : std_logic;
signal C : std_logic;
signal N : std_logic;
signal Z : std_logic;
signal branch : std_logic; 
   
begin
  
process(clk)


	begin
if(clk'event and clk='1') then

V<=status(1);
C<=status(1);
N<=status(2);
Z<=status(3);

	case inst_cond is
		when "0000" => branch <= '0';
		when "0001" => branch <= '1';
		when "0010" => branch <= Z;
		when "0011" => branch <= not(Z) ;
		when "0100" => branch <= not(N) and not(Z);
		when "0101" => branch <= Z or N;
		when "0110" => branch <= N;
		when "0111" => branch <= not(N);
    when "1000" => branch <= C;
    	when "1001" => branch <= not(C);
		when "1010" => branch <= V;
		when "1011" => branch <= not(V);
		 when others => branch <= '0';
	end case;
	
	 if(branch ='1') then
	   
	case inst_op is	  
	    when "0000" =>
	      sel_rf_din<="01";
	      sel_op1<='0';
	      acc_ce<='1';
	      pc_ce<='0';
	      rpc_ce<='0';
	      rx_ce<='0';
	      
	      when "0001" =>
	      sel_rf_din<="01";
	      sel_op1<='0';
	      acc_ce<='1';
	      pc_ce<='0';
	      rpc_ce<='0';
	      rx_ce<='0';
	      
	      when "0010" =>
	      sel_rf_din<="01";
	      sel_op1<='0';
	      acc_ce<='1';
	      pc_ce<='0';
	      rpc_ce<='0';
	      rx_ce<='0';
	      
	      when "0011" =>
	      sel_rf_din<="01";
	      sel_op1<='0';
	      acc_ce<='1';
	      pc_ce<='0';
	      rpc_ce<='0';
	      rx_ce<='0';
	      
	      when "0100" =>
	      sel_rf_din<="01";
	      sel_op1<='0';
	      acc_ce<='1';
	      pc_ce<='0';
	      rpc_ce<='0';
	      rx_ce<='0';
	      
	      when "0101" =>
	      sel_rf_din<="01";
	      sel_op1<='0';
	      acc_ce<='1';
	      pc_ce<='0';
	      rpc_ce<='0';
	      rx_ce<='0';
	      
	      when "0110" =>
	      sel_rf_din<="01";
	      sel_op1<='0';
	      acc_ce<='1';
	      pc_ce<='0';
	      rpc_ce<='0';
	      rx_ce<='0';
	      
	      when "0111" =>
	      sel_rf_din<="01";
	      sel_op1<='0';
	      acc_ce<='1';
	      pc_ce<='0';
	      rpc_ce<='0';
	      rx_ce<='0';
	      
	      
	when "1000" =>
	  
	  sel_ram_addr <= '1';
	  sel_rf_din <= "10";
	  acc_ce <= '1';
	  pc_ce<='0';
	      rpc_ce<='0';
	      rx_ce<='0';
	  
	  
	  when "1001" =>
	    
	    sel_op1 <= '0';
	    sel_ram_addr <= '1';
	    ram_we <='1';
	    
	    when "1010" =>
	     sel_rf_din <= "01";
	     acc_ce <='1';
	     pc_ce<='0';
	      rpc_ce<='0';
	      rx_ce<='0';
	    
	   when  "1011" =>
	     sel_op1 <='0';
	     sel_rf_din <= "01";
	     rx_ce<='1';
	     pc_ce<='0';
	      rpc_ce<='0';
	      acc_ce<='0';
	      
	     when  "1100" =>
	       sel_op1<='1';
	       sel_rf_din<="01";
	       pc_ce<='1';
	       acc_ce<='0';
	      rpc_ce<='0';
	      rx_ce<='0';
	       
	       when "1101"  =>
	       sel_op1<='1'; 
	       sel_rf_din<="01";
	       pc_ce<='1';
	       acc_ce<='0';
	      rpc_ce<='0';
	      rx_ce<='0';
	       
	       when "1110" =>
	       sel_op1<='1'; 
	       
	       sel_rf_din<="01";
	       pc_ce<='1';
	       acc_ce<='0';
	      rpc_ce<='0';
	      rx_ce<='0';
	       
	       when "1111" =>
	       
	       sel_rf_din<="00";
	       rpc_ce<='1';
	       pc_ce<='0';
	       acc_ce<='0';
	      rx_ce<='0';
	        sel_rf_din<="01";
	       pc_ce<='1';
	       acc_ce<='0';
	      rpc_ce<='0';
	      rx_ce<='0';
	      when others => 
	        
	         pc_ce<='0';
	       acc_ce<='0';
	      rpc_ce<='0';
	      rx_ce<='0';
	       
	        end case;
	       end if;
	       
	  end if;     
	end process;
	
	 

end arch_uc;

 

