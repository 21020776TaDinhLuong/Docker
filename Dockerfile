FROM ubuntu:latest

# Cài đặt các gói cần thiết
RUN apt-get update && apt-get install -y \
    xfce4 \
    xfce4-goodies \
    tightvncserver \
    vim

# Thiết lập môi trường VNC
ENV USER=root \
    VNC_PORT=5901 \
    VNC_RESOLUTION=1280x720 \
    VNC_COL_DEPTH=24

# Thiết lập mật khẩu VNC
RUN mkdir -p $HOME/.vnc
RUN echo "123456789" | vncpasswd -f >> $HOME/.vnc/passwd
RUN chmod 600 $HOME/.vnc/passwd

# Thiết lập startup script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
