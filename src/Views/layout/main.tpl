<!doctype html>
<html lang="{$htmlLang|default:'it'}">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>{$title|default:$brand} | {$titleSuffix}</title>

    {block name='head_cdn'}
        {if $useCdn}
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fontsource/source-sans-3@5.0.12/index.css" crossorigin="anonymous"/>
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/overlayscrollbars@2.10.1/styles/overlayscrollbars.min.css" crossorigin="anonymous"/>
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" crossorigin="anonymous"/>
        {/if}
    {/block}

    <link rel="stylesheet" href="{$themeAssets}/dist/app.css"/>

    {foreach $cssLinks|default:[] as $href}
        <link rel="stylesheet" href="{$href}" crossorigin="anonymous"/>
    {/foreach}
    {foreach $cssInline|default:[] as $style}
        <style>{$style nofilter}</style>
    {/foreach}
    {foreach $headScripts|default:[] as $script}
        {if $script.type === 'url'}
            <script src="{$script.content}" crossorigin="anonymous"></script>
        {else}
            <script>{$script.content nofilter}</script>
        {/if}
    {/foreach}
</head>
<body class="layout-fixed sidebar-expand-lg bg-body-tertiary">

<div class="app-wrapper">

    {include file='layout/header.tpl'}
    {include file='layout/sidebar.tpl'}

    <main class="app-main">
        <div class="app-content-header">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-6">
                        <h3 class="mb-0">{$pageTitle|default:$title|default:''}</h3>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-end">
                            {block name='breadcrumb'}
                                <li class="breadcrumb-item"><a href="{base_url path='admin'}">Home</a></li>
                            {/block}
                        </ol>
                    </div>
                </div>
            </div>
        </div>
        <div class="app-content">
            <div class="container-fluid">
                {block name='content'}{/block}
            </div>
        </div>
    </main>

    {include file='layout/footer.tpl'}

</div>

{* Toast container — angolo in basso a destra *}
<div id="app-toast-container"
     class="toast-container position-fixed bottom-0 end-0 p-3"
     style="z-index:1100;min-width:300px;max-width:420px"></div>

{* Modal di conferma riutilizzabile — visibilità gestita da .app-modal-open *}
<style>
  #appConfirmModal { display: none !important; }
  #appConfirmModal.app-modal-open { display: block !important; }
</style>
<div class="modal" id="appConfirmModal" tabindex="-1"
     aria-labelledby="app-confirm-title" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="app-confirm-title">Conferma</h5>
                <button type="button" class="btn-close" aria-label="Chiudi"></button>
            </div>
            <div class="modal-body" id="app-confirm-body"></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" id="app-cancel-btn">Annulla</button>
                <button type="button" class="btn btn-primary" id="app-confirm-btn">Conferma</button>
                <button type="button" class="btn btn-primary d-none" id="app-passkey-btn">
                    <i class="bi bi-fingerprint me-1"></i>Verifica con passkey
                </button>
            </div>
        </div>
    </div>
</div>

{if $useCdn}
<script src="https://cdn.jsdelivr.net/npm/overlayscrollbars@2.10.1/browser/overlayscrollbars.browser.es5.min.js" crossorigin="anonymous"></script>
{/if}
<script src="{$themeAssets}/dist/app.js"></script>
<script src="{$themeAssets}/confirm-toast.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const sidebarWrapper = document.querySelector('.sidebar-wrapper');
        if (sidebarWrapper && typeof OverlayScrollbarsGlobal?.OverlayScrollbars !== 'undefined') {
            OverlayScrollbarsGlobal.OverlayScrollbars(sidebarWrapper, {
                scrollbars: { theme: 'os-theme-light', autoHide: 'leave', clickScroll: true }
            });
        }
    });
</script>
{foreach $footerScripts|default:[] as $script}
    {if $script.type === 'url'}
        <script src="{$script.content}" crossorigin="anonymous"></script>
    {else}
        <script>{$script.content nofilter}</script>
    {/if}
{/foreach}

</body>
</html>
