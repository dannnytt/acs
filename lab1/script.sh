#!/bin/bash

OS_INFO=/etc/os-release
CPU_INFO=/proc/cpuinfo

HOSTNAME=$(hostname)
USERNAME=$(whoami)

OS_NAME=$(grep -w "NAME" $OS_INFO | awk -F '=' '{print $2}' | xargs)
OS_VERSION=$(grep -w "VERSION" $OS_INFO | awk -F '=' '{print $2}' | xargs)

KERNEL_VERSION=$(uname -r)
KERNEL_ARCHITECTURE=$(uname -m)

CPU_MODEL=$(grep -m 1 "model name" $CPU_INFO | awk -F ':' '{print $2}' | xargs)
CPU_CORES=$(grep -m 1 "cpu cores" $CPU_INFO | awk -F ':' '{print $2}' | xargs)
CPU_THREADS=$(grep -m 1 "siblings" $CPU_INFO | awk -F ':' '{print $2}' | xargs)
CPU_FREQUENCY=$(grep -m 1 "cpu MHz" $CPU_INFO  | awk -F ':' '{print $2}' | xargs)
CACHE_SIZE=$(grep -m 1 "cache size" $CPU_INFO | awk -F ':' '{print $2}' | xargs)
L1d_CACHE=$(lscpu | grep -w "L1d" | awk -F ':' '{print $2}' | xargs)
L1i_CACHE=$(lscpu | grep -w "L1i" | awk -F ':' '{print $2}' | xargs)
L2_CACHE=$(lscpu | grep -w "L2" | awk -F ':' '{print $2}' | xargs)
L3_CACHE=$(lscpu | grep -w "L3" | awk -F ':' '{print $2}' | xargs)

TOTAL_RAM=$(free -m | grep -w "Mem:" | awk '{print $2}')
USED_RAM=$(free -m | grep -w "Mem:" | awk '{print $3}')
FREE_RAM=$(free -m | grep -w "Mem:" | awk '{print $4}')

MAC_ADDRESS=$(ip a | grep -A 3 eth0 | grep "link/ether" | awk '{print $2}' | xargs)
IP_V4_ADDRESS=$(ip a | grep -A 3 eth0 | grep -m 1 "inet" | awk '{print $2}')
IP_V6_ADDRESS=$(ip a | grep -A 3 eth0 | grep "inet6" | awk '{print $2}')
INTERNET_SPEED=$(speedtest | grep "Download:" | awk -F ':' '{print $2}' | xargs)
SYSTEM_PARTITION=$(df -Th | grep -v "none")

{
  echo "Имя хоста:|$HOSTNAME"
  echo "Имя пользователя:|$USERNAME"
  echo "Название ОС:|$OS_NAME"
  echo "Версия ОС:|$OS_VERSION"
  echo "Версия ядра:|$KERNEL_VERSION"
  echo "Архитектура ядра:|$KERNEL_ARCHITECTURE"
  echo "Модель процессора:|$CPU_MODEL"
  echo "Количество ядер:|$CPU_CORES"
  echo "Количество потоков:|$CPU_THREADS"
  echo "Частота процессора:|$CPU_FREQUENCY"
  echo "Размер кеш-памяти:|$CACHE_SIZE"
  echo "L1d кэш:|$L1d_CACHE"
  echo "L1i кэш:|$L1i_CACHE"
  echo "L2 кэш:|$L2_CACHE"
  echo "L3 кэш|$L3_CACHE"
  echo "Общий объем ОЗУ:|$TOTAL_RAM Mb"
  echo "Используемый объем ОЗУ:|$USED_RAM Mb / $TOTAL_RAM Mb"
  echo "Свободный объем ОЗУ:|$FREE_RAM Mb / $TOTAL_RAM Mb"
  echo "MAC-адрес(eth0):|$MAC_ADDRESS"
  echo "IPv4 адрес(eth0):|$IP_V4_ADDRESS"
  echo "IPv6 адрес(eth0):|$IP_V6_ADDRESS"
  echo "Скорость сетевого соединения:|$INTERNET_SPEED"
  
} | column -t -s '|'

echo -e "\n$SYSTEM_PARTITION"

