#include <iostream>
#include <string>
using namespace std;

int main()
{
  cout << "Welcome to this mad libs application."  "\n" "Enter different types of words as you are prompted and then enjoy the result!" "\n" "Unless you are prompted for a plural word, keep your entries singular."<< endl;

  string roomType[2];
  string adverb[2];
  string adj[3];
  string exclamation[1];
  string clothType [1];
  string objectS[1];
  string objectPl[2];
  string mythCreature[1];
  string mythCreatures[1];
  string famPers[1];
  string ex1;
  string ex2;

  cout << "Enter two types of rooms on two separate lines. " "\n";
    for (int i=0; i<2; i++) {
      getline(cin, roomType [i]);
  }
  cout << "Enter two adverbs on two separate lines. " "\n";
    for (int i=0; i<2; i++) {
      getline(cin, adverb [i]);
  }
  cout << "Enter three adjectives on three separate lines. " "\n";
    for (int i=0; i<3; i++) {
      getline(cin, adj [i]);
  }
  cout << "Enter an exclamation. " "\n";
  getline(cin, exclamation [0]);
  cout << "Enter a type of clothing. " "\n";
  getline(cin, clothType [0]);
  cout << "Enter an object. " "\n";
  getline(cin, objectS [0]);
  cout << "Enter two plural objects on two separate lines. " "\n";  
    for (int i=0; i<2; i++) {
      getline(cin, objectPl [i]);
  }
  cout << "Enter a mythological creature. " "\n";
  getline(cin, mythCreature [0]);
  cout << "Enter a mythological creature in plural form. " "\n";
  getline(cin, mythCreatures [0]);
  cout << "Enter the name of a famous/historical person. " "\n";
  getline(cin, famPers [0]);
  

 ex1 = exclamation [0].substr (0, 1);
   int l;
   l = ex1.size();
 ex2 = exclamation [0].substr (1);

  cout << "\n" "You walk into the dimly lit " << roomType [0] << "\n" "and "<< adverb [0] << " start to look for a light," "\n" "when suddenly" "\n" "you are startled by a " << adj [0] << " person." "\n";
  for (int i=0; i<l; i++)
        putchar(toupper(ex1[i])); 
  cout << ex2 << "!" "\n" "They don't respond to your efforts at communicating" "\n" "and you realize that they are actually a "<< adj [0] << " "<< clothType [0] << " hanging from a hook." "\n"
  "You continue into the room " << adverb [1]<< "," "\n" "without light," "\n" "tripping over " << objectPl [0] << " on the floor." "\n" "You start to get your bearings" "\n" "(and your eyes start to adjust to the light)" "\n" "which allows you to notice that "<< adj [1] << " " << objectPl [1] << " line the walls." "\n" "As you immediately try to flee," "\n" "a " << mythCreature [0] << " emerges from the " << clothType [0] << " and blocks the door!" "\n" "The only solution is to continue searching for what you came for:" "\n" "the " << objectS [0] << "!" "\n" "Pushing past the " << objectPl [0] << "\n" "and trying to ignore the " << objectPl [1] << " and " << mythCreature [0] << "," "\n" "you find a small door," "\n" "hidden by a painting of " << famPers [0] << "." "\n" "You tear apart the painting in disgust and open the door." "\n" "The door reveals a " << roomType [1] << " full of " << mythCreatures [0] << "," "\n" "but, luckily," "\n" "the " << objectS [0] << " is here!" "\n" "You manage to reach it and are at last "<< adj [2] << "." << endl;

 return 0;
}