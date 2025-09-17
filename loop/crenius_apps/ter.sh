#!/bin/bash

# التحقق من توفر Zsh
if ! command -v zsh >/dev/null 2>&1; then
  echo "Zsh غير مثبت. جاري تثبيته..."
  sudo apt update -y && sudo apt install -y zsh
fi

# التحقق من القشرة الافتراضية وتغييرها إلى Zsh إذا لزم الأمر
if [[ ! $SHELL == *"zsh"* ]]; then
  echo "القشرة الحالية ليست Zsh. جاري تغيير القشرة الافتراضية إلى Zsh..."
  sudo chsh -s /usr/bin/zsh $USER
  echo "تم تغيير القشرة الافتراضية. يرجى إعادة تشغيل الطرفية أو تسجيل الخروج/الدخول."
fi

# تحديث النظام وتثبيت الأدوات الأساسية
echo "تحديث النظام وتثبيت الأدوات الأساسية..."
sudo apt update -y && sudo apt upgrade -y
# sudo apt install -y git curl wget nano zsh unzip fonts-powerline fontconfig

# تثبيت Oh My Zsh
echo "تثبيت Oh My Zsh..."
RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# تثبيت سمة Powerlevel10k
echo "تثبيت سمة Powerlevel10k..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

# إعداد ملف .zshrc مع السمة والمكونات
echo "إعداد ملف .zshrc..."
cat > ~/.zshrc << 'EOF'
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
# تعيين موجه أوامر مخصص مشابه لـ Kali
export PS1="%n@%m %~$ "
EOF

# تثبيت مكونات الإكمال التلقائي
echo "تثبيت مكونات zsh-autosuggestions و zsh-syntax-highlighting..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# تنزيل وتثبيت خط Hack Nerd Font
echo "تنزيل خط Hack Nerd Font..."
mkdir -p ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Hack.zip -O /tmp/Hack.zip
unzip /tmp/Hack.zip -d ~/.local/share/fonts
fc-cache -fv
rm /tmp/Hack.zip

# تثبيت neofetch لعرض معلومات النظام
echo "تثبيت neofetch..."
sudo apt install -y neofetch

# تنزيل نظام ألوان Kali Dark
echo "تنزيل نظام ألوان Kali Dark..."
wget https://raw.githubusercontent.com/Mayccoll/Gogh/master/themes/kali-dark.sh -O /tmp/kali-dark.sh
bash /tmp/kali-dark.sh
rm /tmp/kali-dark.sh

# # تثبيت أدوات أمنية
# echo "تثبيت أدوات أمنية (nmap, Metasploit, Tool-X)..."
# sudo apt install -y nmap
# # تثبيت Metasploit
# curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > /tmp/msfinstall
# chmod +x /tmp/msfinstall
# sudo /tmp/msfinstall
# rm /tmp/msfinstall
# # تثبيت Tool-X
# git clone https://github.com/rajkumardusad/Tool-X.git ~/Tool-X
# cd ~/Tool-X
# chmod +x install
# sudo ./install
# cd ~

# رسالة انتهاء
echo "تم تخصيص طرفية Ubuntu بنجاح! 🎉"
echo "ملاحظات:"
echo "- أعد تشغيل الطرفية أو قم بتسجيل الخروج/الدخول لتطبيق Zsh كالقشرة الافتراضية."
echo "- افتح إعدادات الطرفية (مثل GNOME Terminal) واختر خط 'Hack Nerd Font' يدويًا."
echo "- شغّل 'p10k configure' في Zsh لتخصيص Powerlevel10k."
echo "- استخدم 'Tool-X' لتثبيت المزيد من أدوات Kali."
