library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;


entity clkdivider is
Generic (
	G_DIV_RATIO : integer := 2
);
port(
		clk : in std_logic;
		clk_div : out std_logic
		);

end entity; 


architecture rtl of clkdivider is
	signal count : integer range 0 to G_DIV_RATIO;
	signal clk_divs : std_logic := '0';
	
	begin
	
	process (clk) is
	begin
	if rising_edge(clk) then
			clk_divs <= not clk_divs;
			end if;
	clk_div <= clk_divs;

end process; 



end architecture rtl; 