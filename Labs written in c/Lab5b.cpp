/*Write a program that prompt the user to input n numbers(0<n<11) and stores them in an
array.Then it finds the median of the array, assuming the elements are in ascending order.*/
#include <iostream>

int main()
{
	int size;							//size of the array
	int median;							//median = middle didgit OR middle 2 digits added then / 2 						
	int middle;

	std::cout << "Enter how many elements you want in the array: ";		//user input for size of array
	std::cin >> size;
	

	//Error handlers========================================================================
	while (size > 10) {
		std::cout << "Error cannot be larger than 10\n";
		std::cout << "Enter how many elements you want in the array: ";
		std::cin >> size;
	}
	while (size < 1) {
		std::cout << "Error cannot be smaller than 1\n";
		std::cout << "Enter how many elements you want in the array: ";
		std::cin >> size;
	}
	//=======================================================================================

	//checks for errors then stores into array if no errors found
	int *array = new int[size];			//declares pointer (*array) to dynamic array of type int and size [size]
							//created an int array of 'size' elements, new operator creates the pointer, returns an address

							//recieve ints to fill array
	for (int n = 0; n < size; n++)			//while n is less than 5(size of array), n++
	{
		std::cout << "Enter a number to add to the array: ";
		std::cin >> array[n];			//get number and fill array starting position 0

	}

	//to determine if theres a remainder or not, if theres a remainder its odd, if no remainder its even
	middle = size / 2;

	//even condition
	if (size % 2 == 0)
	{
		std::cout << "Even\n";
		median = (array[middle] + array[middle - 1]) / 2;
		std::cout << "the median is " << median << "\n";
	}

	//odd condition
	else
	{
		std::cout << "Odd\n";
		//find middle integer, store into median
		median = array[middle];
		std::cout << "The median is: " << median << std::endl;
	}

	delete[] array;					//deaccocate memory to release this memory once the program is over
	return 0;
}
