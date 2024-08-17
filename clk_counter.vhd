library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;
	
	
--a counter that takes in a maximum count as a generic integer. Maximum counter can be mapped to another value 
--Sets a flag high when counting is complete
	 
entity clk_counter is 
	generic(
				G_COUNT_MAX : integer := 640);
	port(
			trigger : in std_logic := 1;
			clk : in std_logic;
			count_fin : out std_logic;
	
	);
	
end entity clk_counter; 


architecture rtl of clk_counter is 

--signals
	signal count : integer; 

	process clk is 
	begin 
	if rising_edge(clk) and trigger then
		count <= count + 1; 
		if count = G_COUNT_MAX then 
			count_fin <= 1; 
		else 
			count_fin <= 0;
			end if; 
		
	end if; 

end architecture rtl; 
	