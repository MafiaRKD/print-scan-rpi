# print-scan-rpi

🖨️ Print & Scan pre Raspberry Pi

Tento repozitár slúži ako jednoduchý inštalátor pre Raspberry Pi, ktorý:

- nastaví CUPS pre tlač,
- povolí web rozhranie,
- aktivuje Avahi (mDNS pre Bonjour),
- nainštaluje `scanservjs` cez oficiálny bootstrap skript,
- a pripraví prostredie pre skenovanie a tlač cez web.

## 🛠️ Inštalácia

Spusti nasledovné príkazy na Raspberry Pi (alebo inom Debian systéme):

    git clone https://github.com/<tvoje-username>/print-scan-rpi.git
    cd print-scan-rpi
    chmod +x install.sh
    sudo ./install.sh
