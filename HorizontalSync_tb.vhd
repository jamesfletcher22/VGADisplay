library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;
    use std.env.finish; 
entity HorizontalSync_tb is 
end entity HorizontalSync_tb;

architecture behave of HorizontalSync_tb is 
    signal horiz_sync_in,clk_en_in : std_logic;
    signal clk_in : std_logic := '0';
    signal flag : std_logic := '0';
    signal count : integer; 
	begin 

    UUT : entity work.HorizontalSync
    port map (
        clk => clk_in, 
        horiz_sync => horiz_sync_in,
   	finish_flag => flag,
	counts => count

    );

    process is 
        begin 
            wait for 10 ns; 
            clk_in <= not clk_in; 
        end process; 
end architecture behave;