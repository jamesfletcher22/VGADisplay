library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

	 
entity VerticalSync is 
	port (
	finish_flag : in std_logic;
	clk : in std_logic;
	vert_sync : out std_logic;
	vert_row : out integer
	);
	
end entity VerticalSync;
--Vertical sync needs to be held low for 96 cycles
--But, this is only triggered when 
architecture RTL of VerticalSync is 
-- signals here.
	signal finish_flag_assert : std_logic; 
	signal county : integer := 0;
	begin 
	
	process(clk) is 
	begin 
	if rising_edge(clk) then
		if finish_flag = '1' then
--Count only when we hit a new line. Count this once
			county <= county + 1;
		end if;
		if county > 491 and county < 494  then 
			vert_sync <= '0';
		else 
			vert_sync <= '1';
		if county = 525 then 
			county <= 0;
			end if;
		end if; 
		end if;
		
	vert_row <= county;
	end process; 
		
end architecture RTL;
			
			
	