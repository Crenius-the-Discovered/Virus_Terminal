#!/bin/bash
# متغيرات لتخصيص الإعدادات
WLAN_INTERFACE="wlp1s0"  # اسم واجهة الشبكة اللاسلكية
HOTSPOT_SSID="Leopard-UDesktop"  # اسم الشبكة التي تريد إنشاءها
HOTSPOT_PASSWORD="wifi_fox_666"  # كلمة المرور (يجب أن تكون 8 أحرف على الأقل)
GATEWAY="192.168.100.1"  # عنوان Gateway لشبكتك (تحقق باستخدام `route -n`)
CHANNEL="1"  # القناة المستخدمة (يمكن تغييرها إلى قناة أخرى مدعومة)

# التحقق من توفر واجهة Wi-Fi
echo "التحقق من واجهة الشبكة..."
if ! iwconfig | grep -q "$WLAN_INTERFACE"; then
    echo "الواجهة $WLAN_INTERFACE غير موجودة أو غير مفعلة. الرجاء التحقق باستخدام 'iwconfig'."
    exit 1
fi
echo "واجهة الشبكة المستخدمة: $WLAN_INTERFACE"

# تفعيل مشاركة الإنترنت
echo "تفعيل مشاركة الإنترنت..."
sudo sysctl -w net.ipv4.ip_forward=1
sudo iptables -t nat -A POSTROUTING -o $WLAN_INTERFACE -j MASQUERADE

# إنشاء نقطة الاتصال مع تحديد القناة
echo "إنشاء نقطة الاتصال..."
if sudo create_ap --channel $CHANNEL $WLAN_INTERFACE $WLAN_INTERFACE $HOTSPOT_SSID $HOTSPOT_PASSWORD -g $GATEWAY; then
    # رسالة تأكيد في حالة النجاح
    echo "تم إنشاء نقطة الاتصال باسم: $HOTSPOT_SSID"
    echo "كلمة المرور: $HOTSPOT_PASSWORD"
else
    # رسالة خطأ في حالة الفشل
    echo "فشل في إنشاء نقطة الاتصال."
    echo "التحقق من دعم الواجهة لوضع 'Access Point' باستخدام 'iw list | grep AP'."
    echo "أو جرب قناة أخرى (مثل 6 أو 11) عن طريق تغيير متغير CHANNEL في الكود."
    exit 1
fi
