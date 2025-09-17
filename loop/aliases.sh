#هذا ملف الاعدادات المخصص  للتيرمينال

##الاعدادات الافتراضية 


##اختصارات المجلدات

##اختصارات برمجية
alias coding='code /mnt/d/Coding-Work-Space'
alias codespace='cd /mnt/d/Coding-Work-Space'
alias obsidian='cd /mnt/d/Crenius_WorkSpace'
alias newCpp='echo "creat new project : " && read x && mkdir ${x}_dir && cd ${x} && touch ${x}.cpp && touch guid.md && touch script.sh && touch axs.md'
alias cmpcpp='read x && clang++ $x.cpp -o $x && ./${x} '
alias task.base.reset='cat "/mnt/d/Crenius_WorkSpace/(1)_Tasks/التحكم/.Tasks.txt" > "/mnt/d/Crenius_WorkSpace/(1)_Tasks/التحكم/Tasks.base"'
# mycommand() {
#   # إنشاء متغير محلي لاسم الملف
#   local filename'read x && mkdir $x && cd $x && touch $X.cpp '
# 
#   # طلب إدخال اسم الملف مع تفعيل الإكمال التلقائي
#   vared -p "أدخل اسم الملف: " -c filename
# 
#   # استخدام المتغير في الأمر المطلوب (مثال: عرض المحتوى)
#   cat -- "$filename"
# }

##اختصارات البرامج الشخصية
alias termset='code /mnt/d/Coding-Work-Space/sh.control/setings.sh && echo "press |-> if complete :: " && read x && source /home/crenius/.zshrc && source /mnt/d/Coding-Work-Space/sh.control/setings.sh && source ~/.zshrc'
alias bat='batcat --theme="GitHub"'

## Functions ::
function ranger-cd {
    local tempfile
    tempfile="$(mktemp -t ranger_cd.XXXXXXXXXX)" || return 1
    ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    
    if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(pwd)" ]]; then
        cd -- "$(cat -- "$tempfile")" || return 1
    fi
    
    rm -f -- "$tempfile"
}





# function ranger-cd {
#     tempfile="$(mktemp -t 'ranger_cd.XXXXXXXXXX')"
#     ranger --choosedir='$tempfile' '${@:-$(pwd)}'
#     if [[ -f '$tempfile' ]] && [[ '$(cat -- "$tempfile")' != '$(echo -n `pwd`)' ]]; then
#         cd -- '$(cat "$tempfile")'
#     fi
#     rm -f -- '$tempfile'
# }
