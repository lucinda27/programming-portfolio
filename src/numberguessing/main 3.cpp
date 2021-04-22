#include <cstdlib>
#include <ctime>
#include <iostream>

using namespace std;

int main() {
int a;
a=1;
if (a==1) {
  for (int a = 1; a > 0; a++) {
   // determines the x number
    srand((unsigned) time(0));
    int x;
    int g;
    g=0;
    for (int index = 0; index < 1; index++) {
    x = (rand() % 100);
  }
   // takes in the user's guess
    int guess;
    cout << "Guess a number between 1 and 100:";
    cin >> guess;
    g++;
  
    //responds to the user's guess
   while (guess != x) {
     if (guess>x) {
      cout << "Your guess was too big. Guess again!"<< endl;
      cout << "Guess a number between 1 and 100:";
      cin >> guess;
      g++;
     }
     if (guess<x) {
      cout << "Your guess was too small. Guess again!"<< endl;
      cout << "Guess a number between 1 and 100:";
      cin >> guess;
      g++;
     }
   }
   while (guess == x && guess>0) {
     if (g>1) {
      cout << "You guessed correctly! It took you " << g << " guesses." << endl;
     } else {
       cout << "You guessed correctly! It took you " << g << " guess." << endl;
     }
     
     cout << "Do you want to play again? Type '1' to guess another number! \n If you're done playing, type 0." << endl;
     cin >> a;
     guess=0;
     if (a==0) {
       cout << "Good bye!" << endl;
       a=-1;
     }
   }
  }
}
}