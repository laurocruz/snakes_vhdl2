LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std;

LIBRARY snake_lib;
USE snake_lib.snake_pack.all;

ENTITY demo_COLISION IS
-- DImensões do mapa
    GENERIC (N : INTEGER := 10;
             M : INTEGER := 10);
    PORT (RESET :      IN STD_LOGIC;
          COLISION_S : IN STD_LOGIC;
          dir        : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
          gmap       : OUT STD_LOGIC_VECTOR(0 to N*M-1);
          hit        : OUT STD_LOGIC);
END demo_COLISION;

ARCHITECTURE Behavior OF demo_COLISION IS
    SIGNAL snake_body : int_array;
BEGIN

	colision1: COLISION PORT MAP (RESET,COLISION_S, snake_body, dir, gmap, hit);

END Behavior;
