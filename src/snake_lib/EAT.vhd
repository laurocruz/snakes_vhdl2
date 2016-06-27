LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std;

LIBRARY snake_lib;
USE snake_lib.snake_pack.all;

-- tamanho da cobra
ENTITY EAT IS
-- DImensões do mapa
    GENERIC (N : INTEGER := 10;
             M : INTEGER := 10;
             INITIAL_SIZE : INTEGER := 2);
    PORT (RESET      : IN STD_LOGIC;
          EAT_S      : IN STD_LOGIC;
		  food_pos   : IN INTEGER RANGE -1 to 100;
          --food_pos   : IN INTEGER RANGE 0 TO N*M-1;
          snake_head : IN INTEGER RANGE -1 to 100;
			 -- ********************
          snake_size : BUFFER  INTEGER RANGE 0 TO 51;
          eaten      : OUT  STD_LOGIC);
END EAT;

ARCHITECTURE Behavior OF EAT IS
BEGIN

	PROCESS(RESET,EAT_S,food_pos,snake_head)
	BEGIN
        IF (RESET = '1') THEN
            snake_size <= INITIAL_SIZE;
            eaten <= '0';
		ELSIF (EAT_S = '1') THEN
            IF (food_pos = snake_head) THEN
				snake_size <= snake_size + 1;
                eaten <= '1';
            END IF;
        ELSIF (EAT_S = '0') THEN
            eaten <= '0';
		END IF;
	END PROCESS;

END Behavior;
