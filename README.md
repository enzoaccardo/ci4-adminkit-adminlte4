# ci4-adminkit-adminlte4

La pelle grafica per ci4-adminkit.

Il kit lascia il markup senza stile (classi di Bootstrap ma nessun CSS). Questo
pacchetto ci mette sopra AdminLTE 4 con Bootstrap 5, i layout del pannello e le
pagine dell'area di login già impaginate.

## Cosa trovi dentro

* Il layout del pannello: header, sidebar con menu ad albero, footer, più i
  contenitori per i toast e per la modale di conferma.
* Le pagine non autenticate già pronte: login, recupero e reset della password,
  e i vari passaggi dell'autenticazione a due fattori.
* Gli asset già compilati (`app.css`, `app.js`) sotto `assets/dist`, così per
  usarlo non ti serve Node. Se poi vuoi rimetterci mano ci sono i sorgenti Vite.

Il collegamento con il kit passa da due controller base, `ThemedAdminController`
e `ThemedFrontController`, che infilano le viste del tema nella catena di Smarty.
Il tuo `AdminController` estende il primo e, dentro `prepareView()`, gli passa il
menu, l'avatar e i titoli di pagina.

## Installazione

```
composer require enzoaccardo/ci4-adminkit-adminlte4
php spark adminkit:publish
php spark adminlte4:publish
```

Aggiungi `--config` al secondo comando se vuoi copiarti in locale la config del
branding. Il kit viene tirato dentro come dipendenza.

## Branding e CSS

Nome, logo e testo del footer stanno in `Config\AdminLTE`. Se devi ricompilare
il CSS del tema, dentro il pacchetto trovi `package.json` e `vite.config.js`:
`npm install` e poi `npm run build`.

## Licenza

MIT. Vedi [LICENSE](LICENSE).
