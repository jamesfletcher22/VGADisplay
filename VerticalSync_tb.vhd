library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;
use std.env.finish;

entity VerticalSync_tb is 
end entity VerticalSync_tb;

architecture behave of VerticalSync_tb is 
    signal vert_sync_in : std_logic;
    signal clk_in : std_logic := '0';
    signal finish_flag_in : std_logic;
    signal count : integer; 
    constant C_CLK_PERIOD : time := 10 ns;
	begin 

    UUT : entity work.VerticalSync
    port map (
        clk => clk_in, 
        finish_flag => finish_flag_in,
        vert_sync => vert_sync_in,
	vert_row => count

    );

FINISH_FLAG_GEN : process is
	begin 
    finish_flag_in <= '1';
    wait for 20 ns; 
    finish_flag_in <= '0';
    end process; 

CLK_GEN :
    process is
	begin 
        wait for 10ns;
	clk_in <= not clk_in;
        end process; 
end architecture behave;