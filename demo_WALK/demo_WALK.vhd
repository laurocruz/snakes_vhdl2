LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY snake_lib;
USE snake_lib.snake_pack.all;

-- controlador do mapa do jogo
ENTITY demo_WALK IS
    -- DImensões do mapa
    GENERIC (N : INTEGER := 10;
             M : INTEGER := 10;
             INITIAL_SIZE : INTEGER := 2);

    PORT (RESET  : IN STD_LOGIC;
          WALK_S : IN STD_LOGIC;
          GROW_S : IN STD_LOGIC;
          -- tamanho da cobra
          snake_size : IN INTEGER RANGE 0 TO N*M;
          dir        : IN STD_LOGIC_VECTOR(1 DOWNTO 0));
END demo_WALK;

ARCHITECTURE Behavior OF demo_WALK IS
    SIGNAL snake_body : int_array;

BEGIN

	walk1: WALK PORT MAP(RESET,WALK_S,GROW_S,snake_size,dir,snake_body);

END Behavior;
