#!/bin/bash

# =============================================
# سكربت لاكتشاف جميع الحزم المثبتة في النظام
# =============================================

# إنشاء مجلد لحفظ النتائج
OUTPUT_DIR="./installed_packages_$(date +%Y%m%d)"
mkdir -p "$OUTPUT_DIR"
echo "تم إنشاء مجلد النتائج: $OUTPUT_DIR"

# 1. حزم النظام (APT/Debian)
# ----------------------------
echo "جاري اكتشاف حزم النظام..."
dpkg --get-selections > "$OUTPUT_DIR/system_packages.txt"
echo "→ تم حفظ قائمة حزم النظام في system_packages.txt"

# 2. حزم بايثون (Pip)
# ----------------------------
echo "جاري اكتشاف حزم بايثون العامة..."
pip list --format=freeze > "$OUTPUT_DIR/python_packages.txt" 2>/dev/null || echo "⚠️ Pip غير مثبت أو به مشكلة"
echo "→ تم حفظ قائمة حزم بايثون في python_packages.txt"

# 3. حزم Node.js (NPM)
# ----------------------------
echo "جاري اكتشاف حزم Node.js العامة..."
npm list -g --depth=0 > "$OUTPUT_DIR/npm_global.txt" 2>/dev/null || echo "⚠️ NPM غير مثبت أو به مشكلة"
echo "→ تم حفظ قائمة حزم Node.js في npm_global.txt"

# 4. حزم Ruby (GEM)
# ----------------------------
echo "جاري اكتشاف حزم Ruby..."
gem list --no-versions > "$OUTPUT_DIR/gem_packages.txt" 2>/dev/null || echo "⚠️ Ruby GEM غير مثبت"
echo "→ تم حفظ قائمة حزم Ruby في gem_packages.txt"

# 5. حزم Rust (Cargo)
# ----------------------------
echo "جاري اكتشاف حزم Rust..."
cargo install --list > "$OUTPUT_DIR/cargo_packages.txt" 2>/dev/null || echo "⚠️ Rust Cargo غير مثبت"
echo "→ تم حفظ قائمة حزم Rust في cargo_packages.txt"

# 6. حزم Snap
# ----------------------------
echo "جاري اكتشاف حزم Snap..."
snap list > "$OUTPUT_DIR/snap_packages.txt" 2>/dev/null || echo "⚠️ Snap غير مثبت"
echo "→ تم حفظ قائمة حزم Snap في snap_packages.txt"

# 7. حزم Flatpak
# ----------------------------
echo "جاري اكتشاف حزم Flatpak..."
flatpak list --app > "$OUTPUT_DIR/flatpak_packages.txt" 2>/dev/null || echo "⚠️ Flatpak غير مثبت"
echo "→ تم حفظ قائمة حزم Flatpak في flatpak_packages.txt"

# 8. حزم Python (Pipx)
# ----------------------------
echo "جاري اكتشاف حزم Pipx..."
pipx list --short > "$OUTPUT_DIR/pipx_packages.txt" 2>/dev/null || echo "⚠️ Pipx غير مثبت"
echo "→ تم حفظ قائمة حزم Pipx في pipx_packages.txt"

# 9. حزم Conda
# ----------------------------
echo "جاري اكتشاف حزم Conda..."
conda list --export > "$OUTPUT_DIR/conda_packages.txt" 2>/dev/null || echo "⚠️ Conda غير مثبت"
echo "→ تم حفظ قائمة حزم Conda في conda_packages.txt"

# 10. حزم Homebrew (لـ macOS/Linux)
# ----------------------------
echo "جاري اكتشاف حزم Homebrew..."
brew list --versions > "$OUTPUT_DIR/homebrew_packages.txt" 2>/dev/null || echo "⚠️ Homebrew غير مثبت"
echo "→ تم حفظ قائمة حزم Homebrew في homebrew_packages.txt"

# 11. حزم Pacman (لـ Arch Linux)
# ----------------------------
echo "جاري اكتشاف حزم Pacman..."
pacman -Qqe > "$OUTPUT_DIR/pacman_packages.txt" 2>/dev/null || echo "⚠️ Pacman غير متاح"
echo "→ تم حفظ قائمة حزم Pacman في pacman_packages.txt"

# 12. حزم DNF (لـ Fedora/RHEL)
# ----------------------------
echo "جاري اكتشاف حزم DNF..."
dnf list installed > "$OUTPUT_DIR/dnf_packages.txt" 2>/dev/null || echo "⚠️ DNF غير متاح"
echo "→ تم حفظ قائمة حزم DNF في dnf_packages.txt"

# النتيجة النهائية
# ----------------------------
echo "
====================================================
تم الانتهاء من اكتشاف الحزم!
جميع القوائم محفوظة في المجلد:
$OUTPUT_DIR

محتوى المجلد:
$(ls -l "$OUTPUT_DIR")

لعرض حزم محددة:
  cat $OUTPUT_DIR/[اسم_الملف]
====================================================
"
