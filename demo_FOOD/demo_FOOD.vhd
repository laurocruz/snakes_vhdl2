LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE IEEE.NUMERIC_STD.all;

LIBRARY snake_lib;
USE snake_lib.snake_pack.all;

ENTITY demo_FOOD IS
    -- Altura e comprimento do mapa
    GENERIC (N     : INTEGER := 10;
             M     : INTEGER := 10;
             width : INTEGER := 6);
    PORT (RESET    : IN STD_LOGIC;
          FOOD_S   : IN STD_LOGIC;
          gmap     : IN STD_LOGIC_VECTOR(0 TO N*M-1);
	      food_pos : OUT INTEGER RANGE 0 TO N*M-1);
END demo_FOOD;
------------------------------------------------------------------------------------------------------------

ARCHITECTURE Behavior of demo_FOOD is

BEGIN

	food1 : FOOD PORT MAP(RESET, FOOD_S, gmap, food_pos);

END Behavior;

-------------------------------------------------------------------------------------------------------------
