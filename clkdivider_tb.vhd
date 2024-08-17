library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity clkdivider_tb is
end entity clkdivider_tb;

architecture tb of clkdivider_tb is 
    signal clk : std_logic := '0' ;
    signal clk_div : std_logic;
begin	
    UUT : entity work.clkdivider 
    port map(
        clk => clk,
        clk_div => clk_div
    );   
        process is 
            begin 
                wait for 10 ns; 
                clk <= not clk;
            end process; 

        end architecture tb; 