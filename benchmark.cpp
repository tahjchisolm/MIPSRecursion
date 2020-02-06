#include <iostream>
#include <fstream>
#include <memory>
#include <chrono>

using namespace std;

class Timer
{
public:
	Timer()
	{
		m_StartTimepoint = chrono::high_resolution_clock::now();
	}
	
	~Timer()
	{
		Stop();
	}

	void Stop()
	{
		auto endTimepoint = chrono::high_resolution_clock::now();

		auto start = chrono:: time_point_cast < chrono::microseconds > (m_StartTimepoint).time_since_epoch().count();
		auto end = chrono:: time_point_cast < chrono::microseconds > (endTimepoint).time_since_epoch().count();

		auto duration = end - start;
		double ms = duration * 0.001;

		cout << duration << "us (" << ms << "ms)\n";
	}
private: 
	chrono::time_point< chrono::high_resolution_clock> m_StartTimepoint;
};

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

	float z = 2;
	for (int i = 0; i < 1000000000; i++)
		z /= 2;
	
	// Memory Benchmark
	// create array
	int arr[4][1000000000];
	for (int j = 0; j < 5; j++)
		for (int k = 0; k < 1000000000; k++)
			arr[j][k] = 20000000;
	
	// read array
	int n;
	for (int j = 0; j < 5; j++)
		for (int k = 0; k < 1000000000; k++)
			n = arr[j][k];

	// Hard drive Benchmark
	// writing into file
	int w = 20000000;
	ofstream myfile;
	myfile.open ("example.txt");
	for (int i = 0; i < 250000000; i++)
		myfile << w;
	myfile.close();

	// read file
	string line;
	ifstream myfile2 ("example.txt");
	if (myfile2.is_open())
	{
		while ( getline(myfile2,line) )
	{
		// reading
	}
	myfile2.close();
	}

	cout << "program has finished" << endl;

	return 0;
	

}