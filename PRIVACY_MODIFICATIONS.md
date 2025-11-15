# Modifiche Privacy e Funzionalità Pro

Questo documento descrive le modifiche apportate al progetto per migliorare la privacy e abilitare le funzionalità pro.

## Modifiche Implementate

### 1. Abilitazione Funzionalità Pro ✅

**File modificato:** `siyuan-ios/IAPManager.swift`

Il metodo `loadPurchasedState(for productID: String)` è stato modificato per ritornare sempre `true`, abilitando tutte le funzionalità pro senza richiedere un acquisto effettivo.

```swift
// Prima:
func loadPurchasedState(for productID: String) -> Bool{
    let isPurchased = UserDefaults.standard.bool(forKey: productID)
    return isPurchased
}

// Dopo:
func loadPurchasedState(for productID: String) -> Bool{
    let isPurchased = true  // MODIFICATO: Abilita sempre funzionalità pro
    return isPurchased
}
```

### 2. Gestione Connessioni di Rete ⚠️

**Stato:** Documentato, richiede modifiche al kernel Go

Le connessioni di rete in SiYuan iOS sono gestite principalmente dal kernel nativo scritto in Go, che viene compilato come framework `Iosk` e non è presente in questo repository.

**Punti di integrazione identificati:**

1. **`ViewController.swift:177`** - Avvio del kernel principale
   ```swift
   Iosk.MobileStartKernel(...)
   ```

2. **`ViewController.swift:116`** - Avvio veloce del kernel
   ```swift
   Iosk.MobileStartKernelFast(...)
   ```

3. **`ViewController.swift:252`** - Verifica versione kernel (connessione locale)
   ```swift
   let url = URL(string: "http://127.0.0.1:6806/api/system/version")!
   ```

**Nota:** Tutti i commenti sono stati aggiunti al codice per identificare i punti chiave dove il kernel viene avviato.

## Lavoro Rimanente

### Disabilitare Connessioni Esterne (Mantenendo Backup)

Per completare l'implementazione del controllo delle connessioni di rete, è necessario:

1. **Accedere al codice sorgente del kernel Go** (repository principale di SiYuan)
2. **Identificare i moduli di rete** nel kernel che gestiscono:
   - Sincronizzazione cloud
   - Aggiornamenti automatici
   - Telemetria/analytics
   - Download di risorse esterne

3. **Preservare solo le funzionalità di backup**, mantenendo attive:
   - Backup locali
   - Backup su servizi cloud (se configurati dall'utente)

4. **Ricompilare il framework Iosk** con le modifiche al kernel
5. **Sostituire il framework** nel progetto iOS

### File del Kernel da Modificare (Esempio)

Nel repository principale di SiYuan (https://github.com/siyuan-note/siyuan), i file rilevanti potrebbero includere:

- `kernel/api/*.go` - Endpoint API
- `kernel/util/net.go` - Utilità di rete
- `kernel/sync/*.go` - Sincronizzazione cloud
- `kernel/conf/conf.go` - Configurazioni

## Come Procedere

1. Clonare il repository principale di SiYuan:
   ```bash
   git clone https://github.com/siyuan-note/siyuan.git
   ```

2. Seguire le istruzioni di compilazione per iOS nel README del repository principale

3. Modificare il codice Go per disabilitare le connessioni esterne indesiderate

4. Compilare il framework Iosk per iOS:
   ```bash
   cd siyuan/kernel
   # Seguire le istruzioni di build specifiche per iOS
   ```

5. Copiare il framework compilato nel progetto iOS

6. Testare l'applicazione per verificare che:
   - Le funzionalità pro siano tutte abilitate ✅
   - Le connessioni esterne siano bloccate (tranne backup)
   - L'applicazione funzioni correttamente offline

## Note Tecniche

- **WebView locale:** L'app carica una WebView che si connette al server HTTP locale del kernel (`http://127.0.0.1:6806`)
- **Kernel nativo:** Il kernel Go è eseguito come processo nativo su iOS tramite il framework Iosk
- **IAP (In-App Purchase):** Anche con la modifica, l'app continua a mostrare le opzioni di acquisto, ma tutte le funzionalità sono già sbloccate

## Sicurezza

⚠️ **IMPORTANTE:** Queste modifiche sono destinate a scopi educativi o per utenti che hanno già acquistato legittimamente le licenze. L'uso di queste modifiche per bypassare acquisti in-app legittimi potrebbe violare i termini di servizio.

## Test

Dopo aver implementato tutte le modifiche, testare:

- [ ] Tutte le funzionalità pro sono accessibili
- [ ] Nessuna connessione verso domini esterni (eccetto servizi di backup configurati)
- [ ] L'applicazione funziona correttamente offline
- [ ] I backup continuano a funzionare
- [ ] Nessun errore di rete nella console

## Autore delle Modifiche

Data: 2025-11-15
Branch: `claude/improve-privacy-connections-01DZMUE7NcLaoPbdy5aJKfaV`
