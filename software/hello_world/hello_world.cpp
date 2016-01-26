/*
 * Modified "Hello, world" template for Nios II, intended to compute a mathematical function on a vector.
 *
 * Produces a vector based on defined constants and performs custom code on that vector.
 * Also times the custom code and outputs to stdout.
 *
 */

#include <ctime>
#include <iostream>

// Comment and uncomment to perform each test case; ensure to recompile each time

// Test case 1
#define TASK 1
#define step 5
#define N 52

// Test case 2
//#define TASK 2
//#define step 0.1
//#define N 2551

//Test case 3
//#define TASK 3
//#define step 0.001
//#define N 255001

void generateVector(float x[N]);
float sumVector(float x[], int M);

using namespace std;

int main(int argc, char **argv)
{
	// Define input vector
	float x[N];

	// Returned result
	float y;

	// The following is used for timing
	clock_t exec_t1, exec_t2;

	// Modify this line for each task in turn
	cout << "Task " << TASK << endl;

	generateVector(x);

	cout << "Vector generated" << endl;

	exec_t1 = clock(); // get system time before starting the process

	// The code that you want to time goes here
	y = sumVector(x, N);

	// till here
	exec_t2 = clock(); // get system time after finishing the process

	// Print output to stdout
	cout << fixed; // Set output to fixed decimal place
	cout << "Procedure time = " << exec_t2 - exec_t1 << " ticks" << endl;
	cout << "Result = " << y << endl;

	return 0;
}

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
