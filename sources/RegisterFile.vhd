library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RegisterFile is
    port (
        clk             : in std_logic;
        reg_write       : in std_logic;
        write_addr      : in std_logic_vector(4 downto 0);
        -- write_data_in   : in std_logic_vector (31 downto 0);
        rs1_addr        : in std_logic_vector(4 downto 0);
        rs2_addr        : in std_logic_vector(4 downto 0);
        
        write_data1     : out std_logic_vector(31 downto 0);
        write_data2     : out std_logic_vector(31 downto 0)
    );
end RegisterFile;

architecture Behavioral of RegisterFile is
    type reg_file_array is array (0 to 31) of std_logic_vector(31 downto 0);
    
    signal memory : reg_file_array := (
        0 => x"00000001",
        1 => x"00000002",
        2 => x"00000003",
        others => x"00000000"
    );
begin
    process (clk) begin
        if rising_edge(clk) then
            write_data1 <= memory(to_integer(unsigned(rs1_addr)));
            write_data2 <= memory(to_integer(unsigned(rs2_addr)));
            
            --if reg_write = '1' then
            --    memory(to_integer(unsigned(write_addr))) <= write_data_in;
            --end if;
        end if;
    end process;
end Behavioral;
