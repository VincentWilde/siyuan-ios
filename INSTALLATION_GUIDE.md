# Guida Completa: Compilazione e Installazione SiYuan iOS

Questa guida ti aiuterà a compilare e installare l'app SiYuan modificata sul tuo iPhone.

## ⚠️ Situazione Attuale

**PROBLEMA PRINCIPALE:** Il framework `iosk.xcframework` **NON è presente** in questo repository.

Il file di progetto Xcode fa riferimento a:
```
../siyuan/kernel/ios/iosk.xcframework
```

Questo framework contiene il kernel Go di SiYuan compilato per iOS ed è **essenziale** per il funzionamento dell'app.

## 📋 Requisiti Necessari

### Hardware e Software

| Requisito | Dettagli |
|-----------|----------|
| **Computer** | Mac con chip Intel o Apple Silicon |
| **Sistema Operativo** | macOS 12.0 (Monterey) o successivo |
| **Xcode** | Xcode 14.0 o successivo |
| **iPhone** | iPhone con iOS 15.0 o successivo |
| **Cavo** | Cavo Lightning/USB-C per connettere iPhone al Mac |
| **Account Apple** | Apple ID (gratuito per sviluppo personale) |

### Account Sviluppatore Apple

**Opzione 1: Account Gratuito (Personale)**
- ✅ Installazione su massimo 3 dispositivi
- ✅ Gratis
- ⚠️ L'app scade dopo 7 giorni (va reinstallata)
- ⚠️ Alcune limitazioni (no Push Notifications, ecc.)

**Opzione 2: Account Developer ($99/anno)**
- ✅ Installazione su dispositivi illimitati
- ✅ App valida per 1 anno
- ✅ Tutte le funzionalità disponibili
- ✅ Possibilità di distribuire su TestFlight/App Store

## 🔧 Passo 1: Ottenere il Framework Iosk

Hai 2 opzioni:

### Opzione A: Scaricare Framework Pre-compilato (Più Facile)

```bash
# 1. Scarica l'ultima release di SiYuan
# Vai su: https://github.com/siyuan-note/siyuan/releases
# Scarica il file: SiYuan-x.x.x-iOS.ipa

# 2. Estrai il framework dall'IPA
cd ~/Downloads
unzip SiYuan-*-iOS.ipa -d SiYuan-extracted
# Il framework sarà in: SiYuan-extracted/Payload/SiYuan.app/Frameworks/

# 3. Copia il framework nel progetto
mkdir -p siyuan/kernel/ios
cp -r SiYuan-extracted/Payload/SiYuan.app/Frameworks/iosk.xcframework ../siyuan/kernel/ios/
```

### Opzione B: Compilare il Kernel da Zero (Avanzato)

⚠️ **Questa opzione richiede conoscenze avanzate di Go e compilazione cross-platform**

```bash
# 1. Clona il repository principale di SiYuan
git clone https://github.com/siyuan-note/siyuan.git
cd siyuan

# 2. Installa Go (se non già installato)
# Vai su: https://golang.org/dl/
# Scarica e installa Go 1.21 o successivo

# 3. Installa dipendenze iOS
xcode-select --install

# 4. Compila il kernel per iOS
cd kernel
./scripts/build-ios.sh  # Se esiste uno script di build
# OPPURE segui le istruzioni nel README del repository SiYuan

# 5. Il framework compilato sarà in: kernel/ios/iosk.xcframework
```

## 🏗️ Passo 2: Configurare il Progetto Xcode

### 2.1 Verifica Struttura Directory

Assicurati che la struttura sia:
```
siyuan-ios/
├── siyuan-ios/
│   ├── AppDelegate.swift
│   ├── ViewController.swift
│   ├── IAPManager.swift
│   └── ...
├── siyuan-ios.xcodeproj/
├── app/
│   └── zoneinfo.zip
└── ../siyuan/kernel/ios/iosk.xcframework  ← DEVE ESISTERE
```

### 2.2 Verifica Presenza Risorse App

Il progetto richiede anche queste directory (dal repository principale):
- `appearance/` - Temi e stili
- `guide/` - Guide utente
- `stage/` - Assets
- `changelogs/` - Log modifiche

```bash
# Opzione 1: Scarica dall'ultima release
cd ~/Downloads
curl -L https://github.com/siyuan-note/siyuan/releases/latest/download/siyuan-ios.zip -o siyuan-ios.zip
unzip siyuan-ios.zip
# Copia le directory necessarie

# Opzione 2: Clona il repo e copia
git clone https://github.com/siyuan-note/siyuan.git temp-siyuan
cd siyuan-ios
mkdir -p app
cp -r ../temp-siyuan/app/appearance app/
cp -r ../temp-siyuan/app/guide app/
cp -r ../temp-siyuan/app/stage app/
cp -r ../temp-siyuan/app/changelogs app/
```

## 📱 Passo 3: Configurare Firma Codice

### 3.1 Apri il Progetto in Xcode

```bash
cd /path/to/siyuan-ios
open siyuan-ios.xcodeproj
```

### 3.2 Configura Team e Bundle ID

1. Seleziona il progetto `siyuan-ios` nella barra laterale
2. Seleziona il target `siyuan-ios`
3. Vai su **Signing & Capabilities**
4. **Team:** Seleziona il tuo team (Apple ID)
5. **Bundle Identifier:** Cambia in qualcosa di unico, es:
   ```
   com.TUONOME.siyuan-ios
   ```

### 3.3 Risolvi Errori di Firma

Se vedi errori come "Failed to create provisioning profile":

1. **Automatic Signing:** Assicurati che sia abilitato
2. **Team:** Seleziona il tuo Apple ID
3. **Bundle ID:** Deve essere unico (aggiungi il tuo nome)

## 🔨 Passo 4: Compilare l'App

### 4.1 Seleziona Destinazione

1. In alto a sinistra in Xcode
2. Clicca sul selettore di destinazione (accanto al pulsante Play)
3. Seleziona il tuo iPhone connesso

### 4.2 Trust del Dispositivo

Sul tuo iPhone:
1. Quando connetti al Mac, apparirà "Autorizza questo computer?"
2. Tap **Autorizza** e inserisci il codice del dispositivo

### 4.3 Compila e Installa

**Metodo 1: Da Xcode**
```
1. Clicca sul pulsante Play (▶️) o premi Cmd+R
2. Xcode compilerà e installerà automaticamente
3. Attendi il completamento (può richiedere 5-10 minuti la prima volta)
```

**Metodo 2: Da Terminale**
```bash
# Connetti iPhone e ottieni UDID
instruments -s devices

# Compila per dispositivo specifico
xcodebuild -project siyuan-ios.xcodeproj \
  -scheme siyuan-ios \
  -configuration Release \
  -destination 'platform=iOS,id=YOUR_DEVICE_UDID' \
  clean build
```

### 4.4 Possibili Errori e Soluzioni

#### Errore: "iosk.xcframework not found"
```
Soluzione: Segui il Passo 1 per ottenere il framework
```

#### Errore: "Signing for requires a development team"
```
Soluzione: Vai in Signing & Capabilities e seleziona il tuo Team
```

#### Errore: "Failed to register bundle identifier"
```
Soluzione: Cambia il Bundle ID in qualcosa di unico
```

#### Errore: "This device is not registered"
```
Soluzione (Account Gratuito):
- Xcode dovrebbe registrarlo automaticamente
- Attendi qualche secondo e riprova

Soluzione (Account Developer):
- Vai su developer.apple.com
- Aggiungi il dispositivo nella sezione Devices
```

## 📲 Passo 5: Autorizzare l'App sull'iPhone

Dopo l'installazione:

1. Vai su **Impostazioni** > **Generali** > **Gestione VPN e dispositivi**
2. Troverai il tuo Apple ID sotto "App per sviluppatori"
3. Tap sul tuo Apple ID
4. Tap **Autorizza [Apple ID]**
5. Conferma con **Autorizza**

## 🚀 Passo 6: Avviare l'App

1. Torna alla home screen
2. Cerca l'icona SiYuan
3. Tap per avviare l'app

### Prima Esecuzione

L'app:
- ✅ Avvia il kernel locale (127.0.0.1:6806)
- ✅ Carica l'interfaccia web
- ✅ Tutte le funzionalità pro sono già sbloccate
- ✅ Nessuna connessione esterna (layer Swift bloccato)

## 🔄 Reinstallazione Periodica (Account Gratuito)

Con account gratuito, l'app scade dopo **7 giorni**.

### Quando l'App Scade:

**Sintomi:**
- L'app non si apre
- Messaggio: "Non è possibile verificare l'app"

**Soluzione:**
1. Riconnetti iPhone al Mac
2. Apri Xcode
3. Clicca Play (▶️) per reinstallare
4. Altri 7 giorni di utilizzo

### Automatizzare (Opzionale):

**Opzione 1: Script di reinstallazione settimanale**
```bash
#!/bin/bash
# reinstall-siyuan.sh
cd /path/to/siyuan-ios
xcodebuild -project siyuan-ios.xcodeproj \
  -scheme siyuan-ios \
  -destination 'platform=iOS,name=iPhone di [NOME]' \
  clean build
```

**Opzione 2: Upgrade a Developer Account ($99/anno)**
- App valida per 1 anno
- No reinstallazioni frequenti

## 🎯 Alternative all'Installazione Diretta

### Opzione 1: TestFlight (Richiede Developer Account)

```
1. Archivio l'app in Xcode: Product → Archive
2. Upload su App Store Connect
3. Aggiungi tester in TestFlight
4. I tester installano via TestFlight app
5. App valida per 90 giorni (rinnovabile)
```

### Opzione 2: IPA Sideload (con AltStore)

```
1. Esporta IPA da Xcode
2. Installa AltStore sul Mac (https://altstore.io)
3. Installa AltStore sull'iPhone
4. Usa AltStore per caricare l'IPA
5. AltStore si occupa di rinnovare automaticamente ogni 7 giorni
```

### Opzione 3: Enterprise Certificate (Non Raccomandato)

⚠️ Richiede Enterprise Developer Account ($299/anno) e viola i termini se usato per distribuzione pubblica.

## 🧪 Verifica Privacy

Dopo l'installazione, verifica che le modifiche privacy funzionino:

### Test 1: Modalità Aereo
```
1. Abilita modalità aereo
2. Avvia SiYuan
3. ✅ Deve funzionare completamente
4. ✅ Tutte le funzionalità pro devono essere accessibili
```

### Test 2: Console Xcode
```
1. Tieni iPhone connesso
2. Apri Xcode → Window → Devices and Simulators
3. Seleziona il tuo iPhone → View Device Logs
4. Filtra per "SiYuan"
5. Cerca:
   ✅ "LoadProduct disabilitato - Modalità privacy attiva"
   ✅ "HandleTransactions disabilitato - Modalità privacy attiva"
   ❌ NON deve apparire connessioni a *.apple.com o altri domini
```

### Test 3: Network Monitor (Opzionale)
```
1. Installa Charles Proxy sul Mac
2. Configura iPhone per usare il proxy
3. Avvia SiYuan
4. Monitora traffico di rete
5. ✅ Dovresti vedere SOLO 127.0.0.1:6806
6. ❌ NON devono apparire connessioni esterne
```

## 🐛 Troubleshooting Comune

### L'app si blocca all'avvio

**Cause possibili:**
1. Framework Iosk mancante o incompatibile
2. Risorse app mancanti (appearance, guide, etc.)
3. Versione iOS troppo vecchia

**Soluzione:**
```
1. Controlla console Xcode per errori specifici
2. Verifica che tutte le risorse siano presenti
3. Verifica iOS >= 15.0
```

### L'app dice "Funzionalità non disponibile"

**Causa:** Le modifiche privacy potrebbero aver bloccato troppe cose

**Soluzione:**
```
1. Controlla console per errori JavaScript
2. Verifica che il kernel locale (127.0.0.1:6806) sia raggiungibile
3. Riavvia l'app
```

### Xcode non trova il mio iPhone

**Soluzioni:**
```
1. Scollega e ricollega il cavo
2. Sblocca iPhone e tap "Autorizza"
3. Riavvia Xcode
4. Prova un cavo diverso
5. In Xcode: Window → Devices and Simulators
   - Verifica che il dispositivo appaia
   - Se appare con warning, clicca "Pair" o "Trust"
```

### "Code signing identity not found"

**Soluzione:**
```
1. Xcode → Preferences → Accounts
2. Aggiungi il tuo Apple ID se non presente
3. Clicca Download Manual Profiles
4. Torna a Signing & Capabilities
5. Seleziona il team corretto
```

## 📊 Riepilogo Processo

```
1. ✅ Ottieni framework Iosk (da release ufficiale o compilato)
2. ✅ Copia risorse app (appearance, guide, stage)
3. ✅ Apri progetto in Xcode
4. ✅ Configura firma codice (Team + Bundle ID unico)
5. ✅ Connetti iPhone
6. ✅ Compila e installa (Play button)
7. ✅ Autorizza app su iPhone (Impostazioni)
8. ✅ Avvia e verifica funzionamento
9. ✅ Testa privacy (modalità aereo)
10. 🔄 Reinstalla ogni 7 giorni (account gratuito)
```

## 💡 Suggerimenti

### Per Sviluppo Continuo

1. **Usa Git Branch:** Le modifiche sono già su branch separato
2. **Backup Configurazione:** Salva il tuo Bundle ID e configurazioni
3. **Script di Build:** Crea script per automatizzare compilazione
4. **Documenta Modifiche:** Annota modifiche personali ulteriori

### Per Evitare Problemi

1. **Non aggiornare iOS durante sviluppo:** Potrebbe rompere compatibilità
2. **Non aggiornare Xcode senza verificare:** Nuove versioni possono avere bug
3. **Fai backup del progetto:** Prima di modifiche importanti
4. **Testa su modalità aereo:** Per verificare funzionamento offline

## 🔗 Risorse Utili

- **Documentazione Xcode:** https://developer.apple.com/xcode/
- **Guida Code Signing:** https://developer.apple.com/support/code-signing/
- **Forum Apple Developer:** https://developer.apple.com/forums/
- **AltStore (sideload):** https://altstore.io
- **Repository SiYuan:** https://github.com/siyuan-note/siyuan

## ❓ FAQ

**Q: Posso installare su più iPhone?**
A: Sì, con account gratuito fino a 3 dispositivi. Con Developer Account, illimitati.

**Q: L'app funziona su iPad?**
A: Sì, se il progetto è configurato per supportare iPad (verifica in Xcode → General → Deployment Info).

**Q: Posso distribuire ad amici?**
A: Con account gratuito NO. Con Developer Account SÌ tramite TestFlight o distribuzione AdHoc.

**Q: I dati dell'app vengono persi quando scade?**
A: NO, i dati rimangono. Solo l'app deve essere reinstallata.

**Q: Posso aggiornare l'app ufficiale senza perdere queste modifiche?**
A: NO, le modifiche sono locali. Reinstallare l'app ufficiale sovrascrive tutto.

## 👤 Autore della Guida

**Data:** 2025-11-15
**Branch:** `claude/improve-privacy-connections-01DZMUE7NcLaoPbdy5aJKfaV`
**Versione Guida:** 1.0

---

**Nota Legale:** Questa guida è per scopi educativi. Rispetta sempre i termini di servizio di Apple e SiYuan quando installi e usi software modificato.
