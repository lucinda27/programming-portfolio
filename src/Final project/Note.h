#ifndef Note_H
#define Note_H
#include <string>
using namespace std;

class Note
{
      private:
      string message;
      string object;

      public:
      Note();
      string setLoc(string ob);
      string writeNote(string m);
      

};
#endif
