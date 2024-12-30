library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity common_bus is
    Port (
        select_signal : in STD_LOGIC_VECTOR (2 downto 0); -- سیگنال انتخاب برای منبع داده
        data_in1 : in STD_LOGIC_VECTOR (15 downto 0); -- داده ورودی 1
        data_in2 : in STD_LOGIC_VECTOR (15 downto 0); -- داده ورودی 2
        data_in3 : in STD_LOGIC_VECTOR (15 downto 0); -- داده ورودی 3
        data_out : out STD_LOGIC_VECTOR (15 downto 0) -- داده خروجی
    );
end common_bus;

architecture Behavioral of common_bus is
begin
    process(select_signal, data_in1, data_in2, data_in3)
    begin
        case select_signal is
            when "000" => data_out <= data_in1; -- انتخاب ورودی 1
            when "001" => data_out <= data_in2; -- انتخاب ورودی 2
            when "010" => data_out <= data_in3; -- انتخاب ورودی 3
            when others => data_out <= (others => '0'); -- مقدار پیش‌فرض
        end case;
    end process;
end Behavioral;
