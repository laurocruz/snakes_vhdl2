LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY gclock IS
    -- Frequencia de 1Hz
    -- clock do hardware
	PORT (RESET      : IN STD_LOGIC ;
          CLOCK_27   : IN STD_LOGIC ;
		  clock_out  : OUT STD_LOGIC) ;
END gclock ;

architecture Behavioral of gclock is
    signal temporal: STD_LOGIC;
    signal counter : integer range 0 to 13499999 := 0;
begin
    frequency_divider: process (reset, CLOCK_27) begin
        if (RESET = '1') then
            temporal <= '0';
            counter <= 0;
        elsif rising_edge(CLOCK_27) then
            if (counter = 13499999) then
                temporal <= NOT(temporal);
                counter <= 0;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;

    clock_out <= temporal;
end Behavioral;
