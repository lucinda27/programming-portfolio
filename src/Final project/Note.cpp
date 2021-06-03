#include <iostream>
#include <string>
#include "Note.h"
using namespace std;

Note :: Note() {
}

string Note :: setLoc(string ob) {
  object=ob;
  return object;
}

string Note :: writeNote(string m) {
  message=m;
  return message;
}
