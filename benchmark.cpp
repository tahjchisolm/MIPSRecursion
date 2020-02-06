// Creating
#include <iostream>

using namespace std;


int main()
{
	// Int Benchmarks
	int a = 0; 
	for (int i = 0; i < 10000000000; i++)
		a += 2;

	int b = 2;
	for (int i = 0; i < 1000000000; i++)
		b *= 2;

	int c = 2;
	for (int i = 0; i < 1000000000; i++)
		c /= 2;

	// Float Benchmarks
	float x = 0; 
	for (int i = 0; i < 10000000000; i++)
		x += 2;

	float y = 2;
	for (int i = 0; i < 1000000000; i++)
		y *= 2;

	float y = 2;
	for (int i = 0; i < 1000000000; i++)
		y /= 2;
	


}