# ci4-adminkit-adminlte4

Tema **AdminLTE 4** (Bootstrap 5) per [`enzoaccardo/ci4-adminkit`](../ci4-adminkit). Fornisce ciò che il kit di infrastruttura non impone: il **layout grafico** del pannello e delle pagine di autenticazione.

- **Layout pannello admin**: `layout/main.tpl` + `header` / `sidebar` / `footer`, toast container e modal di conferma. Menu ad albero via `nav_menu` (dal kit), branding da config.
- **Pagine front auth** stilizzate: login, recupero/reset password, MFA (verify / setup / recover / recovery-codes).
- **Asset**: `app.css` / `app.js` (AdminLTE 4 + Bootstrap 5) **già compilati** in `assets/dist/` + `confirm-toast.js`. Comando `spark adminlte4:publish` per copiarli in `public/`. Nessun Node richiesto sul consumer; le sorgenti Vite (`resources/`) ci sono per chi vuole ricompilare.
- **Controller base**: `ThemedAdminController` (pannello) e `ThemedFrontController` (auth) — estendono/affiancano il kit e agganciano le viste del tema alla catena Smarty.

Restano all'app: autenticazione/RBAC, menu (dati), migrazioni, rotte.

## Installazione (dev, path repository)
```jsonc
// composer.json dell'app — servono ENTRAMBI i pacchetti
"repositories": [
  { "type": "path", "url": "../ci4-adminkit" },
  { "type": "path", "url": "../ci4-adminkit-adminlte4" }
]
```
```bash
composer require enzoaccardo/ci4-adminkit-adminlte4:@dev
php spark adminkit:publish       # asset del kit (widget/vendor)
php spark adminlte4:publish       # asset del tema (AdminLTE/Bootstrap)
php spark adminlte4:publish --config   # opzionale: config branding
```
(In alternativa al path repo: `type: vcs` con l'URL del repo git, oppure Packagist.)

## Uso
**Pannello** — il controller base dell'app estende `ThemedAdminController` e, sovrascrivendo `prepareView()` (con `parent::prepareView()`), aggiunge menu (`$menuTree`), avatar (`$userAvatarUrl`), titoli:
```php
class AdminController extends \AdminKit\AdminLTE\Controllers\ThemedAdminController
{
    protected function prepareView(): void
    {
        parent::prepareView();
        $this->assign('menuTree', /* albero di oggetti {label,icon,path,children} */);
        $this->assign('userAvatarUrl', /* ... */);
    }
}
```
Le viste di pagina fanno `{extends file='layout/main.tpl'}` e riempiono `{block name='content'}`.

**Auth** — i controller front estendono `ThemedFrontController` e renderizzano `login` / `mfa-verify` / ecc., assegnando `$success`/`$error`.

## Branding
`php spark adminlte4:publish --config` crea `app/Config/AdminLTE.php`: `brand`, `titleSuffix`, `footerText`, `logoUrl`, `useCdn` (font/icone/overlayscrollbars da CDN — metti a `false` per self-hosting).

## Ricompilare il tema (opzionale)
```bash
npm install
npm run build   # rigenera assets/dist/ da resources/ (AdminLTE 4 + Bootstrap 5)
```
