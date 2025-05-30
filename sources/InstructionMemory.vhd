library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity InstructionMemory is
    port (
        clk             : in std_logic;
        pc              : in std_logic_vector(31 downto 0);
        
        instruction_out : out std_logic_vector(31 downto 0)
    );
end InstructionMemory;

architecture Behavioral of InstructionMemory is
    type instruction_array is array (0 to 1023) of std_logic_vector(31 downto 0);
    
    signal memory : instruction_array := (
        0 => x"00000001",
        1 => x"00000002",
        2 => x"00000003",
        others => x"00000000"
    );
    
begin
    process (clk) begin
        if rising_edge(clk) then
            instruction_out <= memory(to_integer(unsigned(pc(11 downto 2))));
        end if;
    end process;

end Behavioral;
