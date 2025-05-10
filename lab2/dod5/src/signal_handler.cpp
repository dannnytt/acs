#include <iostream>
#include <csignal>
#include <unistd.h>

const char* signal_name(int signal_num) {
    switch (signal_num) {
        case SIGINT:   return "SIGINT";
        case SIGTERM:  return "SIGTERM";
    }
    return nullptr;
}

void signal_handler(int signal_num) {
    printf("Получен сигнал: %s (%d)\n", signal_name(signal_num), signal_num);
    exit(signal_num);
}


int main(int argc, char *argv[]) {

    signal(SIGINT, signal_handler);
    signal(SIGTERM, signal_handler);

    while (true) {
        std::cout << "Работы программы ..."  << std::endl;
        sleep(2);
    }

    return 0;
}
