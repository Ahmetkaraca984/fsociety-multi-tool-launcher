#!/data/data/com.termux/files/usr/bin/bash

# Fsociety ASCII Banner
banner() {
  clear
  echo -e "\e[1;31m"
  echo "███████╗███████╗ ██████╗ ██████╗  ██████╗███████╗██████╗ ██╗   ██╗"
  echo "╚════██║██╔════╝██╔════╝██╔═══██╗██╔════╝██╔════╝██╔══██╗██║   ██║"
  echo "    ██╔╝█████╗  ██║     ██║   ██║██║     █████╗  ██████╔╝██║   ██║"
  echo "   ██╔╝ ██╔══╝  ██║     ██║   ██║██║     ██╔══╝  ██╔═══╝ ██║   ██║"
  echo "   ██║  ███████╗╚██████╗╚██████╔╝╚██████╗███████╗██║     ╚██████╔╝"
  echo "   ╚═╝  ╚══════╝ ╚═════╝ ╚═════╝  ╚═════╝╚══════╝╚═╝      ╚═════╝ "
  echo -e "\e[0m"
  echo "          [ Fsociety Multi-Tool Launcher | By Ahmet ]"
  echo ""
}

tools=(
  "https://github.com/htr-tech/zphisher ZPhisher zphisher.sh"
  "https://github.com/Gameye98/Black-Hydra Black-Hydra blackhydra.sh"
  "https://github.com/vanhauser-thc/thc-hydra THC-Hydra ./configure && make"
  "https://github.com/Hax4us/Metasploit metasploit ./metasploit.sh"
  "https://github.com/DarkSecDevelopers/HiddenEye HiddenEye hiddeneye.py"
  "https://github.com/sqlmapproject/sqlmap sqlmap sqlmap.py"
  "https://github.com/cyweb/hammer Hammer hammer.py"
  "https://github.com/Ha3MrX/DDos-Attack DDos-Attack ddos-attack.py"
  "https://github.com/The404Hacking/websploit Websploit websploit"
  "https://github.com/Manisso/fsociety fsociety fsociety.py"
   "https://github.com/1N3/Sn1per Sn1per sniper.sh"
  "https://github.com/D4Vinci/Cr3dOv3r Cr3dOv3r Cr3dOv3r.py"
  "https://github.com/Ha3MrX/Gemail-Hack Gemail-Hack gemailhack.py"
  "https://github.com/TechnicalMujeeb/Tm-scanner Tm-scanner tm-scanner.sh"
  "https://github.com/abhaybhargav/burp-suite-scripts burp-suite-scripts start.sh"
  "https://github.com/s0md3v/ReconDog ReconDog dog.py"
  "https://github.com/m4ll0k/Infoga Infoga infoga.py"
  "https://github.com/LimerBoy/Blazy Blazy blazy.py"
  "https://github.com/k4m4/kickthemout KickThemOut kickthemout.py"
  "https://github.com/Mebus/cupp cupp cupp.py"
  "https://github.com/TrustedSec/SET Social-Engineer Toolkit setoolkit"
  "https://github.com/mrcakil/SayCheese SayCheese saycheese.py"
  "https://github.com/vanhauser-thc/slowloris Slowloris slowloris.pl"
  "https://github.com/XerxesProject/Xerxes Xerxes xerxes.c"
  "https://github.com/NullArray/routersploit Routersploit rsf.py"
  "https://github.com/405s/ShellPhish ShellPhish shellphish.sh"
  "https://github.com/Hax4us/WhatsApp-Business-Phishing WhatsApp-Phishing whatsapp.sh"
  "https://github.com/hacker420/Phishing-Toolkit Phishing-Toolkit phishing.sh"
  "https://github.com/KALILINUX/SHARKFIN Sharkfin sharkfin.sh"
  "https://github.com/xd4rks/BlackEye BlackEye blackeye.sh"
)

run_tool() {
  local index=$1
  IFS=' ' read -r repo folder runfile <<< "${tools[$index]}"
  echo -e "\e[1;33m[+] İndiriliyor: $folder\e[0m"
  git clone "$repo"
  cd "$folder" || exit
  chmod +x "$runfile"
  bash "$runfile" || python "$runfile" || ./"$runfile"
  cd ..
}

menu() {
  banner
  echo -e "\e[1;32mAraç Listesi:\e[0m"
  for i in "${!tools[@]}"; do
    IFS=' ' read -r _ name _ <<< "${tools[$i]}"
    printf "[%2d] %s\n" $((i+1)) "$name"
  done
  echo "[99] Çıkış"
  echo ""
  read -p "Seçim yap (1-${#tools[@]}): " secim
  if [[ "$secim" == "99" ]]; then
    echo "Çıkılıyor..."
    exit
  elif ((secim >= 1 && secim <= ${#tools[@]})); then
    run_tool $((secim-1))
  else
    echo "Geçersiz seçim."
  fi
}

while true; do
  menu
  read -p "Devam etmek için Enter'a bas..."
done
