#include <iostream>
using namespace std;

int routineB(int r){
    return (r-5)*4;
}
int routineA(int x, int y){
    int s1 = 2*x + routineB(3*y);
    return routineB(s1 - 1);
}
int main(){
    int a = 101, b = 298;
    int s0 = routineA(a,b);
    std::cout << s0;
}
