<?php

namespace AdminKit\AdminLTE\Controllers;

use AdminKit\Libraries\SmartyRenderer;
use CodeIgniter\Controller;
use CodeIgniter\HTTP\RequestInterface;
use CodeIgniter\HTTP\ResponseInterface;
use Psr\Log\LoggerInterface;

/**
 * Controller base per le pagine FRONT (login, MFA, reset password) col tema
 * AdminLTE 4. Parallelo di ThemedAdminController ma per l'area non autenticata.
 *
 * Fornisce il rendering Smarty con le viste auth del tema e i dati di branding.
 * L'app estende questa classe nei suoi controller di autenticazione e assegna
 * $success/$error (flash) e gli script specifici (es. passkey su mfa-verify).
 */
abstract class ThemedFrontController extends Controller
{
    protected SmartyRenderer $smarty;

    private array $scripts = [];

    public function initController(RequestInterface $request, ResponseInterface $response, LoggerInterface $logger): void
    {
        parent::initController($request, $response, $logger);

        $this->smarty = service('smarty');
        $this->smarty->setTemplateDir($this->templateDirs());
        $this->smarty->getSmarty()->compile_id = 'front';
    }

    /**
     * Catena viste: tema front dell'app (override, se esiste) → viste auth del tema.
     *
     * @return list<string>
     */
    protected function templateDirs(): array
    {
        $dirs    = [__DIR__ . '/../Views/auth/'];
        $appFront = APPPATH . 'Views/themes/front/default/';
        if (is_dir($appFront)) {
            array_unshift($dirs, $appFront);
        }

        return $dirs;
    }

    protected function addJs(string $url): static
    {
        foreach ($this->scripts as $item) {
            if ($item['type'] === 'url' && $item['content'] === $url) {
                return $this;
            }
        }
        $this->scripts[] = ['type' => 'url', 'content' => $url];
        return $this;
    }

    protected function addInlineJs(string $code): static
    {
        $this->scripts[] = ['type' => 'inline', 'content' => $code];
        return $this;
    }

    protected function assign(string $key, mixed $value): static
    {
        $this->smarty->assign($key, $value);
        return $this;
    }

    protected function render(string $view, bool $saveData = false): string
    {
        $cfg = config('AdminLTE');

        $this->smarty->assign('themeAssets', rtrim(base_url(config('AdminKit')->assetBase), '/'));
        $this->smarty->assign('brand', $cfg->brand);
        $this->smarty->assign('useCdn', $cfg->useCdn);
        $this->smarty->assign('csrfToken', csrf_token());
        $this->smarty->assign('csrfHash', csrf_hash());
        $this->smarty->assign('scripts', $this->scripts);

        return $this->smarty->render($view, saveData: $saveData);
    }
}
