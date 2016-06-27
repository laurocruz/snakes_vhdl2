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

-- DATE "06/27/2016 16:55:06"

-- 
-- Device: Altera EP2C20F484C7 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	demo_fsm IS
    PORT (
	clock : IN std_logic;
	clear : IN std_logic;
	eaten : IN std_logic;
	hit : IN std_logic;
	KEY : IN std_logic_vector(1 DOWNTO 0);
	dir : BUFFER std_logic_vector(0 TO 1);
	FOOD_S : OUT std_logic;
	WALK_S : OUT std_logic;
	COLISION_S : OUT std_logic;
	EAT_S : OUT std_logic;
	GROW_S : OUT std_logic;
	RESET : OUT std_logic
	);
END demo_fsm;

-- Design Ports Information
-- dir[1]	=>  Location: PIN_H1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- dir[0]	=>  Location: PIN_E2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- FOOD_S	=>  Location: PIN_J1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- WALK_S	=>  Location: PIN_F1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- COLISION_S	=>  Location: PIN_J4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- EAT_S	=>  Location: PIN_F2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- GROW_S	=>  Location: PIN_C10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- RESET	=>  Location: PIN_E1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- clear	=>  Location: PIN_M2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- clock	=>  Location: PIN_M1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- KEY[0]	=>  Location: PIN_L8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- KEY[1]	=>  Location: PIN_H2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- eaten	=>  Location: PIN_H3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- hit	=>  Location: PIN_J2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF demo_fsm IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clock : std_logic;
SIGNAL ww_clear : std_logic;
SIGNAL ww_eaten : std_logic;
SIGNAL ww_hit : std_logic;
SIGNAL ww_KEY : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_dir : std_logic_vector(0 TO 1);
SIGNAL ww_FOOD_S : std_logic;
SIGNAL ww_WALK_S : std_logic;
SIGNAL ww_COLISION_S : std_logic;
SIGNAL ww_EAT_S : std_logic;
SIGNAL ww_GROW_S : std_logic;
SIGNAL ww_RESET : std_logic;
SIGNAL \clock~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clear~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \fsm1|dir[0]~16clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clear~combout\ : std_logic;
SIGNAL \fsm1|dir[1]~17_combout\ : std_logic;
SIGNAL \fsm1|dir[0]~16_combout\ : std_logic;
SIGNAL \fsm1|dir[0]~16clkctrl_outclk\ : std_logic;
SIGNAL \fsm1|dir[1]~1_combout\ : std_logic;
SIGNAL \fsm1|dir[1]~19_combout\ : std_logic;
SIGNAL \fsm1|dir[1]~0_combout\ : std_logic;
SIGNAL \hit~combout\ : std_logic;
SIGNAL \eaten~combout\ : std_logic;
SIGNAL \fsm1|current_state.EAT_CHECK~0_combout\ : std_logic;
SIGNAL \fsm1|current_state.GROW~0_combout\ : std_logic;
SIGNAL \fsm1|current_state.EAT_CHECK~regout\ : std_logic;
SIGNAL \fsm1|current_state.EAT_VERIFY~regout\ : std_logic;
SIGNAL \fsm1|current_state.GROW~1_combout\ : std_logic;
SIGNAL \fsm1|current_state.GROW~regout\ : std_logic;
SIGNAL \fsm1|current_state~13_combout\ : std_logic;
SIGNAL \fsm1|current_state.FOOD~regout\ : std_logic;
SIGNAL \fsm1|Selector0~0_combout\ : std_logic;
SIGNAL \fsm1|current_state.WALK~regout\ : std_logic;
SIGNAL \fsm1|current_state.COLISION_CHECK~feeder_combout\ : std_logic;
SIGNAL \fsm1|current_state.COLISION_CHECK~regout\ : std_logic;
SIGNAL \fsm1|current_state.COLISION_VERIFY~feeder_combout\ : std_logic;
SIGNAL \fsm1|current_state.COLISION_VERIFY~regout\ : std_logic;
SIGNAL \fsm1|current_state.START~0_combout\ : std_logic;
SIGNAL \fsm1|current_state.START~regout\ : std_logic;
SIGNAL \fsm1|dir[1]~_emulated_regout\ : std_logic;
SIGNAL \fsm1|dir[1]~3_combout\ : std_logic;
SIGNAL \fsm1|dir[1]~2_combout\ : std_logic;
SIGNAL \fsm1|dir[0]~18_combout\ : std_logic;
SIGNAL \fsm1|dir[0]~6_combout\ : std_logic;
SIGNAL \fsm1|dir[0]~20_combout\ : std_logic;
SIGNAL \fsm1|dir[0]~_emulated_regout\ : std_logic;
SIGNAL \fsm1|dir[0]~8_combout\ : std_logic;
SIGNAL \fsm1|dir[0]~7_combout\ : std_logic;
SIGNAL \clock~combout\ : std_logic;
SIGNAL \clock~clkctrl_outclk\ : std_logic;
SIGNAL \fsm1|FOOD_S~feeder_combout\ : std_logic;
SIGNAL \clear~clkctrl_outclk\ : std_logic;
SIGNAL \fsm1|dir[0]~15_combout\ : std_logic;
SIGNAL \fsm1|FOOD_S~regout\ : std_logic;
SIGNAL \fsm1|WALK_S~feeder_combout\ : std_logic;
SIGNAL \fsm1|WALK_S~regout\ : std_logic;
SIGNAL \fsm1|COLISION_S~feeder_combout\ : std_logic;
SIGNAL \fsm1|COLISION_S~regout\ : std_logic;
SIGNAL \fsm1|EAT_S~regout\ : std_logic;
SIGNAL \fsm1|RESET~feeder_combout\ : std_logic;
SIGNAL \fsm1|RESET~regout\ : std_logic;
SIGNAL \KEY~combout\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \fsm1|ALT_INV_current_state.START~regout\ : std_logic;
SIGNAL \fsm1|ALT_INV_RESET~regout\ : std_logic;

BEGIN

ww_clock <= clock;
ww_clear <= clear;
ww_eaten <= eaten;
ww_hit <= hit;
ww_KEY <= KEY;
dir <= ww_dir;
FOOD_S <= ww_FOOD_S;
WALK_S <= ww_WALK_S;
COLISION_S <= ww_COLISION_S;
EAT_S <= ww_EAT_S;
GROW_S <= ww_GROW_S;
RESET <= ww_RESET;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clock~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \clock~combout\);

\clear~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \clear~combout\);

\fsm1|dir[0]~16clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \fsm1|dir[0]~16_combout\);
\fsm1|ALT_INV_current_state.START~regout\ <= NOT \fsm1|current_state.START~regout\;
\fsm1|ALT_INV_RESET~regout\ <= NOT \fsm1|RESET~regout\;

-- Location: PIN_M2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\clear~I\ : cycloneii_io
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
	padio => ww_clear,
	combout => \clear~combout\);

-- Location: PIN_L8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\KEY[0]~I\ : cycloneii_io
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
	padio => ww_KEY(0),
	combout => \KEY~combout\(0));

-- Location: LCCOMB_X1_Y19_N12
\fsm1|dir[1]~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \fsm1|dir[1]~17_combout\ = \fsm1|dir[0]~7_combout\ $ (\KEY~combout\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm1|dir[0]~7_combout\,
	datad => \KEY~combout\(0),
	combout => \fsm1|dir[1]~17_combout\);

-- Location: LCCOMB_X1_Y19_N0
\fsm1|dir[0]~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \fsm1|dir[0]~16_combout\ = (!\clear~combout\ & ((\KEY~combout\(1)) # (\KEY~combout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KEY~combout\(1),
	datac => \clear~combout\,
	datad => \KEY~combout\(0),
	combout => \fsm1|dir[0]~16_combout\);

-- Location: CLKCTRL_G2
\fsm1|dir[0]~16clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \fsm1|dir[0]~16clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \fsm1|dir[0]~16clkctrl_outclk\);

-- Location: LCCOMB_X1_Y19_N6
\fsm1|dir[1]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \fsm1|dir[1]~1_combout\ = (\clear~combout\) # ((GLOBAL(\fsm1|dir[0]~16clkctrl_outclk\) & ((\fsm1|dir[1]~17_combout\))) # (!GLOBAL(\fsm1|dir[0]~16clkctrl_outclk\) & (\fsm1|dir[1]~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm1|dir[1]~1_combout\,
	datab => \clear~combout\,
	datac => \fsm1|dir[0]~16clkctrl_outclk\,
	datad => \fsm1|dir[1]~17_combout\,
	combout => \fsm1|dir[1]~1_combout\);

-- Location: LCCOMB_X1_Y19_N16
\fsm1|dir[1]~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \fsm1|dir[1]~19_combout\ = !\fsm1|dir[1]~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \fsm1|dir[1]~1_combout\,
	combout => \fsm1|dir[1]~19_combout\);

-- Location: LCCOMB_X1_Y19_N4
\fsm1|dir[1]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \fsm1|dir[1]~0_combout\ = (\clear~combout\) # (\fsm1|dir[0]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \clear~combout\,
	datad => \fsm1|dir[0]~16_combout\,
	combout => \fsm1|dir[1]~0_combout\);

-- Location: PIN_J2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\hit~I\ : cycloneii_io
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
	padio => ww_hit,
	combout => \hit~combout\);

-- Location: PIN_H3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
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
	padio => ww_eaten,
	combout => \eaten~combout\);

-- Location: LCCOMB_X2_Y19_N20
\fsm1|current_state.EAT_CHECK~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \fsm1|current_state.EAT_CHECK~0_combout\ = (!\hit~combout\ & \fsm1|current_state.COLISION_VERIFY~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \hit~combout\,
	datad => \fsm1|current_state.COLISION_VERIFY~regout\,
	combout => \fsm1|current_state.EAT_CHECK~0_combout\);

-- Location: PIN_H2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\KEY[1]~I\ : cycloneii_io
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
	padio => ww_KEY(1),
	combout => \KEY~combout\(1));

-- Location: LCCOMB_X1_Y19_N14
\fsm1|current_state.GROW~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \fsm1|current_state.GROW~0_combout\ = (!\clear~combout\ & (!\KEY~combout\(0) & !\KEY~combout\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \clear~combout\,
	datac => \KEY~combout\(0),
	datad => \KEY~combout\(1),
	combout => \fsm1|current_state.GROW~0_combout\);

-- Location: LCFF_X2_Y19_N21
\fsm1|current_state.EAT_CHECK\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \fsm1|current_state.EAT_CHECK~0_combout\,
	ena => \fsm1|current_state.GROW~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \fsm1|current_state.EAT_CHECK~regout\);

-- Location: LCFF_X2_Y19_N25
\fsm1|current_state.EAT_VERIFY\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	sdata => \fsm1|current_state.EAT_CHECK~regout\,
	sload => VCC,
	ena => \fsm1|current_state.GROW~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \fsm1|current_state.EAT_VERIFY~regout\);

-- Location: LCCOMB_X1_Y19_N26
\fsm1|current_state.GROW~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \fsm1|current_state.GROW~1_combout\ = (\fsm1|current_state.GROW~0_combout\ & (\eaten~combout\ & ((\fsm1|current_state.EAT_VERIFY~regout\)))) # (!\fsm1|current_state.GROW~0_combout\ & (((\fsm1|current_state.GROW~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm1|current_state.GROW~0_combout\,
	datab => \eaten~combout\,
	datac => \fsm1|current_state.GROW~regout\,
	datad => \fsm1|current_state.EAT_VERIFY~regout\,
	combout => \fsm1|current_state.GROW~1_combout\);

-- Location: LCFF_X1_Y19_N27
\fsm1|current_state.GROW\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \fsm1|current_state.GROW~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \fsm1|current_state.GROW~regout\);

-- Location: LCCOMB_X2_Y19_N10
\fsm1|current_state~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \fsm1|current_state~13_combout\ = (\fsm1|current_state.GROW~regout\) # (!\fsm1|current_state.START~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \fsm1|current_state.START~regout\,
	datad => \fsm1|current_state.GROW~regout\,
	combout => \fsm1|current_state~13_combout\);

-- Location: LCFF_X2_Y19_N11
\fsm1|current_state.FOOD\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \fsm1|current_state~13_combout\,
	ena => \fsm1|current_state.GROW~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \fsm1|current_state.FOOD~regout\);

-- Location: LCCOMB_X2_Y19_N12
\fsm1|Selector0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \fsm1|Selector0~0_combout\ = (\fsm1|current_state.FOOD~regout\) # ((!\eaten~combout\ & \fsm1|current_state.EAT_VERIFY~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \eaten~combout\,
	datac => \fsm1|current_state.EAT_VERIFY~regout\,
	datad => \fsm1|current_state.FOOD~regout\,
	combout => \fsm1|Selector0~0_combout\);

-- Location: LCFF_X2_Y19_N13
\fsm1|current_state.WALK\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \fsm1|Selector0~0_combout\,
	ena => \fsm1|current_state.GROW~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \fsm1|current_state.WALK~regout\);

-- Location: LCCOMB_X2_Y19_N22
\fsm1|current_state.COLISION_CHECK~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \fsm1|current_state.COLISION_CHECK~feeder_combout\ = \fsm1|current_state.WALK~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \fsm1|current_state.WALK~regout\,
	combout => \fsm1|current_state.COLISION_CHECK~feeder_combout\);

-- Location: LCFF_X2_Y19_N23
\fsm1|current_state.COLISION_CHECK\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \fsm1|current_state.COLISION_CHECK~feeder_combout\,
	ena => \fsm1|current_state.GROW~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \fsm1|current_state.COLISION_CHECK~regout\);

-- Location: LCCOMB_X2_Y19_N26
\fsm1|current_state.COLISION_VERIFY~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \fsm1|current_state.COLISION_VERIFY~feeder_combout\ = \fsm1|current_state.COLISION_CHECK~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \fsm1|current_state.COLISION_CHECK~regout\,
	combout => \fsm1|current_state.COLISION_VERIFY~feeder_combout\);

-- Location: LCFF_X2_Y19_N27
\fsm1|current_state.COLISION_VERIFY\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \fsm1|current_state.COLISION_VERIFY~feeder_combout\,
	ena => \fsm1|current_state.GROW~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \fsm1|current_state.COLISION_VERIFY~regout\);

-- Location: LCCOMB_X2_Y19_N30
\fsm1|current_state.START~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \fsm1|current_state.START~0_combout\ = (!\fsm1|current_state.COLISION_VERIFY~regout\) # (!\hit~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \hit~combout\,
	datad => \fsm1|current_state.COLISION_VERIFY~regout\,
	combout => \fsm1|current_state.START~0_combout\);

-- Location: LCFF_X2_Y19_N31
\fsm1|current_state.START\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \fsm1|current_state.START~0_combout\,
	ena => \fsm1|current_state.GROW~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \fsm1|current_state.START~regout\);

-- Location: LCFF_X1_Y19_N17
\fsm1|dir[1]~_emulated\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \fsm1|dir[1]~19_combout\,
	aclr => \fsm1|dir[1]~0_combout\,
	ena => \fsm1|ALT_INV_current_state.START~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \fsm1|dir[1]~_emulated_regout\);

-- Location: LCCOMB_X1_Y19_N8
\fsm1|dir[1]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \fsm1|dir[1]~3_combout\ = \fsm1|dir[1]~_emulated_regout\ $ (\fsm1|dir[1]~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \fsm1|dir[1]~_emulated_regout\,
	datad => \fsm1|dir[1]~1_combout\,
	combout => \fsm1|dir[1]~3_combout\);

-- Location: LCCOMB_X1_Y19_N28
\fsm1|dir[1]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \fsm1|dir[1]~2_combout\ = (\clear~combout\) # ((\fsm1|dir[0]~16_combout\ & (\fsm1|dir[1]~17_combout\)) # (!\fsm1|dir[0]~16_combout\ & ((\fsm1|dir[1]~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clear~combout\,
	datab => \fsm1|dir[1]~17_combout\,
	datac => \fsm1|dir[1]~3_combout\,
	datad => \fsm1|dir[0]~16_combout\,
	combout => \fsm1|dir[1]~2_combout\);

-- Location: LCCOMB_X1_Y19_N30
\fsm1|dir[0]~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \fsm1|dir[0]~18_combout\ = \fsm1|dir[1]~2_combout\ $ (!\KEY~combout\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm1|dir[1]~2_combout\,
	datac => \KEY~combout\(0),
	combout => \fsm1|dir[0]~18_combout\);

-- Location: LCCOMB_X1_Y19_N2
\fsm1|dir[0]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \fsm1|dir[0]~6_combout\ = (\clear~combout\) # ((GLOBAL(\fsm1|dir[0]~16clkctrl_outclk\) & ((\fsm1|dir[0]~18_combout\))) # (!GLOBAL(\fsm1|dir[0]~16clkctrl_outclk\) & (\fsm1|dir[0]~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clear~combout\,
	datab => \fsm1|dir[0]~6_combout\,
	datac => \fsm1|dir[0]~16clkctrl_outclk\,
	datad => \fsm1|dir[0]~18_combout\,
	combout => \fsm1|dir[0]~6_combout\);

-- Location: LCCOMB_X1_Y19_N24
\fsm1|dir[0]~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \fsm1|dir[0]~20_combout\ = !\fsm1|dir[0]~6_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \fsm1|dir[0]~6_combout\,
	combout => \fsm1|dir[0]~20_combout\);

-- Location: LCFF_X1_Y19_N25
\fsm1|dir[0]~_emulated\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \fsm1|dir[0]~20_combout\,
	aclr => \fsm1|dir[1]~0_combout\,
	ena => \fsm1|ALT_INV_current_state.START~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \fsm1|dir[0]~_emulated_regout\);

-- Location: LCCOMB_X1_Y19_N20
\fsm1|dir[0]~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \fsm1|dir[0]~8_combout\ = \fsm1|dir[0]~_emulated_regout\ $ (\fsm1|dir[0]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \fsm1|dir[0]~_emulated_regout\,
	datad => \fsm1|dir[0]~6_combout\,
	combout => \fsm1|dir[0]~8_combout\);

-- Location: LCCOMB_X1_Y19_N10
\fsm1|dir[0]~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \fsm1|dir[0]~7_combout\ = (\clear~combout\) # ((\fsm1|dir[0]~16_combout\ & (\fsm1|dir[0]~18_combout\)) # (!\fsm1|dir[0]~16_combout\ & ((\fsm1|dir[0]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clear~combout\,
	datab => \fsm1|dir[0]~18_combout\,
	datac => \fsm1|dir[0]~8_combout\,
	datad => \fsm1|dir[0]~16_combout\,
	combout => \fsm1|dir[0]~7_combout\);

-- Location: PIN_M1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\clock~I\ : cycloneii_io
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
	padio => ww_clock,
	combout => \clock~combout\);

-- Location: CLKCTRL_G3
\clock~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clock~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clock~clkctrl_outclk\);

-- Location: LCCOMB_X2_Y19_N16
\fsm1|FOOD_S~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \fsm1|FOOD_S~feeder_combout\ = \fsm1|current_state.FOOD~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \fsm1|current_state.FOOD~regout\,
	combout => \fsm1|FOOD_S~feeder_combout\);

-- Location: CLKCTRL_G1
\clear~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clear~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clear~clkctrl_outclk\);

-- Location: LCCOMB_X1_Y19_N22
\fsm1|dir[0]~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \fsm1|dir[0]~15_combout\ = (!\KEY~combout\(0) & !\KEY~combout\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \KEY~combout\(0),
	datad => \KEY~combout\(1),
	combout => \fsm1|dir[0]~15_combout\);

-- Location: LCFF_X2_Y19_N17
\fsm1|FOOD_S\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \fsm1|FOOD_S~feeder_combout\,
	aclr => \clear~clkctrl_outclk\,
	ena => \fsm1|dir[0]~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \fsm1|FOOD_S~regout\);

-- Location: LCCOMB_X2_Y19_N18
\fsm1|WALK_S~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \fsm1|WALK_S~feeder_combout\ = \fsm1|current_state.WALK~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \fsm1|current_state.WALK~regout\,
	combout => \fsm1|WALK_S~feeder_combout\);

-- Location: LCFF_X2_Y19_N19
\fsm1|WALK_S\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \fsm1|WALK_S~feeder_combout\,
	aclr => \clear~clkctrl_outclk\,
	ena => \fsm1|dir[0]~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \fsm1|WALK_S~regout\);

-- Location: LCCOMB_X2_Y19_N28
\fsm1|COLISION_S~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \fsm1|COLISION_S~feeder_combout\ = \fsm1|current_state.COLISION_CHECK~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \fsm1|current_state.COLISION_CHECK~regout\,
	combout => \fsm1|COLISION_S~feeder_combout\);

-- Location: LCFF_X2_Y19_N29
\fsm1|COLISION_S\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \fsm1|COLISION_S~feeder_combout\,
	aclr => \clear~clkctrl_outclk\,
	ena => \fsm1|dir[0]~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \fsm1|COLISION_S~regout\);

-- Location: LCFF_X2_Y19_N3
\fsm1|EAT_S\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	sdata => \fsm1|current_state.EAT_CHECK~regout\,
	aclr => \clear~clkctrl_outclk\,
	sload => VCC,
	ena => \fsm1|dir[0]~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \fsm1|EAT_S~regout\);

-- Location: LCCOMB_X2_Y19_N0
\fsm1|RESET~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \fsm1|RESET~feeder_combout\ = \fsm1|current_state.START~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \fsm1|current_state.START~regout\,
	combout => \fsm1|RESET~feeder_combout\);

-- Location: LCFF_X2_Y19_N1
\fsm1|RESET\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \fsm1|RESET~feeder_combout\,
	aclr => \clear~clkctrl_outclk\,
	ena => \fsm1|dir[0]~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \fsm1|RESET~regout\);

-- Location: PIN_H1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dir[1]~I\ : cycloneii_io
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
	datain => \fsm1|dir[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dir(1));

-- Location: PIN_E2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\dir[0]~I\ : cycloneii_io
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
	datain => \fsm1|dir[0]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_dir(0));

-- Location: PIN_J1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\FOOD_S~I\ : cycloneii_io
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
	datain => \fsm1|FOOD_S~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_FOOD_S);

-- Location: PIN_F1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\WALK_S~I\ : cycloneii_io
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
	datain => \fsm1|WALK_S~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_WALK_S);

-- Location: PIN_J4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\COLISION_S~I\ : cycloneii_io
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
	datain => \fsm1|COLISION_S~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_COLISION_S);

-- Location: PIN_F2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \fsm1|EAT_S~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_EAT_S);

-- Location: PIN_C10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\GROW_S~I\ : cycloneii_io
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
	datain => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_GROW_S);

-- Location: PIN_E1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \fsm1|ALT_INV_RESET~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_RESET);
END structure;


