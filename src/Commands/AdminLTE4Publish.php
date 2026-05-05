<?php

namespace AdminKit\AdminLTE\Commands;

use CodeIgniter\CLI\BaseCommand;
use CodeIgniter\CLI\CLI;

/**
 * Pubblica gli asset del tema AdminLTE 4 (app.css/app.js compilati + JS statici)
 * nella cartella public dell'app, nello stesso assetBase di ci4-adminkit.
 *
 *   php spark adminlte4:publish            # asset
 *   php spark adminlte4:publish --config   # anche app/Config/AdminLTE.php
 */
class AdminLTE4Publish extends BaseCommand
{
    protected $group       = 'AdminKit';
    protected $name        = 'adminlte4:publish';
    protected $description = 'Pubblica gli asset del tema AdminLTE 4 in public/ (e la config con --config).';
    protected $usage       = 'adminlte4:publish [--config]';
    protected $options     = ['--config' => 'Pubblica anche app/Config/AdminLTE.php'];

    public function run(array $params): int
    {
        $cfg    = config('AdminKit');
        $source = realpath(__DIR__ . '/../../assets');
        $dest   = rtrim(FCPATH, '/\\') . '/' . trim($cfg->assetBase, '/');

        if ($source === false) {
            CLI::error('Cartella assets del tema non trovata.');
            return EXIT_ERROR;
        }

        $count = $this->copyRecursive($source, $dest);
        CLI::write(CLI::color("Pubblicati {$count} asset del tema in ", 'green') . $dest);

        if (array_key_exists('config', $params) || CLI::getOption('config')) {
            $this->publishConfig();
        }

        CLI::write('Fatto.', 'green');
        return EXIT_SUCCESS;
    }

    private function copyRecursive(string $src, string $dst): int
    {
        if (! is_dir($dst)) {
            mkdir($dst, 0777, true);
        }

        $count = 0;
        foreach (scandir($src) as $entry) {
            if ($entry === '.' || $entry === '..') {
                continue;
            }
            $from = $src . '/' . $entry;
            $to   = $dst . '/' . $entry;
            if (is_dir($from)) {
                $count += $this->copyRecursive($from, $to);
            } else {
                copy($from, $to);
                $count++;
            }
        }

        return $count;
    }

    private function publishConfig(): void
    {
        $from = realpath(__DIR__ . '/../Config/AdminLTE.php');
        $to   = APPPATH . 'Config/AdminLTE.php';

        if ($from === false) {
            return;
        }

        if (is_file($to)) {
            CLI::write('app/Config/AdminLTE.php già presente, salto.', 'yellow');
            return;
        }

        $content = file_get_contents($from);
        $content = str_replace('namespace AdminKit\\AdminLTE\\Config;', 'namespace Config;', $content);
        $content = str_replace(
            'class AdminLTE extends BaseConfig',
            'class AdminLTE extends \\AdminKit\\AdminLTE\\Config\\AdminLTE',
            $content
        );

        file_put_contents($to, $content);
        CLI::write('Config pubblicata: app/Config/AdminLTE.php', 'green');
    }
}
