#include <fstream>
#include <iostream>
#include <cstdlib> 
using namespace std;
 
int main () {

  ofstream out;
  int num;
  num=10;
  srand(time(0));
  string answers [10];
  string questions [10];
  out.open("useranswers.txt");

  cout << "Welcome to this application. Please answer the following question." << endl;
  questions[0]="Do you prefer distance learning or in-person school?" "\n" "Describe your preference.";
  questions[1]="How has the pandemic affected your grades?";
  questions[2]="How do you feel about how the pandemic has been handled?";
  questions[3]="How do you feel about how school/teachers have handled teaching online?";
  questions[4]="How has the pandemic affected your life overall?";
  questions[5]="What is your favorite class?" "\n" "Describe why.";
  questions[6]="Who is your favorite teacher?" "\n" "Describe why.";
  questions[7]="How has this school year differed most significantly from past years for you?";
  questions[8]="Has school improved during the pandemic?" "\n" "Describe why or why not.";
  questions[9]="Has school gotten worse over the pandemic?" "\n" "Describe why or why not.";
  cout << questions[rand()%num] << endl;
  getline(cin, answers[0]);

  out << "User responses: " << answers [0];

  out.close();

   return 0;
}