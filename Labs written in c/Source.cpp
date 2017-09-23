/*Write a program that asks user “how many positive numbers that are devisable by 6 you want to add?”. Your loop
counter would be the user input(how many numbers they want to add). If the user enters a positive number between 1 and 100 that is devisable by 6,
you increment your loop counter and add it to the sum. You need to decide if the positive number entered by the
user is divisible by 6 or not. Your program should print an error message if the number is not within the range and
ask user for another number*/
#include <iostream>
int main()
{
	int sum = 0;						//numbers that pass conditions will be added to sum
	int numberOfNumbers = 0;			//how many numbers does the user want to check conditions of/sum
	int temp = 0;						//temporary counter
	int numberToBeSummed = 0;			//numbers to be checked and added

	std::cout << "How many positive numbers that are divisible by 6 do you want to add? ";
	std::cin >> numberOfNumbers; 

	int n = 0; //counter

	for (; n < numberOfNumbers; n+=temp)							//increment n until n >= numberOfNumbers
	{
		std::cout << "Enter a number: " << std::endl;							//enter numbers to be summed
		std::cin >> numberToBeSummed;									//numbers to be summed

		temp = 0;														//resetting temp every pass through the loop
			if (numberToBeSummed >= 1 && numberToBeSummed <= 100)		//checking if numberToBeSummed is between 1 and 100 go through the loop
			{
			
				if (numberToBeSummed % 6 == 0)							//if numberToBeSummer is divisible by 6 go through the loop
				{
					temp = 1;												//increments when conditions pass, so we can add one to n in the for loop
					sum = numberToBeSummed + sum;						//adds numberToBeSummed to sum everytime conditions pass, sum doesnt get reset every pass, it stores the values it recieves
				}
				else {
					std::cout << "Error not divisible by 6" << std::endl;			//if error prints jump out and go to begining of loop
				}
			}
			else {
				std::cout << "Error number not in range" << std::endl;			//if error prints jump out and go to begining of loop
			}
	}
	std::cout << "Sum is: " << sum << std::endl;
	return 0;
}