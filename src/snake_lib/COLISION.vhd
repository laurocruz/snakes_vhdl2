LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std;

LIBRARY snake_lib;
USE snake_lib.snake_pack.all;

ENTITY COLISION IS
-- DImensões do mapa
    GENERIC (N : INTEGER := 10;
             M : INTEGER := 10);
    PORT (RESET :      IN STD_LOGIC;
          COLISION_S : IN STD_LOGIC;
          snake_body : IN int_array;
          dir        : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
          gmap       : OUT STD_LOGIC_VECTOR(0 to N*M-1);
          hit        : OUT STD_LOGIC);
END COLISION;

ARCHITECTURE Behavior OF COLISION IS
    SIGNAL map_s : STD_LOGIC_VECTOR(0 to N*M-1);
BEGIN

	PROCESS(RESET, COLISION_S, dir)
		variable i : integer range 0 to 255;
		variable index : integer range 0 to M*N;
		variable outl : STD_LOGIC;
	BEGIN
----------------------------------------------------------------------------
		IF (RESET = '1') THEN
			outl := '0';
            map_s <= (OTHERS => '0');

----------------------------------------------------------------------------
		ELSIF (COLISION_S = '1') THEN
			i := 1;
			outl := '0';
			-- N*M *********************
			WHILE (i < 51 and not(snake_body(i) = -1) and outl = '0') LOOP
				IF (snake_body(0) = snake_body(i)) THEN
					outl := '1';
				END IF;
				i := i + 1;
			END LOOP;

			IF (outl = '0') THEN
				IF (dir = "00") THEN
					IF (snake_body(0) > M*N-1) THEN
						outl := '1';
					END IF;
				ELSIF (dir = "01") THEN
					IF (snake_body(0) mod M = 0 and snake_body(1) mod M = (M-1)) THEN
						outl := '1';
					END IF;
				ELSIF (dir = "10") THEN
					IF (snake_body(0) mod M = (M-1) and snake_body(1) mod M = 0) THEN
						outl := '1';
					END IF;
				ELSE
					IF (snake_body(0) < 0) THEN
						outl := '1';
					END IF;
				END IF;

        		IF (outl = '0') THEN
                    map_s <= (OTHERS => '0');
                    i := 0;
					-- N*M ********************
        			WHILE (i < 51 and not(snake_body(i) = -1)) LOOP
        				index := snake_body(i);
        				map_s(index) <= '1';
        				i := i + 1;
        			END LOOP;
        		END IF;
            END IF;

-----------------------------------------------------------------------------
        ELSIF (COLISION_S = '0') THEN
            outl := '0';
		END IF;
----------------------------------------------------------------------------
		hit <= outl;
        gmap <= map_s;

	END PROCESS;

END Behavior;
