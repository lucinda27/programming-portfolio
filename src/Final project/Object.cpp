#include <iostream>
#include <string>
#include "Object.h"
using namespace std;

Object :: Object(string d) {
  description=d;
}

// if I was doing a more complicated text based adventure game, this class would probably be more useful but using it here does show how that would work
string Object :: setDescription() {
  return description;
}
