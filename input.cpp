#include <readline/readline.h>
#include <readline/history.h>
#include <string>
#include "input.h"

std::string readLineFromUser(const std::string& prompt) {
    char* input = readline(prompt.c_str());
    std::string result;
    if (input) {
        result = input;
        if (!result.empty()) {
            add_history(input);
        }
        free(input);
    }
    return result;
}
