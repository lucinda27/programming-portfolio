#ifndef Cipher_H
#define Cipher_H
#include <string>
using namespace std;

class Cipher
{
      private:
      int count1=0;
      int count2=0;
      int l;
      int length;

      public:
      Cipher();
      void encipher(string keyword, string plaintext);
      void decipher(string keyword, string plaintext);

};
#endif
