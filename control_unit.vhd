library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity control_unit is
    Port (
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        instruction : in STD_LOGIC_VECTOR (15 downto 0); -- دستور فعلی
        zero_flag : in STD_LOGIC; -- پرچم صفر از ALU
        control_signals : out STD_LOGIC_VECTOR (7 downto 0) -- سیگنال‌های کنترلی
    );
end control_unit;

architecture Behavioral of control_unit is
    signal state : STD_LOGIC_VECTOR (2 downto 0); -- حالت فعلی واحد کنترل
begin
    process(clk, reset)
    begin
        if reset = '1' then
            state <= "000"; -- مقداردهی اولیه حالت
        elsif rising_edge(clk) then
            case state is
                when "000" => -- حالت Fetch
                    control_signals <= "10000000"; -- سیگنال خواندن دستور از حافظه
                    state <= "001";
                when "001" => -- حالت Decode
                    control_signals <= "01000000"; -- سیگنال رمزگشایی دستور
                    state <= "010";
                when "010" => -- حالت Execute
                    if instruction(15 downto 12) = "0001" then -- بررسی کد دستور
                        control_signals <= "00100000"; -- سیگنال اجرای ALU
                    elsif instruction(15 downto 12) = "0010" then
                        control_signals <= "00010000"; -- سیگنال نوشتن به حافظه
                    end if;
                    state <= "011";
                when "011" => -- حالت Write Back
                    control_signals <= "00001000"; -- سیگنال بازگشت نتیجه
                    state <= "000"; -- بازگشت به Fetch
                when others =>
                    state <= "000"; -- حالت پیش‌فرض
            end case;
        end if;
    end process;
end Behavioral;
