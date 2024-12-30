library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity register is
    Port (
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        load : in STD_LOGIC;
        d_in : in STD_LOGIC_VECTOR (7 downto 0);
        q_out : out STD_LOGIC_VECTOR (7 downto 0)
    );
end register;

architecture Behavioral of register is
    signal reg_data : STD_LOGIC_VECTOR (7 downto 0);
begin
    process(clk, reset)
    begin
        if reset = '1' then
            reg_data <= (others => '0');
        elsif rising_edge(clk) then
            if load = '1' then
                reg_data <= d_in;
            end if;
        end if;
    end process;
    q_out <= reg_data;
end Behavioral;
