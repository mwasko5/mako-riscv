library ieee;
use ieee.std_logic_1164.ALL;

entity Controller is
    port (
        clk             : in std_logic;
        instruction_in  : in std_logic_vector(31 downto 0);
        
        reg_write       : out std_logic;
        write_addr      : out std_logic_vector(4 downto 0);
        rs1_addr        : out std_logic_vector(4 downto 0);
        rs2_addr        : out std_logic_vector(4 downto 0);
        
        alu_select      : out std_logic_vector(3 downto 0)
    );
end Controller;

architecture Behavioral of Controller is

begin
    process(clk) begin
        if rising_edge(clk) then
            if instruction_in(31 downto 27) = "000000" then -- ADD opcode
                alu_select <= "0000";
                rs1_addr <= instruction_in(19 downto 15);
                rs2_addr <= instruction_in(24 downto 20);
                write_addr <= instruction_in(11 downto 7);
            end if;
            if instruction_in(31 downto 27) = "010000" then -- SUB opcode
                alu_select <= "0001";
                rs1_addr <= instruction_in(19 downto 15);
                rs2_addr <= instruction_in(24 downto 20);
                write_addr <= instruction_in(11 downto 7);
            end if;
        end if;
    end process;

end Behavioral;
