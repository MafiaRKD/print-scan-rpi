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

    git clone https://github.com/MafiaRKD/print-scan-rpi.git
    cd print-scan-rpi
    chmod +x install.sh
    sudo ./install.sh
 
 Počas inštalácie bude spustený aj hp-plugin – nástroj pre sťahovanie a inštaláciu proprietárnych HP ovládačov. V niektorých prípadoch je potrebné potvrdiť licenciu a výber zariadenia. Ak si inštaláciu zrušil, môžeš ju kedykoľvek zopakovať:
 
     sudo hp-plugin -i
