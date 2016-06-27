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

    PORT (CLOCK_27 : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
          KEY : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			 
			 HEX0, HEX1, HEX2, HEX3 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);

			 -- **************************
          --snake_size : OUT INTEGER RANGE 0 TO 50;
          --gmap       : OUT STD_LOGIC_VECTOR(0 TO N*M-1);
          --food_pos   : OUT INTEGER RANGE 0 TO N*M-1);
END game;

ARCHITECTURE Behavior OF game IS
	SIGNAL points   : INTEGER RANGE 0 to 50;
	SIGNAL food_pos : INTEGER RANGE 0 TO N*M-1)
	SIGNAL gmap     : STD_LOGIC_VECTOR(0 TO N*M-1);
BEGIN
	
	game1: game
		GENERIC MAP (M,N,INITIAL_SIZE,width)
		PORT MAP(CLOCK => CLOCK_27(0),
               CLEAR => not(KEY(3)),
					KEY => not(KEY(1)) & not(KEY(0)),
					snake_size => points,
					gmap => gmap,
					food_pos => food_pos);
					
	screen1: ----------------------
					

END Behavior;