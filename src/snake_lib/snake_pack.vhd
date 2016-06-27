LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.math_real.all;

PACKAGE snake_pack IS

	--CONSTANT N : INTEGER := 10;
	--CONSTANT M : INTEGER := 10;
	--TYPE int_range IS RANGE -1 TO N*M;
	--TYPE array_size IS RANGE 0 TO 50;
	
	-- *******************
	TYPE int_array IS array (0 TO 50) OF INTEGER RANGE -1 to 100;

	COMPONENT conv_7seg IS
		PORT (digit : IN STD_LOGIC_VECTOR(3 DOWNTO 0) ;
			  seg : OUT STD_LOGIC_VECTOR(6 DOWNTO 0) ) ;
	END COMPONENT;

	COMPONENT gclock IS
		-- Frequencia de 1Hz
		-- clock do hardware
		PORT (RESET      : IN STD_LOGIC ;
			  CLOCK_27   : IN STD_LOGIC ;
			  clock_out  : OUT STD_LOGIC) ;
	END COMPONENT;

	COMPONENT FOOD IS
	    -- Altura e comprimento do mapa
	    GENERIC (N     : INTEGER := 10;
	             M     : INTEGER := 10;
	             width : INTEGER := 6);
	    PORT (RESET    : IN STD_LOGIC;
	          FOOD_S   : IN STD_LOGIC;
	          gmap     : IN STD_LOGIC_VECTOR(0 TO N*M-1);
		      food_pos : OUT INTEGER RANGE 0 TO N*M-1);
	END COMPONENT;

	COMPONENT WALK IS
	    -- DImensões do mapa
	    GENERIC (N : INTEGER := 10;
	             M : INTEGER := 10;
	             INITIAL_SIZE : INTEGER := 2);

	    PORT (RESET  : IN STD_LOGIC;
	          WALK_S : IN STD_LOGIC;
	          GROW_S : IN STD_LOGIC;
	          -- tamanho da cobra ********************
	          snake_size : IN INTEGER RANGE 0 TO 51;
	          dir        : IN STD_LOGIC_VECTOR(1 DOWNTO 0);

	          -- posicoes da cobra no mapa
	          snake_body : OUT int_array);
	END COMPONENT;

	COMPONENT COLISION IS
	-- DImensões do mapa
	    GENERIC (N : INTEGER := 10;
	             M : INTEGER := 10);

	    PORT (RESET :      IN STD_LOGIC;
	          COLISION_S : IN STD_LOGIC;
	          snake_body : IN int_array;
	          dir        : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	          gmap       : OUT STD_LOGIC_VECTOR(0 to N*M-1);
	          hit        : OUT STD_LOGIC);
	END COMPONENT;

	COMPONENT EAT IS
	-- DImensões do mapa
	    GENERIC (N : INTEGER := 10;
	             M : INTEGER := 10;
	             INITIAL_SIZE : INTEGER := 2);

	    PORT (RESET      : IN STD_LOGIC;
	          EAT_S      : IN STD_LOGIC;
			  food_pos   : IN INTEGER RANGE -1 TO 100;
	          --food_pos   : IN INTEGER RANGE 0 TO N*M-1;
	          snake_head : IN INTEGER RANGE -1 TO 100;
				 -- **************************************
	          snake_size : OUT  INTEGER RANGE 0 TO 51;
	          eaten      : OUT  STD_LOGIC);
	END COMPONENT;

	COMPONENT snake_fsm IS
	    PORT(clock : IN STD_LOGIC;
	         clear : IN STD_LOGIC;
	         eaten, hit : IN STD_LOGIC;
	         KEY   : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	         dir   : BUFFER STD_LOGIC_VECTOR(0 TO 1);
	         FOOD_S, WALK_S, COLISION_S, EAT_S, GROW_S, RESET : OUT STD_LOGIC);
	END COMPONENT;

END snake_pack;
