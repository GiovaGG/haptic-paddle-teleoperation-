# Come pubblicare questo progetto su GitHub

## Metodo semplice (senza terminale)

1. Accedi a [github.com](https://github.com) e crea un **New repository**.
2. Nome consigliato: `haptic-paddle-teleoperation`.
3. Seleziona **Public** solo se sei d'accordo a rendere pubblici documenti e sorgenti contenuti nella cartella. Per il controllo iniziale puoi selezionare **Private**.
4. Non attivare la creazione automatica del README: il pacchetto contiene già un README.
5. Scarica ed **estrai** il file ZIP fornito in chat.
6. Nel repository vuoto scegli **uploading an existing file** / **Add file → Upload files** e trascina **il contenuto della cartella estratta**, preservando le sottocartelle; non caricare il file ZIP come unico file.
7. Conferma con **Commit changes**.
8. Quando hai verificato che `README.md` venga visualizzato correttamente, copia l'URL del repository nel CV.

## Metodo con Git (da computer)

Dalla cartella estratta:

```bash
git init
git branch -M main
git add .
git commit -m "Document haptic teleoperation thesis project"
git remote add origin https://github.com/TUO-USERNAME/haptic-paddle-teleoperation.git
git push -u origin main
```

Prima crea un repository **vuoto** su GitHub e sostituisci `TUO-USERNAME`. Per usare Git da terminale servono Git installato e un'autenticazione GitHub valida. Se Git ti richiede user.name/user.email, configuralo sul tuo computer.

## Prima di renderlo pubblico

- [x] Sono inclusi tre video dimostrativi del prototipo inviati dall’autore, oltre a miniature estratte dai video. I video pubblicabili sono stati convertiti senza audio e senza metadati del telefono. Verifica che siano adatti alla diffusione pubblica.
- [x] Sono incluse schermate **reali del modello Simulink**, estratte dalle figure della tesi: vedi `docs/simulink-screenshots.md`. Sono immagini, non file `.slx`.
- [ ] Recupera il **modello Simulink `.slx` originale** e, dopo averlo verificato, caricalo in `software/simulink/`.
- [ ] Controlla che il codice standalone funzioni sul tuo attuale cablaggio: test **separati**, non il sistema completo.
- [ ] Controlla diritti e attribuzioni per CAD e materiali ripresi dal progetto di Auralius Manurung.
- [ ] Scegli se e con quale licenza concedere il riuso del tuo codice: al momento il repository **non ha una licenza di riuso**.
- [ ] Non caricare dati personali, matricola, indirizzi o altri documenti che non vuoi esporre. Controlla anche sfondi e mani presenti nei filmati prima di rendere il repository pubblico.
- [ ] Non inserire nel CV il link prima che sia pubblico e funzionante.

## Nota sull'autenticità

Gli script `.m` sono estratti/adattati dalle funzioni documentate nella tesi, mentre gli sketch Arduino sono test hardware standalone ricostruiti dall'appendice. Non sono stati sostituiti al modello Simulink effettivamente usato per l'integrazione finale. Pubblica il `.slx` reale quando disponibile.
