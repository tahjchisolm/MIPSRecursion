// Creating
#include <iostream>
#include <fstream>

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
	
	// Memory Benchmark
	// create array
	int arr[4][1000000000];
	for (int j = 0; j < 5; j++)
		for (int k = 0; k < 1000000000; k++)
			arr[j][k] = 20000000;
	
	// read array
	int = n;
	for (int j = 0; j < 5; j++)
		for (int k = 0; k < 1000000000; k++)
			n = arr[j][k];

	// Hard drive Benchmark
	// writing into file
	w = 20000000
	ofstream myfile;
	myfile.open ("example.txt");
	for (int i = 0; i < 250000000; i++)
		myfile << w;
	myfile.close();

	// read file
	string line;
	ifstream myfile ("example.txt");
	if (myfile.is_open())
	{
		while ( getline (myfile,line) )
	{
		// reading
	}
	myfile.close();
	}

	cout << "program has finished";
	

}