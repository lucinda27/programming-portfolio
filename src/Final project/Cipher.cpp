#include <iostream>
#include <string>
#include "Cipher.h"
using namespace std;

Cipher :: Cipher(){}


void Cipher :: encipher(string keyword, string plaintext) {
  count1=0;
  count2=0;
// keyword
  for (int i = 0; i < keyword.size(); i++) {
      if (keyword[i] != ' ' && keyword[i] != '?' && keyword[i] != '!' && keyword[i] != '.' && keyword[i] != ',' && keyword[i] != '\'') {
        keyword[count2++] = keyword[i];
      }      
    }
  keyword.resize(count2);
  l = keyword.size();
  for (int i=0; i<l; i++) {
    keyword[i] = tolower(keyword[i]);
  }
  char let [l];
  for (int i=0; i<l; i++) {
    let[i]= keyword.at (i);
  }

  // plaintext
  for (int i = 0; i < plaintext.size(); i++) {
      if (plaintext[i] != ' ' && plaintext[i] != '?' && plaintext[i] != '!' && plaintext[i] != '.' && plaintext[i] != ',' && plaintext[i] != '\'') {
        plaintext[count1++] = plaintext[i];
      }      
    }
  plaintext.resize(count1);
  length = plaintext.size();
  for (int i=0; i<length; i++) {
    plaintext[i] = tolower(plaintext[i]);
  }
  char letter [length];
  for (int i=0; i<length; i++) {
    letter[i]= plaintext.at (i);
  }
  int test [length];
  char test2 [length];

  for (int i=0; i<length; i++) {
    int a = (int) letter [i] -97;
    int b = (int) let [i%l] -97;
    test [i] = (a + b)%26;
    test2 [i] = (char) (test [i] + 97);
    cout << test2 [i];
  }
}

void Cipher :: decipher(string keyword, string plaintext) {
  count1=0;
  count2=0;
// keyword
  for (int i = 0; i < keyword.size(); i++) {
      if (keyword[i] != ' ' && keyword[i] != '?' && keyword[i] != '!' && keyword[i] != '.' && keyword[i] != ',' && keyword[i] != '\'') {
        keyword[count2++] = keyword[i];
      }      
    }
  keyword.resize(count2);
  l = keyword.size();
  for (int i=0; i<l; i++) {
    keyword[i] = tolower(keyword[i]);
  }
  char let [l];
  for (int i=0; i<l; i++) {
    let[i]= keyword.at (i);
  }

  // plaintext
  for (int i = 0; i < plaintext.size(); i++) {
      if (plaintext[i] != ' ' && plaintext[i] != '?' && plaintext[i] != '!' && plaintext[i] != '.' && plaintext[i] != ',' && plaintext[i] != '\'') {
        plaintext[count1++] = plaintext[i];
      }      
    }
  plaintext.resize(count1);
  length = plaintext.size();
  for (int i=0; i<length; i++) {
    plaintext[i] = tolower(plaintext[i]);
  }
  char letter [length];
  for (int i=0; i<length; i++) {
    letter[i]= plaintext.at (i);
  }
  int test [length];
  char test2 [length];

  for (int i=0; i<length; i++) {
    int a = (int) letter [i] -97;
    int b = (int) let [i%l] -97;
    test [i] = (a - b)%26;
    if (test [i] < 0) {
      test [i] = test [i] + 26;
    }
    test2 [i] = (char) (test [i] + 97);
    cout << test2 [i];
  }
}
