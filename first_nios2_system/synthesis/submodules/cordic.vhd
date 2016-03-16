LIBRARY IEEE;
LIBRARY IEEE_proposed;
LIBRARY CORDIC;

USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE IEEE_proposed.fixed_pkg.ALL;
-- atan_table generated using atan_pkg.py
USE CORDIC.atan_pkg.ALL;

ENTITY cordic IS
	PORT(
		clk, start, reset : std_logic;
		done : OUT std_logic;
		angle : IN sfixed(1 DOWNTO -22);
		cos : OUT sfixed(1 DOWNTO -22)
	);
END ENTITY cordic;

ARCHITECTURE synth OF cordic IS
	SIGNAL done_i : std_logic;
	SIGNAL cos_i : sfixed(1 DOWNTO -22);
	CONSTANT INIT_X : sfixed(1 DOWNTO -22) := X"26dd3b"; -- see useful.py
	SIGNAL X, Y, Z : sfixed(1 DOWNTO -22);
	SIGNAL count : INTEGER;
	SIGNAL started : std_logic;
BEGIN

	-- Assign signals to outputs
	done <= done_i;
	cos <= cos_i;

	P1 : PROCESS IS
		VARIABLE x_shifted, y_shifted : sfixed(1 DOWNTO -22);
	BEGIN
		WAIT UNTIL rising_edge(clk);

		-- Default value
		done_i <= '0';
		cos_i <= (OTHERS => '0');

		IF start = '1' AND started = '0' THEN
			count <= 0;
			started <= '1';
			Z <= angle;
			X <= INIT_X;
			Y <= (OTHERS => '0');
		END IF; -- start

		IF started = '1' THEN 
			
			IF count = 24 THEN
				done_i <= '1';
				cos_i <= X;
				started <= '0';
			ELSE
				x_shifted := sfixed(SHIFT_RIGHT(signed(X), count));
				y_shifted := sfixed(SHIFT_RIGHT(signed(Y), count));
				CASE Z(1) IS
					WHEN '0' => 
						X <= resize(X - y_shifted, 1, -22);
						Y <= resize(Y + x_shifted, 1, -22);
						Z <= resize(Z - atan_table(count), 1, -22);
					WHEN '1' => 
						X <= resize(X + y_shifted, 1, -22);
						Y <= resize(Y - x_shifted, 1, -22);
						Z <= resize(Z + atan_table(count), 1, -22);
					WHEN OTHERS => NULL;
				END CASE; --sign_z

				-- Add one to count
				count <= count + 1;

			END IF; -- count

		END IF; --started

		-- Check for reset 
		IF reset = '1' THEN
			started <= '0';
			Z <= (OTHERS => '0');
			X <= (OTHERS => '0');
			Y <= (OTHERS => '0');
		END IF; --reset
	END PROCESS P1;

END ARCHITECTURE synth;