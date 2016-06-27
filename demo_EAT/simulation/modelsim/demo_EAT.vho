-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"

-- DATE "06/27/2016 16:54:06"

-- 
-- Device: Altera EP2C20F484C7 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
LIBRARY STD;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE STD.STANDARD.ALL;

ENTITY 	demo_EAT IS
    PORT (
	RESET : IN std_logic;
	EAT_S : IN std_logic;
	food_pos : IN STD.STANDARD.integer range -20 TO 255;
	snake_head : IN STD.STANDARD.integer range -20 TO 255;
	snake_size : OUT STD.STANDARD.integer range 0 TO 100;
	eaten : OUT std_logic
	);
END demo_EAT;

-- Design Ports Information
-- food_pos[8]	=>  Location: PIN_R22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- snake_head[8]	=>  Location: PIN_E7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- snake_size[0]	=>  Location: PIN_B11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- snake_size[1]	=>  Location: PIN_B10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- snake_size[2]	=>  Location: PIN_A11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- snake_size[3]	=>  Location: PIN_A10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- snake_size[4]	=>  Location: PIN_D11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- snake_size[5]	=>  Location: PIN_H11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- snake_size[6]	=>  Location: PIN_AB7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- eaten	=>  Location: PIN_G11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- EAT_S	=>  Location: PIN_E11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- food_pos[0]	=>  Location: PIN_H12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- food_pos[1]	=>  Location: PIN_F12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- snake_head[1]	=>  Location: PIN_G12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- snake_head[0]	=>  Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- food_pos[2]	=>  Location: PIN_A7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- food_pos[3]	=>  Location: PIN_B7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- snake_head[3]	=>  Location: PIN_E8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- snake_head[2]	=>  Location: PIN_F9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- food_pos[4]	=>  Location: PIN_G8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- food_pos[5]	=>  Location: PIN_H7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- snake_head[5]	=>  Location: PIN_H8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- snake_head[4]	=>  Location: PIN_C7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- food_pos[6]	=>  Location: PIN_A13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- food_pos[7]	=>  Location: PIN_A14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- snake_head[7]	=>  Location: PIN_B13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- snake_head[6]	=>  Location: PIN_C10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- RESET	=>  Location: PIN_L1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF demo_EAT IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_RESET : std_logic;
SIGNAL ww_EAT_S : std_logic;
SIGNAL ww_food_pos : std_logic_vector(8 DOWNTO 0);
SIGNAL ww_snake_head : std_logic_vector(8 DOWNTO 0);
SIGNAL ww_snake_size : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_eaten : std_logic;
SIGNAL \eat1|snake_size[5]~1clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \eat1|Equal0~3_combout\ : std_logic;
SIGNAL \RESET~combout\ : std_logic;
SIGNAL \eat1|Equal0~1_combout\ : std_logic;
SIGNAL \eat1|Equal0~2_combout\ : std_logic;
SIGNAL \eat1|Equal0~0_combout\ : std_logic;
SIGNAL \eat1|Equal0~4_combout\ : std_logic;
SIGNAL \EAT_S~combout\ : std_logic;
SIGNAL \eat1|snake_size[0]~0_combout\ : std_logic;
SIGNAL \eat1|Add0~0_combout\ : std_logic;
SIGNAL \eat1|snake_size[5]~1_combout\ : std_logic;
SIGNAL \eat1|snake_size[5]~1clkctrl_outclk\ : std_logic;
SIGNAL \eat1|Add0~1\ : std_logic;
SIGNAL \eat1|Add0~2_combout\ : std_logic;
SIGNAL \eat1|Add0~3\ : std_logic;
SIGNAL \eat1|Add0~4_combout\ : std_logic;
SIGNAL \eat1|Add0~5\ : std_logic;
SIGNAL \eat1|Add0~6_combout\ : std_logic;
SIGNAL \eat1|Add0~7\ : std_logic;
SIGNAL \eat1|Add0~8_combout\ : std_logic;
SIGNAL \eat1|comb~0_combout\ : std_logic;
SIGNAL \eat1|eaten~combout\ : std_logic;
SIGNAL \snake_head~combout\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \food_pos~combout\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \eat1|snake_size\ : std_logic_vector(5 DOWNTO 0);

BEGIN

ww_RESET <= RESET;
ww_EAT_S <= EAT_S;
ww_food_pos <= IEEE.STD_LOGIC_ARITH.CONV_STD_LOGIC_VECTOR(food_pos, 9);
ww_snake_head <= IEEE.STD_LOGIC_ARITH.CONV_STD_LOGIC_VECTOR(snake_head, 9);
snake_size <= IEEE.STD_LOGIC_ARITH.CONV_INTEGER(UNSIGNED(ww_snake_size));
eaten <= ww_eaten;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\eat1|snake_size[5]~1clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \eat1|snake_size[5]~1_combout\);

-- Location: LCCOMB_X26_Y26_N20
\eat1|Equal0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \eat1|Equal0~3_combout\ = (\food_pos~combout\(6) & (\snake_head~combout\(6) & (\snake_head~combout\(7) $ (!\food_pos~combout\(7))))) # (!\food_pos~combout\(6) & (!\snake_head~combout\(6) & (\snake_head~combout\(7) $ (!\food_pos~combout\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \food_pos~combout\(6),
	datab => \snake_head~combout\(7),
	datac => \snake_head~combout\(6),
	datad => \food_pos~combout\(7),
	combout => \eat1|Equal0~3_combout\);

-- Location: PIN_F12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\food_pos[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_food_pos(1),
	combout => \food_pos~combout\(1));

-- Location: PIN_F9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\snake_head[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_snake_head(2),
	combout => \snake_head~combout\(2));

-- Location: PIN_H8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\snake_head[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_snake_head(5),
	combout => \snake_head~combout\(5));

-- Location: PIN_A13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\food_pos[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_food_pos(6),
	combout => \food_pos~combout\(6));

-- Location: PIN_A14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\food_pos[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_food_pos(7),
	combout => \food_pos~combout\(7));

-- Location: PIN_B13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\snake_head[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_snake_head(7),
	combout => \snake_head~combout\(7));

-- Location: PIN_C10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\snake_head[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_snake_head(6),
	combout => \snake_head~combout\(6));

-- Location: PIN_L1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\RESET~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_RESET,
	combout => \RESET~combout\);

-- Location: PIN_A7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\food_pos[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_food_pos(2),
	combout => \food_pos~combout\(2));

-- Location: PIN_B7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\food_pos[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_food_pos(3),
	combout => \food_pos~combout\(3));

-- Location: PIN_E8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\snake_head[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_snake_head(3),
	combout => \snake_head~combout\(3));

-- Location: LCCOMB_X11_Y26_N0
\eat1|Equal0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \eat1|Equal0~1_combout\ = (\snake_head~combout\(2) & (\food_pos~combout\(2) & (\food_pos~combout\(3) $ (!\snake_head~combout\(3))))) # (!\snake_head~combout\(2) & (!\food_pos~combout\(2) & (\food_pos~combout\(3) $ (!\snake_head~combout\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \snake_head~combout\(2),
	datab => \food_pos~combout\(2),
	datac => \food_pos~combout\(3),
	datad => \snake_head~combout\(3),
	combout => \eat1|Equal0~1_combout\);

-- Location: PIN_G8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\food_pos[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_food_pos(4),
	combout => \food_pos~combout\(4));

-- Location: PIN_H7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\food_pos[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_food_pos(5),
	combout => \food_pos~combout\(5));

-- Location: PIN_C7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\snake_head[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_snake_head(4),
	combout => \snake_head~combout\(4));

-- Location: LCCOMB_X7_Y26_N24
\eat1|Equal0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \eat1|Equal0~2_combout\ = (\snake_head~combout\(5) & (\food_pos~combout\(5) & (\food_pos~combout\(4) $ (!\snake_head~combout\(4))))) # (!\snake_head~combout\(5) & (!\food_pos~combout\(5) & (\food_pos~combout\(4) $ (!\snake_head~combout\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \snake_head~combout\(5),
	datab => \food_pos~combout\(4),
	datac => \food_pos~combout\(5),
	datad => \snake_head~combout\(4),
	combout => \eat1|Equal0~2_combout\);

-- Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\snake_head[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_snake_head(0),
	combout => \snake_head~combout\(0));

-- Location: PIN_H12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\food_pos[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_food_pos(0),
	combout => \food_pos~combout\(0));

-- Location: PIN_G12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\snake_head[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_snake_head(1),
	combout => \snake_head~combout\(1));

-- Location: LCCOMB_X31_Y26_N20
\eat1|Equal0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \eat1|Equal0~0_combout\ = (\food_pos~combout\(1) & (\snake_head~combout\(1) & (\snake_head~combout\(0) $ (!\food_pos~combout\(0))))) # (!\food_pos~combout\(1) & (!\snake_head~combout\(1) & (\snake_head~combout\(0) $ (!\food_pos~combout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \food_pos~combout\(1),
	datab => \snake_head~combout\(0),
	datac => \food_pos~combout\(0),
	datad => \snake_head~combout\(1),
	combout => \eat1|Equal0~0_combout\);

-- Location: LCCOMB_X23_Y26_N14
\eat1|Equal0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \eat1|Equal0~4_combout\ = (\eat1|Equal0~3_combout\ & (\eat1|Equal0~1_combout\ & (\eat1|Equal0~2_combout\ & \eat1|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \eat1|Equal0~3_combout\,
	datab => \eat1|Equal0~1_combout\,
	datac => \eat1|Equal0~2_combout\,
	datad => \eat1|Equal0~0_combout\,
	combout => \eat1|Equal0~4_combout\);

-- Location: PIN_E11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\EAT_S~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_EAT_S,
	combout => \EAT_S~combout\);

-- Location: LCCOMB_X23_Y26_N18
\eat1|snake_size[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \eat1|snake_size[0]~0_combout\ = (!\RESET~combout\ & (\eat1|snake_size[0]~0_combout\ $ (((\eat1|Equal0~4_combout\ & \EAT_S~combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \eat1|snake_size[0]~0_combout\,
	datab => \RESET~combout\,
	datac => \eat1|Equal0~4_combout\,
	datad => \EAT_S~combout\,
	combout => \eat1|snake_size[0]~0_combout\);

-- Location: LCCOMB_X23_Y26_N20
\eat1|Add0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \eat1|Add0~0_combout\ = (\eat1|snake_size\(1) & (\eat1|snake_size[0]~0_combout\ $ (VCC))) # (!\eat1|snake_size\(1) & (\eat1|snake_size[0]~0_combout\ & VCC))
-- \eat1|Add0~1\ = CARRY((\eat1|snake_size\(1) & \eat1|snake_size[0]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \eat1|snake_size\(1),
	datab => \eat1|snake_size[0]~0_combout\,
	datad => VCC,
	combout => \eat1|Add0~0_combout\,
	cout => \eat1|Add0~1\);

-- Location: LCCOMB_X23_Y26_N6
\eat1|snake_size[5]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \eat1|snake_size[5]~1_combout\ = (\eat1|Equal0~4_combout\ & \EAT_S~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \eat1|Equal0~4_combout\,
	datad => \EAT_S~combout\,
	combout => \eat1|snake_size[5]~1_combout\);

-- Location: CLKCTRL_G8
\eat1|snake_size[5]~1clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \eat1|snake_size[5]~1clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \eat1|snake_size[5]~1clkctrl_outclk\);

-- Location: LCCOMB_X23_Y26_N10
\eat1|snake_size[1]\ : cycloneii_lcell_comb
-- Equation(s):
-- \eat1|snake_size\(1) = (\RESET~combout\) # ((GLOBAL(\eat1|snake_size[5]~1clkctrl_outclk\) & ((\eat1|Add0~0_combout\))) # (!GLOBAL(\eat1|snake_size[5]~1clkctrl_outclk\) & (\eat1|snake_size\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RESET~combout\,
	datab => \eat1|snake_size\(1),
	datac => \eat1|Add0~0_combout\,
	datad => \eat1|snake_size[5]~1clkctrl_outclk\,
	combout => \eat1|snake_size\(1));

-- Location: LCCOMB_X23_Y26_N22
\eat1|Add0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \eat1|Add0~2_combout\ = (\eat1|snake_size\(2) & (!\eat1|Add0~1\)) # (!\eat1|snake_size\(2) & ((\eat1|Add0~1\) # (GND)))
-- \eat1|Add0~3\ = CARRY((!\eat1|Add0~1\) # (!\eat1|snake_size\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \eat1|snake_size\(2),
	datad => VCC,
	cin => \eat1|Add0~1\,
	combout => \eat1|Add0~2_combout\,
	cout => \eat1|Add0~3\);

-- Location: LCCOMB_X23_Y26_N4
\eat1|snake_size[2]\ : cycloneii_lcell_comb
-- Equation(s):
-- \eat1|snake_size\(2) = (!\RESET~combout\ & ((GLOBAL(\eat1|snake_size[5]~1clkctrl_outclk\) & (\eat1|Add0~2_combout\)) # (!GLOBAL(\eat1|snake_size[5]~1clkctrl_outclk\) & ((\eat1|snake_size\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RESET~combout\,
	datab => \eat1|Add0~2_combout\,
	datac => \eat1|snake_size\(2),
	datad => \eat1|snake_size[5]~1clkctrl_outclk\,
	combout => \eat1|snake_size\(2));

-- Location: LCCOMB_X23_Y26_N24
\eat1|Add0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \eat1|Add0~4_combout\ = (\eat1|snake_size\(3) & (\eat1|Add0~3\ $ (GND))) # (!\eat1|snake_size\(3) & (!\eat1|Add0~3\ & VCC))
-- \eat1|Add0~5\ = CARRY((\eat1|snake_size\(3) & !\eat1|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \eat1|snake_size\(3),
	datad => VCC,
	cin => \eat1|Add0~3\,
	combout => \eat1|Add0~4_combout\,
	cout => \eat1|Add0~5\);

-- Location: LCCOMB_X23_Y26_N2
\eat1|snake_size[3]\ : cycloneii_lcell_comb
-- Equation(s):
-- \eat1|snake_size\(3) = (!\RESET~combout\ & ((GLOBAL(\eat1|snake_size[5]~1clkctrl_outclk\) & ((\eat1|Add0~4_combout\))) # (!GLOBAL(\eat1|snake_size[5]~1clkctrl_outclk\) & (\eat1|snake_size\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RESET~combout\,
	datab => \eat1|snake_size\(3),
	datac => \eat1|Add0~4_combout\,
	datad => \eat1|snake_size[5]~1clkctrl_outclk\,
	combout => \eat1|snake_size\(3));

-- Location: LCCOMB_X23_Y26_N26
\eat1|Add0~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \eat1|Add0~6_combout\ = (\eat1|snake_size\(4) & (!\eat1|Add0~5\)) # (!\eat1|snake_size\(4) & ((\eat1|Add0~5\) # (GND)))
-- \eat1|Add0~7\ = CARRY((!\eat1|Add0~5\) # (!\eat1|snake_size\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \eat1|snake_size\(4),
	datad => VCC,
	cin => \eat1|Add0~5\,
	combout => \eat1|Add0~6_combout\,
	cout => \eat1|Add0~7\);

-- Location: LCCOMB_X23_Y26_N30
\eat1|snake_size[4]\ : cycloneii_lcell_comb
-- Equation(s):
-- \eat1|snake_size\(4) = (!\RESET~combout\ & ((GLOBAL(\eat1|snake_size[5]~1clkctrl_outclk\) & ((\eat1|Add0~6_combout\))) # (!GLOBAL(\eat1|snake_size[5]~1clkctrl_outclk\) & (\eat1|snake_size\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RESET~combout\,
	datab => \eat1|snake_size\(4),
	datac => \eat1|snake_size[5]~1clkctrl_outclk\,
	datad => \eat1|Add0~6_combout\,
	combout => \eat1|snake_size\(4));

-- Location: LCCOMB_X23_Y26_N28
\eat1|Add0~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \eat1|Add0~8_combout\ = \eat1|snake_size\(5) $ (!\eat1|Add0~7\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \eat1|snake_size\(5),
	cin => \eat1|Add0~7\,
	combout => \eat1|Add0~8_combout\);

-- Location: LCCOMB_X23_Y26_N8
\eat1|snake_size[5]\ : cycloneii_lcell_comb
-- Equation(s):
-- \eat1|snake_size\(5) = (!\RESET~combout\ & ((GLOBAL(\eat1|snake_size[5]~1clkctrl_outclk\) & ((\eat1|Add0~8_combout\))) # (!GLOBAL(\eat1|snake_size[5]~1clkctrl_outclk\) & (\eat1|snake_size\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RESET~combout\,
	datab => \eat1|snake_size\(5),
	datac => \eat1|snake_size[5]~1clkctrl_outclk\,
	datad => \eat1|Add0~8_combout\,
	combout => \eat1|snake_size\(5));

-- Location: LCCOMB_X23_Y26_N12
\eat1|comb~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \eat1|comb~0_combout\ = (\RESET~combout\) # (!\EAT_S~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \EAT_S~combout\,
	datad => \RESET~combout\,
	combout => \eat1|comb~0_combout\);

-- Location: LCCOMB_X22_Y26_N28
\eat1|eaten\ : cycloneii_lcell_comb
-- Equation(s):
-- \eat1|eaten~combout\ = (!\eat1|comb~0_combout\ & ((\eat1|Equal0~4_combout\) # (\eat1|eaten~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \eat1|Equal0~4_combout\,
	datac => \eat1|comb~0_combout\,
	datad => \eat1|eaten~combout\,
	combout => \eat1|eaten~combout\);

-- Location: PIN_R22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\food_pos[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_food_pos(8));

-- Location: PIN_E7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\snake_head[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_snake_head(8));

-- Location: PIN_B11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\snake_size[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \eat1|snake_size[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_snake_size(0));

-- Location: PIN_B10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\snake_size[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \eat1|snake_size\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_snake_size(1));

-- Location: PIN_A11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\snake_size[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \eat1|snake_size\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_snake_size(2));

-- Location: PIN_A10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\snake_size[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \eat1|snake_size\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_snake_size(3));

-- Location: PIN_D11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\snake_size[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \eat1|snake_size\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_snake_size(4));

-- Location: PIN_H11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\snake_size[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \eat1|snake_size\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_snake_size(5));

-- Location: PIN_AB7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\snake_size[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_snake_size(6));

-- Location: PIN_G11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\eaten~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \eat1|eaten~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_eaten);
END structure;


