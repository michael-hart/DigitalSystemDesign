LIBRARY IEEE;

USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
-- atan_table generated using atan_pkg.py
USE WORK.atan_pkg.ALL;

ENTITY cordic IS
	PORT(
		clk, start, reset : std_logic;
		done : OUT std_logic;
		angle : IN std_logic_vector(31 DOWNTO 0);
		cos : OUT std_logic_vector(31 DOWNTO 0)
	);
END ENTITY cordic;

ARCHITECTURE synth OF cordic IS
	SIGNAL done_i : std_logic;
	SIGNAL cos_i : std_logic_vector(31 DOWNTO 0);
	CONSTANT INIT_X : std_logic_vector(31 DOWNTO 0) := X"26dd3b6a"; -- see useful.py
	SIGNAL X, Y, Z : std_logic_vector(31 DOWNTO 0);
	SIGNAL count : std_logic_vector(5 DOWNTO 0);
	SIGNAL started, sign_z : std_logic;
BEGIN

	-- Assign signals to outputs
	done <= done_i;
	cos <= cos_i;

	-- Assign sign_z to to top bit of Z
	sign_z <= Z(31);

	P1 : PROCESS IS
	BEGIN
		WAIT UNTIL rising_edge(clk);

		-- Default value
		done_i <= '0';
		cos_i <= (OTHERS => '0');

		IF start = '1' AND started = '0' THEN
			count <= "000000";
			started <= '1';
			Z <= angle;
			X <= INIT_X;
			Y <= (OTHERS => '0');
		END IF; -- start

		IF started = '1' THEN 
			
			CASE sign_z IS
				WHEN '0' => 
					X <= std_logic_vector(signed(X) - SHIFT_RIGHT(signed(Y), to_integer(unsigned(count))));
					Y <= std_logic_vector(signed(Y) + SHIFT_RIGHT(signed(X), to_integer(unsigned(count))));
					Z <= std_logic_vector(signed(Z) - signed(atan_table(to_integer(unsigned(count)))));
				WHEN '1' => 
					X <= std_logic_vector(signed(X) + SHIFT_RIGHT(signed(Y), to_integer(unsigned(count))));
					Y <= std_logic_vector(signed(Y) - SHIFT_RIGHT(signed(X), to_integer(unsigned(count))));
					Z <= std_logic_vector(signed(Z) + signed(atan_table(to_integer(unsigned(count)))));
				WHEN OTHERS => NULL;
			END CASE; --sign_z

			-- Add one to count
			count <= std_logic_vector(unsigned(count) + 1);

			IF count = "011111" THEN
				done_i <= '1';
				cos_i <= X;
				started <= '0';
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