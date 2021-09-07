#include <stdio.h>
#include <string>
#include <vector>
#include <iostream>
#include <chrono>
#include <thread>

using namespace std;

class chopstiks {
private:
   bool take;
   int idCount = 0;
   
public:
   int id;

   chopstiks() {      
      take = false;
      id = idCount + 1;
      idCount++;
   }
   
   chopstiks(int id) {      
      take = false;
      id = id;
      idCount++;
   }

   void take_chopstiks() { // validar se pode pegar o garfo
      take = true;
   }

   void drop_chopstiks() {
      take = false;
   }
};

class philosopher {
private:
   int                    id;
   const string           name;
public:
   chopstiks             left_chopstik;
   chopstiks             right_chopstik;
   
   philosopher(int id, const string name, chopstiks lf, chopstiks rf) :
      id(id), name(name), left_chopstik(lf), right_chopstik(rf)
   {}

   string getName () {
      return name;
   }

   int getId () {
      return id;
   }
};

void think(philosopher ph) {
   cout <<  ph.getName() << " is thinking" << "\n";
}

void eat(philosopher ph) {
   think(ph);
   ph.left_chopstik.take_chopstiks();
   ph.right_chopstik.take_chopstiks();
   cout <<  ph.getName() << " started eating" << "\n"; 
   cout <<  ph.getName() << " finished eating" << "\n"; 
   ph.left_chopstik.drop_chopstiks();
   ph.right_chopstik.drop_chopstiks();
   think(ph);
}

void dine() {
   vector<string> names = {"Aristotle","Platon","Descartes","Kant","Nietzsche"};
   vector<chopstiks> chopstiks = {0,1,2,3,4};
   vector<philosopher> philosophers;

   int j = 1;
   for(int i = 0; i < 5; i++, j++) {
      if(i == 4){
         j = 0;
      }
      philosophers.emplace_back(move(philosopher(i, names.at(i), chopstiks.at(i), chopstiks.at(j))));
      eat(philosophers.at(i));
   }
};

int main() {
   auto t1 = chrono::high_resolution_clock::now();
   dine();
   auto t2 = chrono::high_resolution_clock::now();
   chrono::duration<double, milli> result = t2 - t1;
   cout << "Execution time (ms): " << result.count() << "\n";
   return 0;
}




 