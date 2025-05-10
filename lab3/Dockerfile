FROM ubuntu:latest

# Устанавливаем необходимые пакеты
RUN apt update && apt install -y \
    openssh-server \
    iproute2 \
    sudo \
    python3 \
    python3-pip

# Необходимо для openssh-server
RUN mkdir -p /var/run/sshd

# Создание пользователя
RUN useradd -m -d /home/user -s /bin/bash -u 2000 user && \
    usermod -aG sudo user && \
    echo 'user:password' | chpasswd

# Вход по паролю через утилиту ssh
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config && \
    echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config

# Открываем порт 22
EXPOSE 22

# Запуск ssh демона
CMD [ "/usr/sbin/sshd", "-D" ]
