#!/bin/bash
set -e

echo "🔧 Aktualizujem systém..."
apt update && apt upgrade -y

echo "📦 Inštalujem základné balíky pre tlač a skenovanie..."
apt install -y \
  cups cups-bsd hplip printer-driver-hpijs avahi-daemon usbutils sane-utils \
  sudo curl wget git build-essential net-tools simple-scan system-config-printer \
  python3-dev xsane policykit-1 dbus

echo "🌐 Povolenie web rozhrania CUPS..."
cupsctl --remote-admin --remote-any
systemctl restart cups

echo "🧾 Pridávam aktuálneho používateľa do skupiny lpadmin..."
usermod -aG lpadmin $USER

echo "📡 Zapínam Avahi (mDNS)..."
systemctl enable avahi-daemon
systemctl start avahi-daemon

echo "🔧 Spúšťam hp-plugin pre inštaláciu proprietárnych ovládačov (potvrď dialógy)..."
hp-plugin -i || echo "⚠️ hp-plugin možno neúspešný alebo bolo zrušené, over prosím manuálne spustením: sudo hp-plugin -i"

echo "📥 Spúšťam oficiálny inštalačný skript scanservjs..."
curl -s https://raw.githubusercontent.com/sbs20/scanservjs/master/bootstrap.sh | sudo bash -s -- -v latest

echo "🔍 Test detekcie skenera..."
scanimage -L || echo "⚠️ Skener zatiaľ nebol nájdený – skontroluj USB a ovládače"

echo "✅ Inštalácia úspešne dokončená!"
echo "➡️ Scanservjs: http://$(hostname -I | awk '{print $1}'):8080"
echo "➡️ CUPS: http://$(hostname -I | awk '{print $1}'):631"
