#!/bin/sh
#KhanhNguyen9872
#Youtube: 
#Facebook: https://fb.me/khanh10a1
#Phone: +84937927513
echo "Preparing...."
wget -O ngrok-stable-linux-amd64.zip https://raw.githubusercontent.com/KhanhNguyen9872/Windows_7_VPS_12Hours/main/ngrok-stable-linux-amd64.zip > /dev/null 2>&1
unzip ngrok-stable-linux-amd64.zip > /dev/null 2>&1
read -p "Paste authtoken ngrok: " CRP
./ngrok authtoken $CRP 
nohup ./ngrok tcp 5900 &>/dev/null &
echo Please wait for installing...
sudo apt update -y > /dev/null 2>&1
echo "Installing QEMU (2-3m)..."
sudo apt install qemu-system-x86 wget ifconfig b7zip -y > /dev/null 2>&1
echo "Downloading Windows 7 x64"
wget -O win7.7z https://raw.githubusercontent.com/KhanhNguyen9872/Windows_7_VPS_12Hours/main/win7/win7.7z
if [ -f win7.7z ]; then
  echo "Installing Windows 7 x64"
  7z e win7.7z
else
  echo "File error! Can't install!"
  exit 0
fi
if [ ! -f khanhnguyen9872.qcow2 ]; then
  echo "File error! Can't install! Exit!"
  exit 0
fi
echo "Windows 7 x64 by KhanhNguyen9872"
echo "Youtube: https://www.youtube.com/c/KhanhNguyen9872_Official"
echo "Facebook: https://fb.me/khanh10a1
sudo qemu-system-x86_64 -hda khanhnguyen9872.vhd -cpu SandyBridge-v2 -smp cores=2 -m 10G -machine usb=on -device usb-tablet -device rtl8139,netdev=n0 -netdev user,id=n0 -vnc :9872 > /dev/null 2>&1
echo ""
echo "Your IP Here: "
cat /proc/cpuinfo
