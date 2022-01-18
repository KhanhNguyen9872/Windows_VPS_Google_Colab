#!/bin/sh
#KhanhNguyen9872
#Youtube: https://www.youtube.com/channel/UC8didcLVaL4iTfbuWBGv51w
#Facebook: https://fb.me/khanh10a1
#Phone: +84937927513
if [ ! -f khanhnguyen9872.vhd ] 2> /dev/null; then
  echo "Preparing...."
  wget -O ngrok-stable-linux-amd64.zip https://raw.githubusercontent.com/KhanhNguyen9872/Windows_7_VPS_12Hours/main/ngrok-stable-linux-amd64.zip > /dev/null 2>&1
  unzip ngrok-stable-linux-amd64.zip > /dev/null 2>&1
  read -p "Nhập key ngrok: " key
  ./ngrok authtoken ${key} > /dev/null 2>&1
  nohup ./ngrok tcp 5900 > /dev/null 2>&1
  echo ""
  sudo apt update -y > /dev/null 2>&1
  echo "Installing QEMU (1-3m)...."
  sudo apt install qemu-system-x86 curl -y > /dev/null 2>&1 && echo " - Done (KhanhNguyen9872)"
  echo ""
  echo "==========="
  echo ""
  echo "Downloading Windows 7 x64...."
  wget -O win7.7z https://github.com/KhanhNguyen9872/Windows_7_VPS_12Hours/releases/download/Win7VPS/win7.7z 2> /dev/null && echo " - Done (KhanhNguyen9872)"
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
  echo ""
  echo "==========="
  echo ""
  echo "Windows 7 x64 by KhanhNguyen9872"
  echo "Youtube: https://www.youtube.com/c/KhanhNguyen9872_Official"
  echo "Facebook: https://fb.me/khanh10a1"
  echo ""
  echo "Your IP Here: "
  curl ifconfig.me
  echo ""
  curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
  echo ""
  sudo qemu-system-x86_64 -hda khanhnguyen9872.vhd -cpu SandyBridge -smp cores=2 -m 10G -vga vmware -machine usb=on -device usb-tablet -device rtl8139,netdev=n0 -netdev user,id=n0 -vnc :0 > /dev/null 2>&1
  read -p "Press Enter to exit!" anykey
  echo ""
  rm -f khanhnguyen9872.sh
else
  echo "Windows 7 x64 by KhanhNguyen9872"
  echo "Youtube: https://www.youtube.com/c/KhanhNguyen9872_Official"
  echo "Facebook: https://fb.me/khanh10a1"
  echo ""
  echo "Your IP Here: "
  curl ifconfig.me
  echo ""
  curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
  echo ""
  sudo qemu-system-x86_64 -hda khanhnguyen9872.vhd -cpu SandyBridge -smp cores=2 -m 10G -vga vmware -machine usb=on -device usb-tablet -device rtl8139,netdev=n0 -netdev user,id=n0 -vnc :0 > /dev/null 2>&1
  read -p "Press Enter to exit!" anykey
  echo ""
  rm -f khanhnguyen9872.sh
fi
exit 0
