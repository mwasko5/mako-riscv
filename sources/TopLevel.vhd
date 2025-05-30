library ieee;
use ieee.std_logic_1164.all;

entity TopLevel is
    port (
        clk         : in std_logic;
        reset       : in std_logic;
        
        alu_result  : out std_logic_vector(31 downto 0)
    );
end TopLevel;

architecture Structural of TopLevel is
    signal pc_address           : std_logic_vector(31 downto 0);
    
    signal instruction          : std_logic_vector(31 downto 0);
    
    signal reg_write_wire       : std_logic;
    signal write_addr_wire      : std_logic_vector(4 downto 0);
    signal rs1_addr_wire        : std_logic_vector(4 downto 0);
    signal rs2_addr_wire        : std_logic_vector(4 downto 0);
    signal regfile_out_1        : std_logic_vector(31 downto 0);
    signal regfile_out_2        : std_logic_vector(31 downto 0);
    signal alu_select_wire      : std_logic_vector(3 downto 0);
    
begin
    PROGRAM_COUNTER: entity work.ProgramCounter
        port map (
            clk => clk,
            reset => reset,
            counter => pc_address
        );
    
    INSTRUCTION_MEMORY: entity work.InstructionMemory
        port map (
            clk => clk,
            pc => pc_address,
            instruction_out => instruction
        );

    CONTROLLER: entity work.Controller
        port map (
            clk => clk,
            instruction_in => instruction,
            reg_write => reg_write_wire,
            write_addr => write_addr_wire,
            rs1_addr => rs1_addr_wire,
            rs2_addr => rs2_addr_wire,
            alu_select => alu_select_wire
        );
        
    REGISTER_FILE: entity work.RegisterFile
        port map (
            clk => clk,
            reg_write => reg_write_wire,
            write_addr => write_addr_wire,
            rs1_addr => rs1_addr_wire,
            rs2_addr => rs2_addr_wire,
            write_data1 => regfile_out_1,
            write_data2 => regfile_out_2   
        );
    
    ALU: entity work.ALU
        port map (
            input_A => regfile_out_1,
            input_B => regfile_out_2,
            alu_select => alu_select_wire,
            result => alu_result
        );
end Structural;
