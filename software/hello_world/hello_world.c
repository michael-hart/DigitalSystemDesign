/*
 * Modified "Hello, world" template for Nios II, intended to compute a mathematical function on a vector.
 *
 * Produces a vector based on defined constants and performs custom code on that vector.
 * Also times the custom code and outputs to stdout.
 *
 */

#include <stdlib.h>
#include <sys/alt_stdio.h>
#include <sys/alt_alarm.h>
#include <sys/times.h>
#include <alt_types.h>
#include <system.h>
#include <unistd.h>

// Comment and uncomment to perform each test case; ensure to recompile each time

// Test case 1
#define step 5
#define N 52

// Test case 2
//#define step 0.1
//#define N 2551

//Test case 3
//#define step 0.001
//#define N 255001

// Generates the vector x and stores it in memory
void generateVector(float x[N])
{
	int i;
	x[0] = 0;
	for (i=1; i<N; i++)
	{
		x[i] = x[i-1] + step;
	}
}

// Sums along the vector, with each element x -> x + x^2
float sumVector(float x[], int M)
{
	float y=0, current;
	int i;
	for (i=0; i<M; i++)
	{
		current = x[i];
		y += current + current*current;
	}
	return y;
}

int main()
{
	// Modify this line for each task in turn
	alt_putstr("Task 1!\n");

	// Define input vector
	float x[N];

	// Returned result
	float y;

	generateVector(x);

	// The following is used for timing
	char buf[20];
	clock_t exec_t1, exec_t2;

	exec_t1 = times(NULL); // get system time before starting the process

// The code that you want to time goes here
	y = sumVector(x, N);

	// till here
	exec_t2 = times(NULL); // get system time after finishing the process

	gcvt((exec_t2 - exec_t1), 10, buf);

	alt_putstr(" proc time = "); alt_putstr(buf); alt_putstr(" ticks \n");
	// printf could be used if there was enough memory

	int i;
	for (i=0; i<10; i++)
	{
		y = y/2.0;
	}

	gcvt(((int) y), 10, buf);
	alt_putstr(" Result (divided by 1014) = "); alt_putstr(buf);
	// printf could be used if there was enough memory

	return 0;
}
