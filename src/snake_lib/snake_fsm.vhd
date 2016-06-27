LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY snake_lib;
USE snake_lib.snake_pack.all;

ENTITY snake_fsm IS
    --GENERIC( );
    PORT(clock : IN STD_LOGIC;
         clear : IN STD_LOGIC;
         eaten, hit : IN STD_LOGIC;
         KEY   : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
         dir   : BUFFER STD_LOGIC_VECTOR(0 TO 1);
         FOOD_S, WALK_S, COLISION_S, EAT_S, GROW_S, RESET : OUT STD_LOGIC);
END snake_fsm;

ARCHITECTURE Behavior OF snake_fsm IS
    TYPE states_snakes IS (START, FOOD, WALK, COLISION_CHECK, COLISION_VERIFY, EAT_CHECK, EAT_VERIFY, GROW);

    SIGNAL current_state : states_snakes := START;

BEGIN
    StateMachine:
    PROCESS(clock, clear, KEY, dir, current_state)
	 BEGIN
        IF (clear = '1') THEN
            FOOD_S <= '0';
            WALK_S <= '0';
            COLISION_S <= '0';
            EAT_S <= '0';
            RESET <= '1';

            dir <= "11";
        ELSIF (KEY(0) = '1') THEN
            IF (dir = "00") THEN
                dir <= "01";
            ELSIF (dir = "01") THEN
                dir <= "11";
            ElSIF (dir = "11") THEN
                dir <= "10";
            ELSE
                dir <= "00";
            END IF;
        ELSIF (KEY(1) = '1') THEN
            IF (dir = "00") THEN
                dir <= "10";
            ELSIF (dir = "10") THEN
                dir <= "11";
            ELSIF (dir = "11") THEN
                dir <= "01";
            ELSE
                dir <= "00";
            END IF;
        ELSIF (clock'EVENT AND clock = '1') THEN
            FOOD_S <= '0';
            WALK_S <= '0';
            COLISION_S <= '0';
            EAT_S <= '0';
            RESET <= '0';

            CASE current_state IS
                WHEN START =>
                    FOOD_S <= '0';
                    WALK_S <= '0';
                    COLISION_S <= '0';
                    EAT_S <= '0';
                    RESET <= '1';
                    dir <= "11";

                    current_state <= FOOD;

                WHEN FOOD =>
                    FOOD_S <= '1';
                    current_state <= WALK;

                WHEN WALK =>
                    WALK_S <= '1';
                    current_state <= COLISION_CHECK;

                WHEN COLISION_CHECK =>
                    COLISION_S <= '1';
                    current_state <= COLISION_VERIFY;

                WHEN COLISION_VERIFY =>
                    -- sem colisao
                    IF (hit = '0') THEN
                        current_state <= EAT_CHECK;
                    ELSE -- com colisao
                        current_state <= START;
                    END IF;

                WHEN EAT_CHECK =>
                    EAT_S <= '1';
                    current_state <= EAT_VERIFY;

                WHEN EAT_VERIFY =>
                    -- sem ter comido
                    IF (eaten = '0') THEN
                        current_state <= WALK;
                    ELSE-- tendo comido
                        current_state <= GROW;
                    END IF;

                WHEN GROW =>
                    GROW_S <= '1';
                    current_state <= FOOD;

            END CASE;
        END IF;
    END PROCESS;

END Behavior;
