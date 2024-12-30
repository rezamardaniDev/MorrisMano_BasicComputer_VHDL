library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity memory_unit is
    Generic (
        MEM_SIZE : integer := 256 -- تعداد مکان‌های حافظه
    );
    Port (
        clk : in STD_LOGIC;
        we : in STD_LOGIC; -- سیگنال نوشتن
        address : in STD_LOGIC_VECTOR (7 downto 0); -- آدرس حافظه
        data_in : in STD_LOGIC_VECTOR (15 downto 0); -- ورودی داده
        data_out : out STD_LOGIC_VECTOR (15 downto 0) -- خروجی داده
    );
end memory_unit;

architecture Behavioral of memory_unit is
    type memory_array is array (0 to MEM_SIZE-1) of STD_LOGIC_VECTOR (15 downto 0);
    signal RAM : memory_array := (others => (others => '0')); -- حافظه اولیه
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if we = '1' then
                RAM(to_integer(unsigned(address))) <= data_in; -- نوشتن در حافظه
            end if;
            data_out <= RAM(to_integer(unsigned(address))); -- خواندن از حافظه
        end if;
    end process;
end Behavioral;
