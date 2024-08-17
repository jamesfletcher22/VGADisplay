library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;


entity VGA_Jamestb is 
end entity VGA_Jamestb;

architecture tb of VGA_Jamestb is
    signal clk : std_logic := '0';
    signal red,green,blue,v_sync_o,h_sync_o : std_logic;
    begin 
        UUT : entity work.VGA_James
        port map(
            clk => clk,
            red => red,
            green => green,
            blue => blue,
            v_sync_o => v_sync_o,
            h_sync_o => h_sync_o
        );
        process is 
            begin 
                wait for 20 ns;
                clk <= not clk;
            end process;

        end architecture tb;


