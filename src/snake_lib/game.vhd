LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY snake_lib;
USE snake_lib.snake_pack.all;

ENTITY game IS
    -- Dimensões do mapa
    GENERIC (N : INTEGER := 10;
             M : INTEGER := 10;
				 INITIAL_SIZE : INTEGER := 2;
				 width : INTEGER := 6);

    PORT (CLOCK : IN STD_LOGIC;
          CLEAR : IN STD_LOGIC;
          KEY   : IN STD_LOGIC_VECTOR(1 DOWNTO 0);

			 -- **************************
          snake_size : OUT INTEGER RANGE 0 TO 50;
          gmap       : OUT STD_LOGIC_VECTOR(0 TO N*M-1);
          --snake_body : OUT int_array;
          food_pos   : OUT INTEGER RANGE 0 TO N*M-1);
END game;

ARCHITECTURE Behavior OF game IS
	SIGNAL FOOD_S_g, WALK_S_g, COLISION_S_g, EAT_S_g, GROW_S_g, RESET_g : STD_LOGIC := '0';
	SIGNAL eaten_g : STD_LOGIC := '0';
	SIGNAL hit_g   : STD_LOGIC := '0';
	SIGNAL clock_g : STD_LOGIC;
	-- ******************************
	SIGNAL snake_size_g : INTEGER RANGE 0 TO 50;
	SIGNAL snake_body_g : int_array;
	SIGNAL food_pos_g : INTEGER RANGE 0 TO M*N-1;
	SIGNAL gmap_g : STD_LOGIC_VECTOR(0 TO N*M-1);
	SIGNAL dir_g  : STD_LOGIC_VECTOR(0 to 1);

BEGIN
	clock1: gclock
		--GENERIC MAP ()
		PORT MAP(RESET => RESET_g,
               CLOCK_27 => CLOCK,
               clock_out => clock_g);
		
	food1: FOOD
		GENERIC MAP (N,M,width)
		PORT MAP(RESET => RESET_g,
               FOOD_S => FOOD_S_g,
               gmap => gmap_g,
               food_pos => food_pos_g);
		
	walk1: WALK
		GENERIC MAP (N,M,INITIAL_SIZE)
		PORT MAP(RESET => RESET_g,
               WALK_S => WALK_S_g,
               GROW_S => GROW_S_g,
               snake_size => snake_size_g,
               dir => dir_g,
               snake_body => snake_body_g);
		
	colision1: COLISION
		GENERIC MAP (N,M)
		PORT MAP(RESET => RESET_g,
               COLISION_S => COLISION_S_g,
               snake_body => snake_body_g,
               dir => dir_g,
               gmap => gmap_g,
               hit => hit_g);
		
	eat1: EAT
		GENERIC MAP (N,M,INITIAL_SIZE)
		PORT MAP(RESET => RESET_g,
               EAT_S => EAT_S_g,
               food_pos => food_pos_g,
               snake_head => snake_body_g(0),
               snake_size => snake_size_g,
               eaten => eaten_g);
		
	fsm1: snake_fsm
		--GENERIC MAP ()
		PORT MAP(clock => clock_g,
               clear => CLEAR,
               eaten => eaten_g,
               hit => hit_g,
               KEY => KEY,
               dir => dir_g,
               FOOD_S => FOOD_S_g,
               WALK_S => WALK_S_g,
               COLISION_S => COLISION_S_g,
               EAT_S => EAT_S_g,
               GROW_S => GROW_S_g,
               RESET => RESET_g);

	snake_size <= snake_size_g;
	gmap <= gmap_g;
	food_pos <= food_pos_g;

END Behavior;
