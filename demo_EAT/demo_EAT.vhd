LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std;

LIBRARY snake_lib;
USE snake_lib.snake_pack.all;

-- tamanho da cobra
ENTITY demo_EAT IS
-- DImensões do mapa
    GENERIC (N : INTEGER := 10;
             M : INTEGER := 10;
             INITIAL_SIZE : INTEGER := 2);
    PORT (RESET      : IN STD_LOGIC;
          EAT_S      : IN STD_LOGIC;
			 food_pos   : IN INTEGER RANGE -20 TO 255;
          --food_pos   : IN INTEGER RANGE 0 TO N*M-1;
          snake_head : IN INTEGER RANGE -20 TO 255;
          snake_size : OUT  INTEGER RANGE 0 TO N*M;
          eaten      : OUT  STD_LOGIC);
END demo_EAT;

ARCHITECTURE Behavior OF demo_EAT IS

BEGIN

	eat1 : EAT PORT MAP(RESET, EAT_S, food_pos, snake_head, snake_size, eaten);

END Behavior;
