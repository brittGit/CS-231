/*Write a program that asks the user to enter the number of integers that 
needs to be added together. Then you use the loop to get the integers check to see if they are even and add them together, ONLY ADDING EVEN NUMBERS.
Finally your program should output the sum on the screen.*/
#include <iostream>
int main()
{
	int userInput;
	int sum = 0;

	std::cout << "Enter how many integers you want to add" << std::endl;
	std::cin >> userInput;		//stores unput into UserInput


	int n=0;
	for (n; n < userInput; n++) //When n < userInput go into the loop. When n is = to the userInput it breaks out of the loop. n++ happends at the end of the loop. 
	{ 
		int secondInput;
		std::cout << "Enter a number to be added ";
		std::cin >> secondInput; //keeps getting more ints from the user
		
		if (secondInput % 2 == 0)
		{
			sum = secondInput + sum;
		}
	}

	std::cout << "Sum of the even numbers is: " << sum << std::endl;

	return 0;
}



