library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

--Code to generate the Horizontal sync signal for VGA.
--Horizontal sync goes low after 660 cycles, and goes low for 96 cycles. then goes back to high until 800 cycles.

--VHDL means everything doesn't need to be in 1 function that calls others.
--Can run multiple funcs in parallel 
--so idea is to have a clock counter. when hits 660, then we go low on hoirz_sync. 
--Horiz sync needs to go low for 96 cycles after that, and then brought high again.

entity HorizontalSync is 
port (
	clk : in std_logic;
	horiz_sync : out std_logic := '1';
	finish_flag : out std_logic;
	horiz_column : out integer
	);

	end entity HorizontalSync;
	
architecture rtl of HorizontalSync is 
	--signals here etc
	signal count : integer := 0; 
	begin
 	process (clk) is 
		begin
		if rising_edge(clk) then 
		--synchronous reset. Might need asynch too?
		count <= count + 1;
		if count > 656 and count < 753 then 
			horiz_sync <= '0';
			else 
			horiz_sync <= '1'; 
			end if; 
		if count = 800 then 
			finish_flag <= '1';
			count <= 0;
			else 
			finish_flag <= '0';
			end if; 

			end if; 
		horiz_column <= count;
end process; 


	
			
end architecture rtl; 