# Come Installare l'App SENZA Scadenza (Permanente)

Questa guida spiega come installare SiYuan iOS in modo **permanente** o **semi-permanente**, evitando la reinstallazione ogni 7 giorni.

## 📊 Confronto Soluzioni

| Soluzione | Costo | Validità | Difficoltà | Raccomandato |
|-----------|-------|----------|------------|--------------|
| **Developer Account** | $99/anno | 1 anno | ⭐ Facile | ✅ SÌ |
| **AltStore Auto-Refresh** | Gratis | Infinito* | ⭐⭐ Medio | ✅ SÌ |
| **Sideloadly Auto-Refresh** | Gratis | Infinito* | ⭐⭐ Medio | ⚠️ OK |
| **TrollStore (iOS 14-16.6.1)** | Gratis | Permanente | ⭐⭐⭐ Difficile | ✅ SÌ (se compatibile) |
| **Jailbreak + AppSync** | Gratis | Permanente | ⭐⭐⭐⭐ Molto difficile | ⚠️ Solo esperti |

*Richiede refresh periodico ma automatico

---

## ✅ Soluzione 1: Apple Developer Account (CONSIGLIATA)

### Pro e Contro

**✅ Vantaggi:**
- App valida per **1 anno intero**
- Soluzione ufficiale Apple
- Nessun software aggiuntivo necessario
- Installazione su dispositivi illimitati
- Supporto per TestFlight (beta testing)
- Possibilità di pubblicare su App Store

**❌ Svantaggi:**
- Costo: **$99 USD/anno** (~€95/anno)
- Richiede rinnovo annuale

### Come Funziona

1. Ti iscrivi al programma Developer
2. Firmi l'app con il certificato Developer (non gratuito)
3. L'app dura **365 giorni** prima di scadere
4. Rinnovi il Developer Account ogni anno per mantenere l'app funzionante

### Procedura di Registrazione

```
1. Vai su: https://developer.apple.com/programs/enroll/
2. Clicca "Start Your Enrollment"
3. Accedi con il tuo Apple ID
4. Compila i dati richiesti
5. Paga $99 USD (carta di credito/debito)
6. Attendi approvazione (di solito 24-48 ore)
7. Ricevi conferma via email
```

### Dopo la Registrazione

```
1. Apri Xcode
2. Xcode → Preferences → Accounts
3. Aggiungi il tuo Apple ID (ora Developer)
4. Download Manual Profiles
5. Nel progetto: Signing & Capabilities → Seleziona il tuo Team Developer
6. Compila e installa → App valida 1 anno!
```

### Quando Rinnovare

- 30 giorni prima della scadenza, Apple ti invierà un reminder
- Rinnovo automatico se hai impostato pagamento ricorrente
- Se non rinnovi, l'app smette di funzionare dopo 1 anno

### Costo vs Beneficio

```
Costo: $99/anno ÷ 12 mesi = $8.25/mese (~€8/mese)

Benefici:
- Nessuna reinstallazione per 1 anno
- Installazione su tutti i tuoi dispositivi
- Possibilità di condividere con famiglia/amici via TestFlight
- Supporto ufficiale Apple
```

**💡 Questa è la soluzione PIÙ SEMPLICE e AFFIDABILE per uso personale/familiare.**

---

## ✅ Soluzione 2: AltStore con Auto-Refresh (GRATUITA)

### Cos'è AltStore

AltStore è un'applicazione che **rinnova automaticamente** le app sideloadate ogni 7 giorni, senza intervento manuale.

### Pro e Contro

**✅ Vantaggi:**
- Completamente **GRATUITO**
- Rinnovo **automatico** (non devi fare nulla)
- Non richiede jailbreak
- Supporta iOS 12.2+
- Open source e sicuro

**❌ Svantaggi:**
- Richiede Mac/PC con AltServer in esecuzione sulla stessa rete Wi-Fi
- Il Mac/PC deve essere acceso quando l'app sta per scadere
- Limitato a 3 app attive contemporaneamente (account gratuito)
- Richiede configurazione iniziale

### Requisiti

- iPhone con iOS 12.2 o successivo
- Mac (macOS 10.14.4+) o PC Windows (con iTunes)
- Entrambi sulla **stessa rete Wi-Fi**
- iCloud account abilitato su iPhone

### Installazione AltStore (Passo-Passo)

#### Passo 1: Installare AltServer sul Mac/PC

**Su Mac:**
```bash
# 1. Scarica AltServer
# Vai su: https://altstore.io
# Clicca "Download AltServer for Mac"

# 2. Apri il file .dmg scaricato
# 3. Trascina "AltServer" nella cartella Applicazioni
# 4. Apri AltServer dalla cartella Applicazioni
# 5. L'icona AltServer apparirà nella barra dei menu (in alto)
```

**Su Windows:**
```
1. Scarica AltServer per Windows da: https://altstore.io
2. Installa iTunes da Microsoft Store (non la versione desktop)
3. Installa iCloud per Windows
4. Installa AltServer.exe
5. Esegui AltServer (apparirà nella system tray)
```

#### Passo 2: Installare AltStore sull'iPhone

```
1. Connetti iPhone al Mac/PC via cavo USB
2. Sblocca iPhone e autorizza il computer ("Autorizza questo computer?")
3. Sul Mac: Clicca icona AltServer nella barra menu
   Su Windows: Clicca icona AltServer nella system tray
4. Seleziona: Install AltStore → [Nome del tuo iPhone]
5. Inserisci Apple ID e password quando richiesto
   (⚠️ USA UN APPLE ID SECONDARIO, non quello principale per sicurezza)
6. Attendi l'installazione (1-2 minuti)
7. Su iPhone: Impostazioni → Generali → Gestione VPN e dispositivi
8. Autorizza il profilo del tuo Apple ID
9. Troverai AltStore sulla home screen
```

#### Passo 3: Abilitare Background Refresh

**Su iPhone:**
```
1. Impostazioni → Generali → Aggiornamento app in background
2. Abilita "Aggiornamento app in background" (ON)
3. Scorri e trova "AltStore" → Abilita (ON)
```

**Su Mac/PC:**
```
Mac:
  Sistema → Preferenze → Generali
  Deseleziona "Consenti spegnimento automatico quando il display è spento"
  (Così il Mac rimane acceso)

Windows:
  Impostazioni → Sistema → Alimentazione
  Imposta "Quando è collegato, spegni dopo" → Mai
```

#### Passo 4: Installare SiYuan con AltStore

**Metodo A: Compila IPA con Xcode**

```bash
# 1. Apri il progetto in Xcode
open siyuan-ios.xcodeproj

# 2. Seleziona: Product → Archive
# 3. Quando l'archivio è pronto, clicca "Distribute App"
# 4. Seleziona "Custom" → Next
# 5. Seleziona "Development" → Next
# 6. Seleziona "Automatically manage signing" → Next
# 7. Seleziona "Export" e scegli dove salvare
# 8. Troverai il file .ipa nella cartella esportata
```

**Metodo B: Scarica IPA pre-compilato (se disponibile)**

```bash
# Se hai già un .ipa compilato, usalo direttamente
```

**Installazione tramite AltStore:**

```
1. Trasferisci il file .ipa sul tuo iPhone
   (via AirDrop, iCloud Drive, o altra app)

2. Apri AltStore sull'iPhone

3. Tap sulla scheda "My Apps"

4. Tap sul pulsante "+" in alto a sinistra

5. Seleziona il file SiYuan.ipa

6. AltStore installerà l'app

7. L'app SiYuan apparirà sulla home screen
```

#### Passo 5: Configurare Auto-Refresh

**Importante:** Per il rinnovo automatico, assicurati che:

1. **AltServer sia in esecuzione sul Mac/PC**
   - Mac: Icona nella barra menu
   - Windows: Icona nella system tray

2. **iPhone e Mac/PC siano sulla stessa rete Wi-Fi**
   - Verifica che siano sulla stessa rete
   - Il firewall non deve bloccare AltServer

3. **AltStore abbia Background Refresh abilitato** (vedi Passo 3)

### Come Funziona l'Auto-Refresh

```
Giorno 1: Installi l'app con AltStore
Giorno 2-6: Usi normalmente l'app
Giorno 7: Prima della scadenza (di solito giorno 6)
         → AltStore si connette ad AltServer sul Mac/PC
         → Rinnova automaticamente il certificato
         → App valida per altri 7 giorni
Giorno 8-13: Continui a usare l'app
Giorno 14: AltStore rinnova di nuovo automaticamente
... e così via all'infinito
```

**⚠️ Importante:**
- Il Mac/PC deve essere **acceso e sulla rete Wi-Fi** quando AltStore fa il refresh
- Se il Mac è spento per più di 7 giorni, l'app scade e va reinstallata manualmente
- AltStore prova a rinnovare quando l'app ha 3-4 giorni di validità rimanenti

### Monitoraggio

Puoi controllare quando scade l'app:

```
1. Apri AltStore
2. Vai su "My Apps"
3. Vedrai "Expires in X days" sotto ogni app
4. Tap "Refresh All" per rinnovare manualmente (se necessario)
```

### Troubleshooting AltStore

**Problema: "Could not find AltServer"**
```
Soluzione:
1. Assicurati che AltServer sia in esecuzione sul Mac/PC
2. Verifica stessa rete Wi-Fi
3. Disabilita temporaneamente firewall sul Mac/PC
4. Riavvia AltServer
```

**Problema: "Maximum number of apps"**
```
Soluzione:
Con account gratuito, puoi avere max 3 app contemporaneamente.
1. Apri AltStore → My Apps
2. Rimuovi un'app che non usi
3. Reinstalla SiYuan
```

**Problema: App scaduta perché Mac era spento**
```
Soluzione:
1. Accendi il Mac e avvia AltServer
2. Assicurati iPhone e Mac siano sulla stessa Wi-Fi
3. Apri AltStore su iPhone
4. Tap "Refresh All"
5. L'app verrà rinnovata
```

---

## ✅ Soluzione 3: Sideloadly (Alternativa ad AltStore)

### Cos'è Sideloadly

Simile ad AltStore, permette di caricare IPA e rinnovarle automaticamente.

### Installazione Rapida

```
1. Scarica Sideloadly da: https://sideloadly.io
2. Installa su Mac/Windows
3. Connetti iPhone via USB
4. Trascina il file .ipa in Sideloadly
5. Inserisci Apple ID
6. Clicca "Start"
7. Abilita "Enable automatic refresh" nelle impostazioni
```

### Pro e Contro vs AltStore

**Sideloadly:**
- ✅ Interfaccia più semplice
- ✅ Più opzioni di personalizzazione
- ❌ Meno affidabile di AltStore per auto-refresh
- ❌ Non open source

**Raccomandazione:** Usa **AltStore** se possibile, Sideloadly come backup.

---

## ✅ Soluzione 4: TrollStore (iOS 14.0 - 16.6.1)

### Cos'è TrollStore

TrollStore sfrutta una vulnerabilità iOS per installare app **permanentemente** senza certificati.

### Compatibilità

**✅ Funziona su:**
- iOS 14.0 - 14.8.1
- iOS 15.0 - 15.7.1
- iOS 16.0 - 16.6.1

**❌ NON funziona su:**
- iOS 17.x e successivi
- iOS 15.8 e superiori
- iOS 16.7 e superiori

**Controlla la tua versione:**
```
iPhone: Impostazioni → Generali → Info → Versione Software
```

### Pro e Contro

**✅ Vantaggi:**
- **Installazione PERMANENTE** (non scade mai!)
- Nessun refresh necessario
- Nessun Mac/PC necessario dopo setup iniziale
- Non richiede jailbreak
- Gratis

**❌ Svantaggi:**
- Funziona solo su iOS specifiche (vedi sopra)
- Apple potrebbe patchare con aggiornamenti iOS
- Installazione più complessa

### Installazione TrollStore

**⚠️ ATTENZIONE:** La procedura varia in base alla versione iOS. Segui la guida ufficiale:

```
1. Vai su: https://github.com/opa334/TrollStore
2. Scorri a "Installation"
3. Trova la tua versione iOS nella tabella
4. Segui il metodo indicato per la tua versione
```

### Installare SiYuan con TrollStore

```
1. Compila l'IPA di SiYuan con Xcode (vedi sopra)

2. Trasferisci l'IPA su iPhone
   (AirDrop, Files app, iCloud Drive, etc.)

3. Apri l'app "Files" su iPhone

4. Trova il file SiYuan.ipa

5. Tap sul file → Condividi → TrollStore

6. TrollStore installerà l'app PERMANENTEMENTE

7. L'app NON scadrà mai!
```

### Verifica Installazione Permanente

```
1. Apri TrollStore
2. Vai su "Apps"
3. Troverai SiYuan elencata
4. NON ci sarà nessuna data di scadenza
```

### Note Importanti

- ⚠️ Non aggiornare iOS oltre le versioni compatibili
- ⚠️ Se aggiorni iOS a versione incompatibile, TrollStore smetterà di funzionare
- ✅ Le app installate rimarranno funzionanti anche se TrollStore smette di funzionare
- ✅ Puoi disinstallare TrollStore dopo aver installato le app

**💡 Se la tua versione iOS è compatibile, questa è la MIGLIORE soluzione (permanente e gratuita)!**

---

## ⚠️ Soluzione 5: Jailbreak + AppSync (Solo Esperti)

### Cos'è

Il jailbreak permette di installare app senza certificati Apple.

### Pro e Contro

**✅ Vantaggi:**
- Installazione permanente
- Controllo completo del dispositivo
- Nessuna scadenza

**❌ Svantaggi:**
- ⚠️ Invalida garanzia Apple
- ⚠️ Rischi di sicurezza
- ⚠️ Impossibile aggiornare iOS normalmente
- ⚠️ Alcune app (banking) potrebbero non funzionare
- ⚠️ Processo complesso e rischioso

### Procedura (Solo se Esperto)

```
1. Verifica se esiste jailbreak per la tua versione iOS
   Sito: https://ios.cfw.guide

2. Esegui il jailbreak (varia per versione iOS)

3. Installa Cydia o altro package manager

4. Aggiungi repository:
   https://cydia.akemi.ai

5. Installa "AppSync Unified"

6. Installa l'IPA con:
   - Filza File Manager
   - ReProvision Reborn
   - AltStore (ma non serve più auto-refresh)

7. L'app sarà installata permanentemente
```

**⚠️ NON RACCOMANDATO** se non sei un utente esperto di jailbreak.

---

## 🎯 Quale Soluzione Scegliere?

### Flowchart Decisionale

```
Hai iOS 14.0-16.6.1?
├─ SÌ → Usa TrollStore (permanente, gratis) ✅
└─ NO → Continua

Puoi spendere $99/anno?
├─ SÌ → Usa Developer Account (più semplice) ✅
└─ NO → Continua

Hai un Mac/PC che può rimanere acceso?
├─ SÌ → Usa AltStore Auto-Refresh (gratis) ✅
└─ NO → Continua

Sei esperto di jailbreak?
├─ SÌ → Jailbreak + AppSync (se disponibile) ⚠️
└─ NO → Developer Account è l'unica opzione pratica
```

### Raccomandazioni per Scenario

**Scenario 1: Uso Personale, Budget Disponibile**
→ **Apple Developer Account** ($99/anno)
- Più semplice e affidabile
- App valida 1 anno
- Nessuna complicazione

**Scenario 2: Uso Personale, Gratis, iOS Compatibile**
→ **TrollStore**
- Permanente
- Gratis
- Nessun refresh necessario

**Scenario 3: Uso Personale, Gratis, Mac Sempre Acceso**
→ **AltStore Auto-Refresh**
- Gratis
- Automatico
- Richiede Mac/PC acceso

**Scenario 4: Uso Familiare/Condiviso**
→ **Developer Account + TestFlight**
- Distribuzione facile
- Gestione centralizzata
- 100 tester disponibili

**Scenario 5: Sviluppatore/Sperimentatore**
→ **TrollStore** (se compatibile) o **AltStore**
- Flessibilità
- Controllo completo
- Gratis

---

## 📋 Confronto Costi Totali (3 Anni)

| Soluzione | Anno 1 | Anno 2 | Anno 3 | Totale 3 Anni | Tempo Setup | Manutenzione |
|-----------|--------|--------|--------|---------------|-------------|--------------|
| Developer Account | $99 | $99 | $99 | **$297** | 30 min | 10 min/anno |
| AltStore | $0 | $0 | $0 | **$0** | 1 ora | 0 (automatico) |
| TrollStore | $0 | $0 | $0 | **$0** | 2 ore | 0 (permanente) |
| Jailbreak | $0 | $0 | $0 | **$0** | 4+ ore | Variabile |

**Costo opportunità (tempo):**
- Developer Account: ~1 ora totale in 3 anni
- AltStore: ~1 ora setup + 0 manutenzione = 1 ora
- TrollStore: ~2 ore setup + 0 manutenzione = 2 ore
- Jailbreak: ~4-8 ore (variabile, alto rischio)

**Valore del tempo @ €20/ora:**
- Developer Account: €20 + $297 = ~€320 totale
- AltStore: €20 totale
- TrollStore: €40 totale

**🏆 Vincitore rapporto qualità/prezzo:**
- **TrollStore** se compatibile (gratis, permanente)
- **AltStore** se non compatibile con TrollStore (gratis, automatico)
- **Developer Account** se vuoi soluzione ufficiale senza pensieri

---

## 🛠️ Setup Consigliato (La Mia Raccomandazione)

### Piano A: iOS 14-16.6.1 (Migliore)

```
1. Controlla versione iOS
2. Se compatibile → Installa TrollStore
3. Installa SiYuan tramite TrollStore
4. ✅ FATTO! App permanente, zero manutenzione
```

**Tempo totale:** ~2 ore
**Costo:** €0
**Manutenzione:** Nessuna

### Piano B: iOS Non Compatibile con TrollStore

```
1. Installa AltStore sul Mac
2. Installa AltStore su iPhone
3. Configura auto-refresh
4. Installa SiYuan tramite AltStore
5. Assicurati Mac rimanga acceso sulla rete
6. ✅ FATTO! Rinnovo automatico ogni 7 giorni
```

**Tempo totale:** ~1 ora
**Costo:** €0
**Manutenzione:** Mac deve essere acceso

### Piano C: Soluzione Premium (Più Semplice)

```
1. Iscriviti a Developer Account ($99)
2. Attendi approvazione (24-48h)
3. Compila in Xcode con certificato Developer
4. Installa su iPhone
5. ✅ FATTO! App valida 1 anno
```

**Tempo totale:** ~30 minuti
**Costo:** $99/anno
**Manutenzione:** Rinnovo annuale

---

## 💡 Domande Frequenti

**Q: AltStore funziona se il Mac è in sleep mode?**
A: Dipende. Se il Mac supporta "Wake on LAN" e rimane connesso alla rete, potrebbe funzionare. Altrimenti, imposta il Mac per non andare mai in sleep quando collegato.

**Q: Posso usare AltStore con un Raspberry Pi invece del Mac?**
A: No ufficialmente, ma esistono progetti community come "AltServer-Linux" (sperimentale).

**Q: Se uso TrollStore e aggiorno iOS, cosa succede?**
A: Le app installate continuano a funzionare, ma non potrai installarne di nuove. TrollStore stesso potrebbe smettere di funzionare.

**Q: Posso passare da AltStore a Developer Account?**
A: Sì, semplicemente ricompila con certificato Developer e reinstalla.

**Q: Quante app posso avere con AltStore account gratuito?**
A: Massimo 3 app simultaneamente.

**Q: Con Developer Account, quanti dispositivi posso usare?**
A: Fino a 100 dispositivi per account.

**Q: AltStore funziona con VPN?**
A: Sì, ma assicurati che iPhone e Mac siano sulla stessa rete locale.

**Q: Posso usare AltStore in viaggio?**
A: Sì, se hai accesso a un Mac sulla stessa rete. Altrimenti, l'app potrebbe scadere.

**Q: TrollStore è sicuro?**
A: Sì, è open source e ampiamente usato. Non è un jailbreak e non modifica il sistema permanentemente.

---

## 📚 Risorse Utili

**AltStore:**
- Sito ufficiale: https://altstore.io
- FAQ: https://altstore.io/faq
- Reddit: https://reddit.com/r/AltStore

**TrollStore:**
- Repository GitHub: https://github.com/opa334/TrollStore
- Guida installazione: https://ios.cfw.guide/installing-trollstore

**Apple Developer:**
- Enrollment: https://developer.apple.com/programs/enroll
- Documentazione: https://developer.apple.com/documentation

**Sideloadly:**
- Sito: https://sideloadly.io

---

## ✅ Conclusione

**Per avere SiYuan iOS senza scadenza:**

1. **MIGLIORE (se compatibile):** TrollStore → Permanente, gratis
2. **OTTIMA (se hai Mac):** AltStore → Auto-refresh, gratis
3. **SEMPLICE (se hai budget):** Developer Account → 1 anno, $99
4. **SOLO ESPERTI:** Jailbreak → Permanente ma rischioso

**La mia raccomandazione personale:**
- Prova **TrollStore** se la tua iOS è compatibile
- Altrimenti usa **AltStore** se hai un Mac che può rimanere acceso
- Se nessuna delle due funziona per te, considera **Developer Account** come investimento nella comodità

Qualunque soluzione scegli, avrai SiYuan con tutte le modifiche privacy implementate funzionante in modo permanente! 🎉

---

**Autore:** Claude Assistant
**Data:** 2025-11-15
**Branch:** `claude/improve-privacy-connections-01DZMUE7NcLaoPbdy5aJKfaV`
**Versione Guida:** 1.0
