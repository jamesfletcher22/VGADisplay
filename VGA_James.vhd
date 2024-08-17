library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

--640 inidividual pixels on 480 rows
--60Hz ~ 40ns per pixel = 25MHz clock
--div by req'd
--Horziontal sync, after 640 pixels are done, start a new row.
--Vertical sync, starting again at (0,0)


--only have single IO each for R,G,B 
--Horizontal and vert sync required
--

-- might be worth starting with just a red square.
-- 640 1's on the R, 640 0's on the G, 640 0's on the B
-- that's a serial 1. so just set it high on every clock cycle, 
entity VGA_James is
	port(
		clk : in std_logic;
		red,green,blue : out std_logic;
		v_sync_o : out std_logic;
		h_sync_o : out std_logic
	);
end entity VGA_James; 

architecture rtl of VGA_James is 
	-- int signals here
	signal v_sync : std_logic;
	signal h_sync : std_logic;
	signal clk_div : std_logic;
	signal finish_flag_o : std_logic;
	signal vert_row : integer;
	signal horiz_column : integer;
	
	begin 
		
process (clk) is
	begin 
	if rising_edge(clk) then
		if vert_row > 480 or horiz_column > 640 then 
			red <= '0';
			green <= '0';
			blue <= '0';
		end if;
				if horiz_column < 160 then
				red <= '1';
				green <= '0';
				blue <= '0';
				end if;
				if horiz_column < 320 and horiz_column > 160 then
				red <= '0';
				green <= '1';
				blue <= '0';
				end if;
				if horiz_column < 480 and horiz_column > 320 then
				red <= '0';
				green <= '0';
				blue <= '1';
				end if;
				if horiz_column < 640 and horiz_column > 480 then
				red <= '0';
				green <= '1';
				blue <= '1';
				end if;
				
	end if;
	end process;
	
HORIZ_SYNC: entity work.HorizontalSync 
	port map(
		clk => clk_div,
		horiz_sync => h_sync,
		finish_flag => finish_flag_o,
		horiz_column => horiz_column
		);
		
VERT_SYNC: entity work.VerticalSync
	port map(
		clk => clk_div,
		finish_flag => finish_flag_o,
		vert_sync => v_sync,
		vert_row => vert_row
	);
	
clkdiv_inst : entity work.clkdivider
	--can map generic here if you want to change the divider ratio. Default is div/2
	port map(
	clk => clk,
	clk_div => clk_div
	);
	v_sync_o <= v_sync;
	h_sync_o <= h_sync;
	
	end architecture rtl; 
	