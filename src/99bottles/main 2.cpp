#include <iostream>
using namespace std;
 
int main () {
   // Local variable declaration:
   int a = 99;

   // while loop execution
   while( a > 1 ) {
      cout << a << " bottles of milk on the wall, " << a << " bottles of milk" <<"\n Take one down, pass it around, " <<a-1<< " bottles of milk on the wall" <<endl;
      a--;
   }

   while( a > 0 ) {
      cout << a << " bottle of milk on the wall, " << a << " bottle of milk" <<"\n Take one down, pass it around, " <<a-1<< " bottles of milk on the wall" <<endl;
      a--;
   }
 
   return 0;
}
