library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity ALU is
    port (
        input_A         : in std_logic_vector(31 downto 0);
        input_B         : in std_logic_vector(31 downto 0);
        alu_select      : in std_logic_vector(3 downto 0);
        
        result          : out std_logic_vector(31 downto 0)
    );
end ALU;

architecture Behavioral of ALU is
    
begin
    process(input_A, input_b, alu_select) begin
        case(alu_select) is
            when "0000" => -- ADDITION
                result <= std_logic_vector(signed(input_A) + signed(input_B));
            when "0001" => -- SUBTRACTION
                result <= std_logic_vector(signed(input_A) - signed(input_B));
            --when "0010" => -- INTEGER MULTIPLICATION
            --    result <= std_logic_vector(signed(input_A) * signed(input_B));
            when "0011" => -- INTEGER DIVISION
                result <= std_logic_vector(signed(input_A) / signed(input_B));
            when others => -- DEFAULT TO ADDITION
                result <= std_logic_vector(signed(input_A) + signed(input_B));
        end case;
    end process;

end Behavioral;
