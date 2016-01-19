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

// Test case 1
//#define step 5
//#define N 52

// Test case 2
#define step 0.1
#define N 2551

//Test case 3
//#define step 0.001
//#define N 255001


// Generates the vector x and stores it in memory
void generateVector(float x[N])
{
	int i;
	x[0] = 0;
	for (i=0; i<N; i++)
	{
		x[i] = x[i-1] + step;
	}
}

float sumVector(float x[], int M)
{
	// YOUR CODE GOES HERE
}

int main()
{
	printf("Task 2!\n");

	// Define input vector
	float x[N];

	// Returned result
	float y;

	generateVector(x);

	// The following is used for timing
	char buf[50];
	clock_t exec_t1, exec_t2;

	exec_t1 = times(NULL); // get system time before starting the process

// The code that you want to time goes here
	y = sumVector(x, N);

	// till here
	exec_t2 = times(NULL); // get system time after finishing the process

	gcvt((exec_t2 - exec_t1), 10, buf);
}
