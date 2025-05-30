library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ProgramCounter is
    port 
    (
        clk     : in std_logic;
        reset   : in std_logic;
        counter : out std_logic_vector(31 downto 0)
    );
end ProgramCounter;

architecture Behavioral of ProgramCounter is
    signal pc : std_logic_vector(31 downto 0) := (others => '0');
    
begin
    process(clk) begin
        if rising_edge(clk) then
            if reset = '1' then
                pc <= (others => '0');
            else
                pc <= std_logic_vector(unsigned(pc) + 4);
            end if;
        end if;
    end process;
    
    counter <= pc;
    
end Behavioral;
