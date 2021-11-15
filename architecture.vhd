library IEEE;
use IEEE.std_logic_1164.all;
entity cpu is
port(clk0, rst0 : in std_logic;
 ram_we0: out std_logic;
 ram_addr0,ram_din0 : in std_logic_vector(15 downto 0);
 ram_out0 : out std_logic_vector(15 downto 0));
end cpu;
architecture structurelle of cpu is

Component mux3 is 
Port (
A,B,C: in std_logic_vector(15 downto 0);
 Sel: in std_logic_vector(1 downto 0);
 Y: out std_logic_vector(15 downto 0));
End component mux3;

Component MUX2 is 
Port (A, B: in std_logic;
 Sel: in std_logic;
 Y: out std_logic);
End component MUX2;

Component D is 
Port (clk : in std_logic;
d : in std_logic;
q : out std_logic);
End component D;

Component instruction is Port(ce : in  STD_LOGIC;
 rst : in  STD_LOGIC;  
clk : in  STD_LOGIC;
inst: in  std_logic_vector(15 downto 0);
cond : out  std_logic_vector(3 downto 0);
 op : out  std_logic_vector(3 downto 0);
updt : out  STD_LOGIC;
imm : out std_logic;
val : out  std_logic_vector(5 downto 0));
End component instruction;

Component status_reg is Port( in_s: in  std_logic_vector(3 downto 0);
out_s: out   std_logic_vector(3 downto 0);
status_ce : in  std_logic;
clk : in  std_logic;
rst: in  std_logic);
End component status_reg;

Component ual is Port(op1,op2: in std_logic_vector(15 downto 0);
code : in std_logic_vector(3 downto 0);
port_in : out std_logic_vector(3 downto 0);
a : out std_logic_vector(15 downto 0)
);
End component ual;

Component uc is Port(inst_cond: in  std_logic_vector(3 downto 0);
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
ram_we : out std_logic
);
End component uc;

Component banc_reg is Port(rx_num : in  std_logic_vector(5 downto 0);
din : in  std_logic_vector(15 downto 0);
 rx_ce : in  std_logic;
acc_ce : in  std_logic;
pc_ce : in  std_logic;
rpc_ce : in  std_logic;
clk : in  std_logic;
rst: in  std_logic;
 rx_out : out  std_logic_vector(15 downto 0);
acc_out : out  std_logic_vector(15 downto 0);
pc_out : out  std_logic_vector(15 downto 0)
);
End component banc_reg;

signal ce_ins,ce_stat,ce_acc,ce_pc,ce_rpc,ce_rx,op1_sel,addr_sel,up_ins : std_logic;
signal op_ins : std_logic_vector(3 downto 0);
signal din_sel : std_logic_vector(1 downto 0);
signal stat : std_logic_vector(3 downto 0);
signal cond_ins : std_logic_vector(3 downto 0);

-- uc signals--
signal s_in,s_out: std_logic_vector(3 downto 0);

signal rststat : std_logic;

-- statu--
 signal rstins: std_logic:='0';
 signal imm: std_logic;
 signal s_val : std_logic_vector(5 downto 0);
 -- instruc--
 signal s_din : std_logic_vector(15 downto 0);
 signal rstbanc: std_logic:='0'; 
 signal s_rx_out,s_acc_out,s_pc_out : std_logic_vector(15 downto 0);

--banc--
signal s_val1 : std_logic_vector(15 downto 0):="0000000000" & s_val;
signal op1in : std_logic_vector(15 downto 0);
--mux1--
signal op2in : std_logic_vector(15 downto 0);
--mux2--
signal op1out,op2out : std_logic_vector(15 downto 0);
--op--
signal ualin : std_logic_vector(15 downto 0);
--ual--
signal s_pc : std_logic_vector(15 downto 0):=pc_out + 1;
signal s_din1 : std_logic_vector(15 downto 0);

--mux3--
signal ualin1 : std_logic_vector(15 downto 0);
Begin
UC: uc port map (cond_ins,op_ins,up_ins,ce_rx,ce_acc,ce_pc,ce_rpc,ce_stat,ce_ins,op1_sel,addr_sel,din_sel,stat,clk0,rst0,ram_we0); 
STATUS: status_reg port map (s_in,s_out,ce_stat,clk0,rststat);
INST: instruction port map (ce_ins,rstins,clk0,ram_out0,cond_ins,op_ins,up_ins,imm,s_val);
BANC: banc_reg port map (s_val,s_din,ce_rx,ce_acc,ce_pc,ce_rpc,clk0,rstbanc,s_rx_out,s_acc_out,s_pc_out);
MUX1: MUX2 port map (sal_val1,s_rx_out,imm,op1in);
MUX0: MUX2 port map (s_acc_out,s_pc_out,op1_sel,op2in);
OP2: D port map (clk0,op2in,op2out);
OP1: D port map (clk0,op1in,op1out);
UAL: ual port map (op2out,op1out,op_ins,stat,ualin);
MUX3: mux3 port map (s_pc,ualin,ram_out0,din_sel,s_din1);
MUX : MUX2 port map(s_pc_out,op2out,addr_sel,ram_addr0);
RST: D port map (clk0,ualin,ualin1);






end structurelle;
