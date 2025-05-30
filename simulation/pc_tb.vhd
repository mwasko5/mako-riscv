library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ProgramCounter_tb is
end ProgramCounter_tb;

architecture sim of ProgramCounter_tb is

    -- Signals to connect to the UUT
    signal clk     : std_logic := '0';
    signal reset   : std_logic := '1';
    signal counter : std_logic_vector(31 downto 0);

    constant clk_period : time := 10 ns;

begin

    -- Instantiate the ProgramCounter
    uut: entity work.ProgramCounter
        port map (
            clk     => clk,
            reset   => reset,
            counter => counter
        );

    -- Clock generation
    clk_process: process
    begin
        while now < 200 ns loop
            clk <= '0';
            wait for clk_period / 2;
            clk <= '1';
            wait for clk_period / 2;
        end loop;
        wait;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Start with reset active
        wait for 20 ns;
        reset <= '0';  -- Deassert reset

        wait for 100 ns;

        -- Assert reset again
        reset <= '1';
        wait for 20 ns;
        reset <= '0';

        wait for 50 ns;

        wait;
    end process;

end sim;
