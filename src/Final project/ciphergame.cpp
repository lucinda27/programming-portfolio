#include <iostream>
#include <string>
#include "Cipher.h"
#include "Object.h"
#include "Note.h"
using namespace std;

int main() {
string observe;
string keyword;
string examine;
string obj;
string o;
int length;
int j=0;
bool notebook=false;
bool balcony=false;
bool closet=false;
bool change=false;
bool end=false;

//classes 
Cipher cipher;
Object room("On the northern wall of the room, there's a mounted TV and three paintings which face a bed and an armchair. In the northeastern corner, there is a small closet and a mini fridge, and in the southeastern corner, there's the bathroom. There are windows facing west with a balcony, but you haven't looked to see if there's a nice view yet.");
Object bed("It's a queen size bed and it's been pretty comfortable as you've lain on it all morning. To the right, there is a little bureau with a lamp on it.");
Object bureau("You open the top drawer, expecting to find a bible. Instead, there's a different book, a notepad, and a pen. In the second drawer, there's a spiral notebook, covered in stickers.");
Object lamp("It takes you a little bit to find the button to turn it on but eventually you find it.");
Object drawer1("Inside, there's a book, a notepad, and a pen.");
Object drawer2("Inside, there's a spiral notebook, covered in stickers.");
Object notepad("It has plenty of blank, multicolored sticky notes.");
Object pen("It's a black ballpoint pen.");
Object book("It's 'How to train a dragon', your favorite childhood book. You'd be excited to read it if you didn't know it so well that you could probably already recite lines from it by memory. [insert quote]. You thumb through it anyway, impressed with the hotel's excellent taste in books. However, one detail catches your eye. There seems to be a sticky note attached to one of the pages.");
Object theNote("The note reads: aguqvj qsjhye keddmj ahegcg mjvwhf ghmhvv jycega vselun ncaxmf mqcpxl gzvslp osjwmf mwcppg gywglo qvwesj kuigwd ayvlbk usfwww fivrij zogknj kwtgcb uuprvg nwuwmq oijwzz wz.");
Object page1("You ignore the stickers on the cover, most of which are too faded to make out anyways. You open the notebook to the first page, which reads: DON'T READ THE REST OF THIS NOTEBOOK UNLESS YOU ARE ON THE BALCONY.");
Object blankPage("This page is blank.");
Object page2("It reads: As my SUCCESSOR of the room, I have provided for you notes from myself and the previous ghosts. They may help explain what's going on or simply serve as distraction. To keep them safe from other more malevolant ghosts, however, they have been enciphered using a form of the Alberti cipher.\n The rest of this notebook entry contains a description on how to decipher any messages you may receive. To do this, you need a keyword. If the keyword was whale, you would enter it in like so (keyword: whale) and on the next line enter your cipher text (the text you want deciphered). \n At the bottom of the page, a second little note reads: P.S. In case my usage of all caps didn't make it clear, 'successor' is one of the keywords you'll need. Also, if you're interested, there are also a few more entries in this notebook that you may read through. Example: examine first page.");
Object page3("You turn to the third page, which is enciphered. It reads: ghgqjl zsdglg fvseok awijsk lgysmn gjleci tcfoik koxwmc npgnsi lbgtsg ewdfiv uyjwwu jyeqqe wbuand wxaxmf mlgkrl wfvkng fxzwyv qqqtha kkrjhk pk. \n The message continues in a second paragraph: hmkrvg tosdsy qrldsr nycpce gfvfiv gwavcl tnkvwz wzgahi crvxci lbcvme kcijsk fidapv juvghg nsilyn nmfymf myxgvq lvzfac phfghy ahidyl ahyahm elgggz favjie arudye jsausn smvjio gfjlnj kryaqf mffjen wrffy.");
Object page4("This page reads: ghgosj whyahi kofgkz kukfmo sgughg dylabv wxvqxw dzpgov jmkgbt wsqwvw vcewfg cvfabx shfryl lweyih hxzwwe wpkvet dszlqk nptwhz eyvqaj ahvqiw tsofbf lyucrv tstggg vlwfso lajqwl qcluup wwwlvv hypkrl zskgjf teowfr fxytml wkywlg xijsbu ziygzw jaluba qyosbk ghegcg mfvvip gipsaz fyvjiu dcjwnh cvwoscd\nmmgvlw ucdeup fajahv ghykxz ovrlyx gvgtxv unaqyo sbkliy tmlwmf mlogwk suvghv jifwbk wlaqyj cspoitf efvdcs cpvipl");
Object armchair("Above the chair, there's an old photo of the beach framed. You sit in the armchair, but decide that the bed was more comfortable.");
Object nWall("The TV is attached to it and surrounding the TV are three nondescript paintings.");
Object painting("The first painting is blue, the second is orange, and the third is green. You don't spend much time examining them.");
Object painting11("Vertical lines of different shades of blue cover this painting.");
Object painting12("Written vertically over the lines of blue is enciphered text. It reads: \nz            z            p\ne            e            h\nr            r            r\ng            g            g\np            p            n\nv            v            n\ny            y            r\nw            b            h\nr            o            d\nz            l            f\ni            a            j\nm            l            v\ne            v            g\nz            t            u\nd            p            p\na            h            h\nk            v            v\na            g            y\nm            m            i\ni            n            a\nk            x            j\nn            o            k\ne            o            f\ne            w            k\nq            g            u\na            p            m\n             r            t\n             r            n\n             e            k\n             v            s\n             z            k\n             a            f\n             o             ");
Object painting21("This painting consists of horizontal lines of various shades of orange.");
Object painting22("Hmm. Someone has written all over this painting. It reads: \nS H P J I F O X R F H O U Z D E I R\nS H P J M E K U O L O Z B A C H K U M E K");
Object painting31("The third painting stands out from the others slightly by depicting bubbles in various shades of green.");
Object painting32("In the corner of the painting, right over a big bubble, somebody has written a little paragraph.\nemjbbvxadrgbukxexvvatenxvbukhpvqbblaecfiqunaetzlgxolgqgunemrvguphzasnhkukqmnzdblgvbcemahagzervqigraajggbasicyjrnarvfwbtwnuvevrhfzaiyrubvfwzkshrgneka");
Object eWall("This is where you came in, through the hotel door.");
Object door("You attempt to open it, but it won't open. You check the locks, thinking you'd locked it earlier, but you can't seem to get it to unlock. Hmm.");
Object sWall("The bed and the armchair both have their backs against this wall. Above the armchair, an old photo of the beach is hung on the wall.");
Object photo("The beach is covered with umbrellas and crowds. A group of people have turned around and are smiling at the camera.");
Object photo1("Someone has drawn little goatees on their faces.");
Object wWall("The windows look out over the city and provide a tiny view of the ocean through this wall.");
Object tv("You'd turned it off earlier because none of the shows were very interesting. That hasn't changed.");
Object window("You can just barely see the sliver of blue that is the ocean beyond the parking lot and the sea of roofs.");
Object Balcony("It's pleasant outside, but the small metal chair and table on the balcony don't seem very comfortable.");
Object chair("You sit down and are immediately proven correct that it's an uncomfortable chair.");
Object table("It's a metal table.");
Object neCorner("There is a small closet and a mini fridge.");
Object Closet("The closet is mostly empty, with only wire hangers hanging.");
Object backwall("On the back wall you notice a message written in pencil.");
Object backwall2("You're a little concerned and a little curious about the message so you feel over the back of the closet. You find nothing and are somewhat disappointed.");
Object message("It reads: XEPBVQ ZDIJPT BYATZF VBTWRE VIBTHY URIGN.");
Object hanger("They don't have anything hanging on them currently and you probably won't hang up your clothes there anyway. Where even is your luggage anyway?");
Object fridge("You didn't expect to find anything in the fridge but inside is a water bottle and a few cans of lemonade.");
Object bottle("You take a few sips and then put it back in the fridge for later.");
Object lemonade("You take a few sips out of one of the cans and then put it back in the fridge for later.");
Object seCorner("The bathroom's in this corner.");
Object bathroom("Inside, there's a shower, a toilet, and a sink.");
Object shower("It has a sliding glass door and a few small shampoo bottles inside.");
Object gdoor("It's a glass door.");
Object shampoo("They don't have much shampoo in them.");
Object toilet("It's a toilet.");
Object sink("It's a sink.");

//initial print statement
cout << "In this game, your initial goal is to explore your hotel room. " <<  room.setDescription() << " After getting here early this morning, you've just lain on the bed, watching TV. That's become boring and since you don't have anything else to do today, you decide to look around your room. Use the word 'examine' with anything you want a better description of (ex: examine northern wall)." << endl;
getline (cin, observe);

length = observe.size();
examine = observe.substr(0,7);
keyword = observe.substr(0,8);
obj = observe.substr(8,length-7);

for (int i=0; i<1; i++) {
  if (keyword == "keyword:") {
  obj = observe.substr(9,length-9);
  string ct;
  cout << "Enter ciphertext." << endl;
  getline(cin, ct);
  if (ct=="XEPBVQ ZDIJPT BYATZF VBTWRE VIBTHY URIGN" || ct=="xepbvq zdijpt byatzf vbtwre vibthy urign" || ct=="xepbvqzdijptbyatzfvbtwrevibthyurign" ||ct=="XEPBVQZDIJPTBYATZFVBTWREVIBTHYURIGN") {
    if (obj=="warning") {
      closet=true;
    }
  }
  cipher.decipher(obj, ct);
  cout << "\n";
  i--;
}
if (keyword == "write on") {
  string key;
  string plaintext;
  o = observe.substr(9,length-9);
  cout << "Enter your keyword." << endl;
  getline(cin, key);
  cout << "Enter your plaintext." << endl;
  getline(cin, plaintext);
  Note n;
  n.setLoc(obj);
  n.writeNote(plaintext);
  change=true;
  if (o == "hotel room" || o == "room") {
    cipher.encipher(key, plaintext);
    i--;
  }
  else if (o == "bed") {
    cipher.encipher(key, plaintext);
    cout << "\n";
    i--;
  }
  else if (o == "bureau" || o == "little bureau") {
    cipher.encipher(key, plaintext);
    cout << "\n";
    i--;
  }
  else if (o == "lamp") {
    cipher.encipher(key, plaintext);
    cout << "\n";
    i--;
  }
  else if (obj == "top drawer" || obj == "first drawer") {
    cipher.encipher(key, plaintext);
    cout << "\n";
    i--;
  }
  else if (o == "bottom drawer" || o == "second drawer") {
    cipher.encipher(key, plaintext);
    cout << "\n";
    i--;
  }
  else if (o == "notepad") {
    cipher.encipher(key, plaintext);
    cout << "\n";
    i--;
  }
  else if (o == "pen") {
    cipher.encipher(key, plaintext);
    cout << "\n";
    i--;
  }
  else if (o == "book" || o == "different book") {
    cipher.encipher(key, plaintext);
    cout << "\n";
    i--;
  }
  else if (o == "note" || o == "sticky note") {
    cipher.encipher(key, plaintext);
    cout << "\n";
    i--;
  }
  else if (o == "spiral notebook" || o == "notebook" || o == "first page") {
    cipher.encipher(key, plaintext);
    cout << "\n";
    i--;
  }
  else if (o == "second page") {
    cipher.encipher(key, plaintext);
    cout << "\n";
    i--;
  }
  else if (o == "third page") {
    cipher.encipher(key, plaintext);
    cout << "\n";
    i--;
  }
  else if (o == "fourth page") {
    cipher.encipher(key, plaintext);
    cout << "\n";
    i--;
  }
  else if (o == "armchair") {
    cipher.encipher(key, plaintext);
    cout << "\n";
    i--;
  }
  else if (o == "northern wall" || obj == "north wall") {
    cipher.encipher(key, plaintext);
    cout << "\n";
    i--; 
  }
  else if (o == "paintings" || o == "nondescript paintings") {
    cipher.encipher(key, plaintext);
    cout << "\n";
    i--; 
  }
   else if (o == "first painting" || o == "painting number one" || o == "painting one") {
    cipher.encipher(key, plaintext);
    cout << "\n";
    i--;
  }
  else if (o == "second painting" || o == "painting number two" || o == "painting two") {
    cipher.encipher(key, plaintext);
    cout << "\n";
    i--;
  }
  else if (o == "third painting" || o == "painting number three" || o == "painting three") {
    cipher.encipher(key, plaintext);
    cout << "\n";
    i--;
  }
  else if (o == "eastern wall" || o == "east wall") {
    cipher.encipher(key, plaintext);
    cout << "\n";
    i--; 
  }
  else if (o == "hotel door") {
    cipher.encipher(key, plaintext);
    cout << "\n";
    i--;
  }
  else if (o == "southern wall" || o == "south wall") {
    cipher.encipher(key, plaintext);
    cout << "\n";
    i--; 
  }
  else if (o == "photo" || obj == "old photo" || o == "old photo of the beach" || o == "photo of the beach") {
    cipher.encipher(key, plaintext);
    cout << "\n";
    i--; 
  }
  else if (o == "western wall" || o == "west wall") {
    cipher.encipher(key, plaintext);
    cout << "\n";
    i--; 
  }
  else if (o == "TV" || o=="tv" || o=="television") {
    cipher.encipher(key, plaintext);
    cout << "\n";
    i--;
  }
  else if (o == "windows" || o == "windows facing west" || o == "western windows") {
    cipher.encipher(key, plaintext);
    cout << "\n";
    i--;
  }
  else if (o == "balcony") {
    cipher.encipher(key, plaintext);
    cout << "\n";
    i--;
  }
  else if (o == "metal chair" || o == "chair") {
    cipher.encipher(key, plaintext);
    cout << "\n";
    i--;
  }
  else if (o == "metal table" || o == "table") {
    cipher.encipher(key, plaintext);
    cout << "\n";
    i--;
  }
  else if (o == "northeastern corner") {
    cipher.encipher(key, plaintext);
    cout << "\n";
    i--;
  }
  else if (o == "closet") {
    cipher.encipher(key, plaintext);
    cout << "\n";
    i--;
  }
  else if (o == "back wall") {
    cipher.encipher(key, plaintext);
    cout << "\n";
    i--;
  }
  else if (o == "message") {
    cipher.encipher(key, plaintext);
    cout << "\n";
    i--;
  }
  else if (o == "hanger" || o == "wire hanger" || o == "hangers" || o == "wire hangers") {
    cipher.encipher(key, plaintext);
    cout << "\n";
    i--;
  }
  else if (o == "fridge" || o == "mini fridge") {
    cipher.encipher(key, plaintext);
    cout << "\n";
    i--;
  }
  else if (o == "water bottle" || o == "bottle" || o == "water") {
    cipher.encipher(key, plaintext);
    cout << "\n";
    i--;
  }
  else if (o == "lemonade" || o == "cans of lemonade" || o == "can of lemonade") {
    cipher.encipher(key, plaintext);
    cout << "\n";
    i--;
  }
  else if (o == "southeastern corner") {
    cipher.encipher(key, plaintext);
    cout << "\n";
    i--;
  }
  else if (o == "bathroom") {
    cipher.encipher(key, plaintext);
    cout << "\n";
    i--;
  }
  else if (o == "shower") {
    cipher.encipher(key, plaintext);
    cout << "\n";
  }
  else if (o == "glass door" || o == "sliding glass door") {
    cipher.encipher(key, plaintext);
    cout << "\n";
    i--;
  }
  else if (o == "shampoo" || o == "shampoo bottles") {
    cipher.encipher(key, plaintext);
    cout << "\n";
    i--;
  }
  else if (o == "toilet") {
    cipher.encipher(key, plaintext);
    cout << "\n";
    i--;
  }
  else if (o == "sink") {
    cipher.encipher(key, plaintext);
    cout << "\n";
    i--;
  }
  else  {
    cout << "There isn't an object that matches what you tried to write on!" << endl;
    i--;
  }
}
if (examine == "examine") {
  if (obj == "hotel room" || obj == "room" || o=="hotel room") {
    cout << room.setDescription() << endl;
    i--;
  }
  else if (obj == "bed") {
    cout << bed.setDescription() << endl;
    i--;
  }
  else if (obj == "bureau" || obj == "little bureau") {
    cout << bureau.setDescription() << endl;
    i--;
  }
  else if (obj == "lamp") {
    cout << lamp.setDescription() << endl;
    i--;
  }
  else if (obj == "top drawer" || obj == "first drawer") {
    cout << drawer1.setDescription() << endl;
    i--;
  }
  else if (obj == "bottom drawer" || obj == "second drawer") {
    cout << drawer2.setDescription() << endl;
    i--;
  }
  else if (obj == "notepad") {
    cout << notepad.setDescription()<< endl;
    i--;
  }
  else if (obj == "pen") {
    cout << pen.setDescription() << endl;
    i--;
  }
  else if (obj == "book" || obj == "different book") {
    cout << book.setDescription() << endl;
    i--;
  }
  else if (obj == "note" || obj == "sticky note") {
      cout << theNote.setDescription() << endl;
      i--;
  }
  else if (obj == "spiral notebook" || obj == "notebook" || obj == "first page") {
      cout << page1.setDescription() << endl;
      notebook = true;
    i--;
  }
  else if (obj == "second page") {
    if (balcony != true) {
      cout << blankPage.setDescription() << endl;
      notebook = true;
    }
    if (balcony == true) {
      cout << page2.setDescription() << endl;
    }
    i--;
  }
  else if (obj == "third page") {
    if (balcony != true) {
      cout << blankPage.setDescription() << endl;
      notebook = true;
    }
    if (balcony == true) {
      cout << page3.setDescription() << endl;
    }
    i--;
  }
  else if (obj == "fourth page") {
    if (balcony != true) {
      cout << blankPage.setDescription() << endl;
      notebook = true;
    }
    if (balcony == true) {
      cout << page4.setDescription() << endl;
    }
    i--;
  }
  else if (obj == "armchair") {
    cout << armchair.setDescription() << endl;
    i--;
  }
  else if (obj == "northern wall" || obj == "north wall") {
    cout << nWall.setDescription() << endl;
    i--; 
  }
  else if (obj == "paintings" || obj == "nondescript paintings") {
    cout << painting.setDescription() << endl;
    i--; 
  }
   else if (obj == "first painting" || obj == "painting number one" || obj == "painting one") {
    if (balcony != true) {
      cout << painting11.setDescription() << endl;
    }
    if (balcony == true) {
      cout << painting12.setDescription() << endl;
    }
    i--;
  }
  else if (obj == "second painting" || obj == "painting number two" || obj == "painting two") {
    if (balcony != true) {
      cout << painting21.setDescription() << endl;
    }
    if (balcony == true) {
      cout << painting22.setDescription() << endl;
    }
    i--;
  }
  else if (obj == "third painting" || obj == "painting number three" || obj == "painting three") {
    if (balcony != true) {
      cout << painting31.setDescription() << endl;
    }
    if (balcony == true) {
      cout << painting32.setDescription() << endl;
    }
    i--;
  }
  else if (obj == "eastern wall" || obj == "east wall") {
    cout << eWall.setDescription() << endl;
    i--; 
  }
  else if (obj == "hotel door") {
    cout << door.setDescription() << endl;
    i--;
  }
  else if (obj == "southern wall" || obj == "south wall") {
    cout << eWall.setDescription() << endl;
    i--; 
  }
  else if (obj == "photo" || obj == "old photo" || obj == "old photo of the beach" || obj == "photo of the beach") {
    if (balcony != true) {
      cout << photo.setDescription() << endl;
    }
    if (balcony == true) {
      cout << photo.setDescription() << " " << photo1.setDescription() << endl;
    }
    i--; 
  }
  else if (obj == "western wall" || obj == "west wall") {
    cout << nWall.setDescription() << endl;
    i--; 
  }
  else if (obj == "TV" || obj=="tv" || obj=="television") {
    cout << tv.setDescription() << endl;
    i--;
  }
  else if (obj == "windows" || obj == "windows facing west" || obj == "western windows") {
    cout << window.setDescription() << endl;
    i--;
  }
  else if (obj == "balcony") {
    if (notebook == true) {
      cout << page2.setDescription() << endl;
      balcony = true;
    }
    if (notebook != true) {
      cout << Balcony.setDescription() << endl;
    }
    i--;
  }
  else if (obj == "metal chair" || obj == "chair") {
    cout << chair.setDescription() << endl;
    i--;
  }
  else if (obj == "metal table" || obj == "table") {
    cout << table.setDescription() << endl;
    i--;
  }
  else if (obj == "northeastern corner") {
    cout << neCorner.setDescription() << endl;
    i--;
  }
  else if (obj == "closet") {
    if (change == true) {
      cout << "You open the back door of the closet and walk through." << endl;
      end=true;
      i++;
    }
    if (change == false) {
      cout << Closet.setDescription() << " " << backwall.setDescription() << " " << message.setDescription() << endl;
    }
    
    i--;
  }
  else if (obj == "back wall") {
    if (closet != true) {
      cout << backwall.setDescription() << " " << message.setDescription() << endl;
    }
    if (closet == true) {
      cout << backwall2.setDescription() << endl;
    }
    i--;
  }
  else if (obj == "message") {
    cout << message.setDescription() << endl;
    i--;
  }
  else if (obj == "hanger" || obj == "wire hanger" || obj == "hangers" || obj == "wire hangers") {
    cout << hanger.setDescription() << endl;
    i--;
  }
  else if (obj == "fridge" || obj == "mini fridge") {
    cout << fridge.setDescription() << endl;
    i--;
  }
  else if (obj == "water bottle" || obj == "bottle" || obj == "water") {
    cout << bottle.setDescription() << endl;
    i--;
  }
  else if (obj == "lemonade" || obj == "cans of lemonade" || obj == "can of lemonade") {
    cout << lemonade.setDescription() << endl;
    i--;
  }
  else if (obj == "southeastern corner") {
    cout << seCorner.setDescription() << endl;
    i--;
  }
  else if (obj == "bathroom") {
    cout << bathroom.setDescription() << endl;
    i--;
  }
  else if (obj == "shower") {
    cout << shower.setDescription() << endl;
    i--;
  }
  else if (obj == "glass door" || obj == "sliding glass door") {
    cout << gdoor.setDescription() << endl;
    i--;
  }
  else if (obj == "shampoo" || obj == "shampoo bottles") {
    cout << shampoo.setDescription() << endl;
    i--;
  }
  else if (obj == "toilet") {
    cout << toilet.setDescription() << endl;
    i--;
  }
  else if (obj == "sink") {
    cout << sink.setDescription() << endl;
    i--;
  }
  else  {
    cout << "There isn't an object that matches what you tried to examine!" << endl;
    i--;
  }
}
if (examine != "examine" && keyword != "keyword:" && keyword !="write on") {
  cout << "Try again with a different command!" << endl;
  i--;
}
  if (end==false) {
    getline (cin, observe);
  }
  if (observe == "end") {
    cout << "The end" << endl;
    i++;
  }
  length = observe.size();
  if (length>7) {
    examine = observe.substr(0,7);
    keyword = observe.substr(0,8);
    obj = observe.substr(8,length-7);
  }
}

return 0;
}
