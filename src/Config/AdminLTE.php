<?php

namespace AdminKit\AdminLTE\Config;

use CodeIgniter\Config\BaseConfig;

/**
 * Configurazione del tema AdminLTE 4. Pubblicabile nell'app con
 * `php spark adminlte4:publish --config` per personalizzare branding e testi.
 *
 * Gli asset (app.css/app.js del tema) vivono nell'assetBase di ci4-adminkit
 * (config('AdminKit')->assetBase): il tema usa la stessa cartella public.
 */
class AdminLTE extends BaseConfig
{
    /** Testo del brand mostrato nella sidebar. */
    public string $brand = 'AdminKit';

    /** Suffisso del <title> della pagina (es. "Pagina | Admin"). */
    public string $titleSuffix = 'Admin';

    /** Testo del footer. */
    public string $footerText = 'AdminKit';

    /**
     * URL del logo nella sidebar (opzionale). Se null viene mostrato solo il
     * testo del brand.
     */
    public ?string $logoUrl = null;

    /**
     * Dipendenze caricate da CDN nel layout (font, overlayscrollbars,
     * bootstrap-icons). Metti a false per fornirle tu (es. self-hosted) e
     * sovrascrivere il blocco {block name='head_cdn'} nel tuo tema d'app.
     */
    public bool $useCdn = true;
}
