# ⚠️ IMPORTANTE: Framework Mancante

## Problema

Questo progetto **NON può essere compilato** direttamente perché manca il file:

```
../siyuan/kernel/ios/iosk.xcframework
```

Questo è il kernel Go di SiYuan compilato per iOS, **essenziale** per il funzionamento dell'app.

## Soluzione Rapida

### Opzione 1: Scarica Framework Pre-compilato (Raccomandato)

```bash
# 1. Scarica l'ultima release ufficiale di SiYuan iOS
# https://github.com/siyuan-note/siyuan/releases

# 2. Scarica il file .ipa

# 3. Estrai il framework
unzip SiYuan-*.ipa -d extracted
mkdir -p ../siyuan/kernel/ios
cp -r extracted/Payload/SiYuan.app/Frameworks/iosk.xcframework ../siyuan/kernel/ios/

# 4. Ora puoi compilare con Xcode
```

### Opzione 2: Compila il Kernel da Zero

```bash
# Clona il repository principale
git clone https://github.com/siyuan-note/siyuan.git

# Segui le istruzioni di build per iOS nel repository principale
# Il framework compilato andrà in: siyuan/kernel/ios/iosk.xcframework
```

## Guida Completa

Per istruzioni dettagliate su:
- Come ottenere il framework
- Come configurare Xcode
- Come firmare e installare l'app
- Troubleshooting

👉 **Leggi:** [INSTALLATION_GUIDE.md](./INSTALLATION_GUIDE.md)

## Requisiti per Compilare

- ✅ macOS (non funziona su Windows/Linux)
- ✅ Xcode 14.0+
- ✅ iPhone con iOS 15.0+
- ✅ Framework `iosk.xcframework`
- ✅ Account Apple (anche gratuito va bene)

## Modifiche Privacy in Questo Branch

Questo branch contiene modifiche per:
- ✅ Funzionalità pro sempre abilitate
- ✅ StoreKit completamente disabilitato (no connessioni App Store)
- ✅ WKWebView bloccata per URL esterni
- ✅ Funzionamento completamente offline (layer Swift)

Dettagli: [PRIVACY_MODIFICATIONS.md](./PRIVACY_MODIFICATIONS.md)

## Quick Start (Se hai già il framework)

```bash
# 1. Assicurati che esista: ../siyuan/kernel/ios/iosk.xcframework

# 2. Apri Xcode
open siyuan-ios.xcodeproj

# 3. Seleziona il tuo Team in Signing & Capabilities

# 4. Cambia Bundle ID in qualcosa di unico:
#    com.TUONOME.siyuan-ios

# 5. Connetti iPhone e clicca Play ▶️
```

## 🚀 Installazione SENZA Scadenza

⚠️ Con account Apple gratuito, l'app scade ogni **7 giorni** e va reinstallata.

### 📖 Vuoi evitare la reinstallazione ogni 7 giorni?

👉 **[LEGGI LA GUIDA COMPLETA: INSTALLAZIONE_PERMANENTE.md](./INSTALLAZIONE_PERMANENTE.md)**

**Soluzioni disponibili:**

| Soluzione | Costo | Validità | Difficoltà |
|-----------|-------|----------|------------|
| **TrollStore** | Gratis | Permanente ✅ | Media |
| **AltStore Auto-Refresh** | Gratis | Infinito* | Media |
| **Developer Account** | $99/anno | 1 anno | Facile ✅ |

*Auto-refresh automatico, richiede Mac acceso

**💡 Raccomandazione:**
- iOS 14-16.6.1? → **TrollStore** (permanente, gratis)
- Hai Mac sempre acceso? → **AltStore** (gratis, automatico)
- Vuoi semplicità? → **Developer Account** ($99/anno)
