LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY snake_lib;
USE snake_lib.snake_pack.all;

-- controlador do mapa do jogo
ENTITY WALK IS
    -- DImensões do mapa
    GENERIC (N : INTEGER := 10;
             M : INTEGER := 10;
             INITIAL_SIZE : INTEGER := 2);

    PORT (RESET  : IN STD_LOGIC;
          WALK_S : IN STD_LOGIC;
          GROW_S : IN STD_LOGIC;
          -- tamanho da cobra ****************************
          snake_size : IN INTEGER RANGE 0 TO 51;
          dir        : IN STD_LOGIC_VECTOR(1 DOWNTO 0);

          -- posicoes da cobra no mapa
          snake_body : OUT int_array);
END WALK;

ARCHITECTURE Behavior OF WALK IS
    SIGNAL snake : int_array;

BEGIN

    snake_body <= snake;

	PROCESS (RESET,WALK_S,GROW_S,dir)
        VARIABLE j : INTEGER RANGE 0 TO N*M;
        VARIABLE DIF : INTEGER RANGE 0 TO M;
	BEGIN

		IF (RESET = '1') THEN
            FOR i in 0 to INITIAL_SIZE-1 LOOP
                snake(i) <= (N/2) + (i+M/2)*M;
            END LOOP;
				-- ***************
            FOR i in INITIAL_SIZE to 50 LOOP --N*M-1
				snake(i) <= -1;
			END LOOP;

		ELSIF (GROW_S = '1') THEN
			DIF := snake(snake_size-1) - snake(snake_size-2);
			snake(snake_size) <= snake(snake_size-1) + DIF;

		ELSIF (WALK_S = '1') THEN
			j := 0;
			-- ************************* N*M
			WHILE (j+1 < 51 and not(snake(j+1) = -1)) LOOP
				snake(j+1) <= snake(j);
				j := j + 1;
			END LOOP;

            IF (dir = "00") THEN
                snake(0) <= snake(0) + M;
            ELSIF (dir = "01") THEN
                snake(0) <= snake(0) + 1;
            ELSIF (dir = "10") THEN
                snake(0) <= snake(0) - 1;
            ELSE
                snake(0) <= snake(0) - M;
            END IF;

		END IF;
	END PROCESS;

END Behavior;
