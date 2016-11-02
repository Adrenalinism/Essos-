LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY proj2solution IS
	PORT(
				clk_50: IN STD_LOGIC;
				SW    : IN  STD_LOGIC_VECTOR (17 downto 0);
				--nsr, nsy, nsg, ewr, ewy, ewg : OUT STD_LOGIC;
				LEDR : out std_LOGIC_VECTOR (17 downto 0);
				LEDG : out std_LOGIC_VECTOR (7 downto 0));
END proj2solution;

ARCHITECTURE a OF proj2solution IS

COMPONENT counter_proj_v2
	PORT(
				clk_50, reset : IN STD_LOGIC;
				q : OUT INTEGER RANGE 0 TO 5);
	END COMPONENT;
	
TYPE STATES IS (s0, s1, s2, s3);
SIGNAL sequence : STATES;
SIGNAL lights : STD_LOGIC_VECTOR (5 downto 0);
SIGNAL timer : INTEGER RANGE 0 to 5;

BEGIN

	light_timer: counter_proj_v2
	PORT MAP ( 	clk_50 => clk_50,
					reset => SW(0),
					q => timer);

PROCESS (clk_50, SW(0))
BEGIN
	IF (SW(0) = '1') THEN
		sequence <= s0;
		lights <= "011110"; -- nsr = ON and ewg = ON
		
	ELSIF (rising_edge(clk_50)) THEN
		CASE sequence IS
			WHEN s0 => IF timer < 4 THEN
			sequence <= s0;
			lights <= "011110"; -- nsr = ON and ewg = ON
		ELSE
			sequence <= s1;
			lights <= "011101"; -- nsr = ON and ewy = ON
		END IF;
		
		WHEN s1 => sequence <= s2;
			lights <= "110011"; -- nsg = ON and ewr = ON
		
		WHEN s2 => IF timer < 4 THEN
			sequence <= s2;
			lights <= "110011"; -- nsr = ON and ewg = ON
		ELSE
			sequence <= s3;
			lights <= "101011"; -- nsy = ON and ewr = ON
		END IF;
		
		WHEN s3 => sequence <= s0;
			lights <= "100001"; -- nsy = ON and nsg = ON and ewr = ON and ewy = ON
			
		WHEN others => sequence <= s0;
			lights <= "011110"; -- nsr = ON and ewg = ON

	END CASE;
	END IF;
END PROCESS;

LEDR(17) <= lights(5);
LEDR(0) <= lights(4);
LEDG(0) <= lights(3);
LEDR(16) <= lights(2);
LEDR(1) <= lights(1);
LEDG(7) <= lights(0);

END a;