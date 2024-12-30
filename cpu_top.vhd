library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity cpu_top is
    Port (
        clk : in STD_LOGIC;
        reset : in STD_LOGIC
    );
end cpu_top;

architecture Behavioral of cpu_top is
    -- سیگنال‌ها برای اتصال بخش‌ها
    signal instruction : STD_LOGIC_VECTOR(15 downto 0);
    signal data_bus : STD_LOGIC_VECTOR(15 downto 0);
    signal alu_result : STD_LOGIC_VECTOR(15 downto 0);
    signal zero_flag : STD_LOGIC;
    signal control_signals : STD_LOGIC_VECTOR(7 downto 0);

    -- ثبات‌ها
    signal ac_out, dr_out, ar_out, pc_out, ir_out : STD_LOGIC_VECTOR(15 downto 0);
begin
    -- ثبات AC
    AC: entity work.register port map (
        clk => clk,
        reset => reset,
        load => control_signals(0), -- سیگنال بارگذاری
        d_in => alu_result,
        q_out => ac_out
    );

    -- ثبات DR
    DR: entity work.register port map (
        clk => clk,
        reset => reset,
        load => control_signals(1), -- سیگنال بارگذاری
        d_in => data_bus,
        q_out => dr_out
    );

    -- ثبات AR
    AR: entity work.register port map (
        clk => clk,
        reset => reset,
        load => control_signals(2),
        d_in => data_bus,
        q_out => ar_out
    );

    -- ثبات PC
    PC: entity work.register port map (
        clk => clk,
        reset => reset,
        load => control_signals(3),
        d_in => data_bus,
        q_out => pc_out
    );

    -- ثبات IR
    IR: entity work.register port map (
        clk => clk,
        reset => reset,
        load => control_signals(4),
        d_in => data_bus,
        q_out => ir_out
    );

    -- واحد حافظه
    MEMORY: entity work.memory_unit port map (
        clk => clk,
        we => control_signals(5),
        address => ar_out(7 downto 0),
        data_in => dr_out,
        data_out => data_bus
    );

    -- ALU
    ALU: entity work.alu port map (
        op_code => instruction(15 downto 12),
        operand1 => ac_out,
        operand2 => dr_out,
        result => alu_result,
        zero_flag => zero_flag
    );

    -- واحد کنترل
    CONTROL: entity work.control_unit port map (
        clk => clk,
        reset => reset,
        instruction => ir_out,
        zero_flag => zero_flag,
        control_signals => control_signals
    );

    -- گذرگاه مشترک
    BUS: entity work.common_bus port map (
        select_signal => instruction(11 downto 9), -- سیگنال انتخاب
        data_in1 => ac_out,
        data_in2 => dr_out,
        data_in3 => pc_out,
        data_out => data_bus
    );
end Behavioral;
