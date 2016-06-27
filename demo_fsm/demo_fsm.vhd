LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY snake_lib;
USE snake_lib.snake_pack.all;

ENTITY demo_fsm IS
    --GENERIC( );
    PORT(clock : IN STD_LOGIC;
         clear : IN STD_LOGIC;
         eaten, hit : IN STD_LOGIC;
         KEY   : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
         dir   : BUFFER STD_LOGIC_VECTOR(0 TO 1);
         FOOD_S, WALK_S, COLISION_S, EAT_S, GROW_S, RESET : OUT STD_LOGIC);
END demo_fsm;

ARCHITECTURE Behavior OF demo_fsm IS

BEGIN

	fsm1: snake_fsm PORT MAP(clock,clear,eaten,hit,KEY,dir,FOOD_S, WALK_S, COLISION_S, EAT_S, GROW_S, RESET);

END Behavior;
