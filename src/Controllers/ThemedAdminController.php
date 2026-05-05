<?php

namespace AdminKit\AdminLTE\Controllers;

use AdminKit\Controllers\BaseAdminController;

/**
 * Controller base con il tema AdminLTE 4 agganciato.
 *
 * Estende il BaseAdminController di ci4-adminkit inserendo le viste di layout
 * del tema (main/header/sidebar/footer) nella catena Smarty, e assegnando i
 * dati di branding dalla config AdminLTE.
 *
 * L'app estende QUESTA classe e aggiunge, sovrascrivendo prepareView() (e
 * chiamando parent::prepareView()), i dati che solo l'app conosce: menu
 * ($menuTree), avatar utente ($userAvatarUrl), titoli di pagina, __APP__, ecc.
 */
abstract class ThemedAdminController extends BaseAdminController
{
    /**
     * Inserisce le viste del tema tra il tema dell'app e i partial del kit:
     * [tema app] → [layout AdminLTE] → [partial ci4-adminkit].
     */
    protected function templateDirs(): array
    {
        $dirs = parent::templateDirs();
        array_splice($dirs, 1, 0, [__DIR__ . '/../Views/']);

        return $dirs;
    }

    /**
     * Branding e default del layout. L'app sovrascrive e chiama
     * parent::prepareView() per aggiungere menu/avatar/titoli.
     */
    protected function prepareView(): void
    {
        $cfg = config('AdminLTE');

        $this->assign('themeAssets', rtrim(base_url(config('AdminKit')->assetBase), '/'));
        $this->assign('brand', $cfg->brand);
        $this->assign('titleSuffix', $cfg->titleSuffix);
        $this->assign('footerText', $cfg->footerText);
        $this->assign('logoUrl', $cfg->logoUrl);
        $this->assign('useCdn', $cfg->useCdn);

        // Default: l'app li rimpiazza sovrascrivendo prepareView().
        $this->assign('menuTree', []);
        $this->assign('userAvatarUrl', null);
    }
}
