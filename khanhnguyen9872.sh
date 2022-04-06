#!/bin/sh
#KhanhNguyen9872
#Youtube: https://www.youtube.com/channel/UC8didcLVaL4iTfbuWBGv51w
#Facebook: https://fb.me/khanh10a1
#Phone: +84937927513
if [ ! -f khanhnguyen9872.vhd ] 2> /dev/null || [ ! -f khanhnguyen9872.qcow2 ] 2> /dev/null; then
  echo "Preparing...."
  wget -O ngrok-stable-linux-amd64.zip https://raw.githubusercontent.com/KhanhNguyen9872/Windows_VPS_Google_Colab/main/ngrok-stable-linux-amd64.zip > /dev/null 2>&1
  unzip ngrok-stable-linux-amd64.zip > /dev/null 2>&1
  read -p "Nhập key ngrok: " key
  ./ngrok authtoken $key
  nohup ./ngrok tcp -region=ap 5900 &>/dev/null &
  echo "KhanhNguyen9872"
  echo ""
  echo "1. Linux (Ubuntu amd64)"
  echo "2. Windows"
  echo ""
  read -p "Choose your platform: " platform
  echo ""
  if [[ ${platform} -eq 1 ]]; then
    echo "Installing Linux (Ubuntu amd64)...."
    echo ""
    sudo apt update -y > /dev/null 2>&1
    sudo apt install xfce4 xarchiver chromium-browser mesa-utils xfce4-goodies dbus perl p7zip unzip zip curl tar git python3 python3-pip net-tools tigervnc-standalone-server tigervnc-xorg-extension -y > /dev/null 2>&1
    useradd -s /bin/bash -m khanh
    echo ""
    echo ""
    echo "Setting up your Password"
    echo ""
    passwd khanh
    if [ -d /home/khanh ] 2> /dev/null; then
      export HOME="/home/khanh"
      export DISPLAY=":0"
    else
      export HOME="/root"
      export DISPLAY=":0"
    fi
    echo ""
    printf "\nYour IP here: "
    curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
    echo ""
    echo "Write this command: vncserver :0"
    echo ""
    chmod 777 /etc/sudoers
    echo "khanh    ALL=(ALL:ALL) ALL" >> /etc/sudoers
    chmod 444 /etc/sudoers
    su khanh
    echo ""
  else
    echo "Please wait for installing..."
    echo ""
    sudo apt update -y > /dev/null 2>&1
    echo "Installing QEMU (1-3m)...."
    sudo apt install qemu-system-x86 curl -y > /dev/null 2>&1 && echo " - Done (KhanhNguyen9872)"
    echo ""
    echo "==========="
    echo ""
    echo "1. Windows 7 x64"
    echo "2. Windows XP SP3 x86"
    echo ""
    read -p "Choose your Windows: " windows
    echo ""
    if [[ ${windows} -eq 1 ]] 2> /dev/null; then
      echo "Downloading Windows 7 x64...."
      wget -O win7.7z https://github.com/KhanhNguyen9872/Windows_VPS_Google_Colab/releases/download/Win7VPS/win7.7z 2> /dev/null && echo " - Done (KhanhNguyen9872)"
      echo ""
      if [ -f win7.7z ] 2> /dev/null; then
        echo "Installing Windows 7 x64...."
        7z e win7.7z > /dev/null 2>&1 && echo " - Done (KhanhNguyen9872)"
        if [ -f win7.7z ] 2> /dev/null; then
          rm -f win7.7z 2> /dev/null
        fi
      else
        echo "File error! Can't install!"
        rm -f khanhnguyen9872.vhd 2> /dev/null
        rm -f win7.7z 2> /dev/null
        rm -f khanhnguyen9872.sh 2> /dev/null
        exit 0
      fi
      if [ ! -f khanhnguyen9872.vhd ] 2> /dev/null; then
        echo "File error! Can't install! Exit!"
        rm -f khanhnguyen9872.vhd 2> /dev/null
        rm -f win7.7z 2> /dev/null
        rm -f khanhnguyen9872.sh 2> /dev/null
        exit 0
      fi
    else
      if [[ ${windows} -eq 2 ]] 2> /dev/null; then
        echo "Downloading Windows XP SP3 x86...."
        wget -O winxp.7z https://github.com/KhanhNguyen9872/Windows_VPS_Google_Colab/releases/download/WinXPVPS/winxp.7z 2> /dev/null && echo " - Done (KhanhNguyen9872)"
        echo ""
        if [ -f winxp.7z ] 2> /dev/null; then
          echo "Installing Windows XP SP3 x86...."
          7z e winxp.7z > /dev/null 2>&1 && echo " - Done (KhanhNguyen9872)"
          if [ -f winxp.7z ] 2> /dev/null; then
            rm -f winxp.7z 2> /dev/null
          fi
        else
          echo "File error! Can't install!"
          rm -f khanhnguyen9872.qcow2 2> /dev/null
          rm -f winxp.7z 2> /dev/null
          rm -f khanhnguyen9872.sh 2> /dev/null
          exit 0
        fi
        if [ ! -f khanhnguyen9872.qcow2 ] 2> /dev/null; then
          echo "File error! Can't install! Exit!"
          rm -f khanhnguyen9872.qcow2 2> /dev/null
          rm -f winxp.7z 2> /dev/null
          rm -f khanhnguyen9872.sh 2> /dev/null
          exit 0
        fi
      else
        echo "You not choose Windows! Exit!"
        exit 0
      fi
    fi
    if [[ ${windows} -eq 2 ]] 2> /dev/null; then
      echo ""
      echo "==========="
      echo ""
      echo "Windows XP SP3 x86 by KhanhNguyen9872"
      echo "Youtube: https://www.youtube.com/c/KhanhNguyen9872_Official"
      echo "Facebook: https://fb.me/khanh10a1"
      echo ""
      echo "Your IP Here: "
      curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
      echo ""
      sudo qemu-system-x86_64 -hda khanhnguyen9872.qcow2 --full-screen -accel tcg -cpu max -smp cores=1,threads=2 -m 3G -vga std -machine pc -machine usb=on -device usb-tablet -device rtl8139,netdev=n0 -netdev user,id=n0 -vnc :0
      read -p "Press Enter to exit!" anykey
      echo ""
      rm -f khanhnguyen9872.sh
    else
      if [[ ${windows} -eq 1 ]] 2> /dev/null; then
        echo ""
        echo "==========="
        echo ""
        echo "Windows 7 x64 by KhanhNguyen9872"
        echo "Youtube: https://www.youtube.com/c/KhanhNguyen9872_Official"
        echo "Facebook: https://fb.me/khanh10a1"
        echo ""
        echo "Your IP Here: "
        curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
        echo ""
        sudo qemu-system-x86_64 -hda khanhnguyen9872.vhd --full-screen -accel tcg -cpu max -smp cores=2 -m 4G -vga std -nographic -machine usb=on -device usb-tablet -device rtl8139,netdev=n0 -netdev user,id=n0 -vnc :0 > /dev/null 2>&1
        read -p "Press Enter to exit!" anykey
        echo ""
        rm -f khanhnguyen9872.sh
      else
        exit 0
      fi
    fi
  fi
else
  if [ -f khanhnguyen9872.qcow2 ] 2> /dev/null; then
    echo "Windows XP SP3 x86 by KhanhNguyen9872"
    echo "Youtube: https://www.youtube.com/c/KhanhNguyen9872_Official"
    echo "Facebook: https://fb.me/khanh10a1"
    echo ""
    echo "Your IP Here: "
    curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
    echo ""
    sudo qemu-system-x86_64 -hda khanhnguyen9872.qcow2 --full-screen -accel tcg -cpu max -smp cores=1,threads=2 -m 3G -vga std -machine pc -machine usb=on -device usb-tablet -device rtl8139,netdev=n0 -netdev user,id=n0 -vnc :0 > /dev/null 2>&1
    read -p "Press Enter to exit!" anykey
    echo ""
    rm -f khanhnguyen9872.sh
  else
    if [ -f khanhnguyen9872.vhd ] 2> /dev/null; then
      echo "Windows 7 x64 by KhanhNguyen9872"
      echo "Youtube: https://www.youtube.com/c/KhanhNguyen9872_Official"
      echo "Facebook: https://fb.me/khanh10a1"
      echo ""
      echo "Your IP Here: "
      curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
      echo ""
      sudo qemu-system-x86_64 -hda khanhnguyen9872.vhd --full-screen -accel tcg -cpu max -smp cores=1,threads=2 -m 3G -vga std -machine pc -machine usb=on -device usb-tablet -device rtl8139,netdev=n0 -netdev user,id=n0 -vnc :0 > /dev/null 2>&1
      read -p "Press Enter to exit!" anykey
      echo ""
      rm -f khanhnguyen9872.sh
    else
      exit 0
    fi
  fi
fi
exit 0
