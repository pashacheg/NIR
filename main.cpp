#include <iostream>
#include <string>
#include "input.h"
#include "output.h"

int main() {
    std::string line = readLineFromUser("Введите строку: ");
    printLine("Вы ввели: " + line);
    return 0;
}
