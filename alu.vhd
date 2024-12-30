library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity alu is
    Port (
        op_code : in STD_LOGIC_VECTOR (2 downto 0); -- کد عملیات
        operand1 : in STD_LOGIC_VECTOR (15 downto 0); -- عملوند 1
        operand2 : in STD_LOGIC_VECTOR (15 downto 0); -- عملوند 2
        result : out STD_LOGIC_VECTOR (15 downto 0); -- نتیجه
        zero_flag : out STD_LOGIC -- پرچم صفر برای نتیجه صفر
    );
end alu;

architecture Behavioral of alu is
begin
    process(op_code, operand1, operand2)
    begin
        case op_code is
            when "000" => result <= operand1 + operand2; -- عملیات جمع
            when "001" => result <= operand1 - operand2; -- عملیات تفریق
            when "010" => result <= operand1 AND operand2; -- عملیات AND
            when "011" => result <= operand1 OR operand2; -- عملیات OR
            when "100" => result <= NOT operand1; -- عملیات NOT
            when others => result <= (others => '0'); -- مقدار پیش‌فرض
        end case;

        -- تنظیم پرچم صفر
        if result = "0000000000000000" then
            zero_flag <= '1';
        else
            zero_flag <= '0';
        end if;
    end process;
end Behavioral;
