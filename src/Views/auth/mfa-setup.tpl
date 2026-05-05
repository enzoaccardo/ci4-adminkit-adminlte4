{extends file='layout/main.tpl'}

{block name='content'}
<div class="card">
    <div class="card-body login-card-body">
        <div class="text-center mb-3">
            <h1 class="h5 mb-1">Autenticazione a 2 fattori</h1>
            <p class="text-body-secondary small mb-0">Collega un'app authenticator al tuo account.</p>
        </div>

        {include file='_partials/alerts.tpl'}

        <div class="border rounded p-3 mb-3 bg-body-tertiary">
            <p class="fw-semibold mb-1">Passo 1 — Scansiona il QR code</p>
            <p class="text-body-secondary small mb-2">
                Apri Google Authenticator, Authy o un'altra app TOTP e scansiona il codice.
            </p>
            <div class="d-flex justify-content-center mb-2">{$qrCodeSvg nofilter}</div>
            <p class="text-body-secondary small text-center mb-1">Oppure inserisci manualmente:</p>
            <p class="text-center font-monospace text-break mb-0">{$secret}</p>
        </div>

        <div class="border rounded p-3 bg-body-tertiary">
            <p class="fw-semibold mb-1">Passo 2 — Conferma con il primo codice</p>
            <form method="post" action="{base_url path='mfa/setup'}">
                {csrf_field}
                <div class="my-2">
                    <input type="text" class="form-control form-control-lg text-center" name="code"
                           inputmode="numeric" maxlength="6" autocomplete="one-time-code"
                           placeholder="000000" autofocus required style="letter-spacing:.5rem;">
                </div>
                <button type="submit" class="btn btn-success w-100">Attiva MFA e continua</button>
            </form>
        </div>

        <p class="text-center mt-3 mb-0 small">
            <a href="{base_url path='logout'}">Esci e torna al login</a>
        </p>
    </div>
</div>
{/block}
