{extends file='layout/main.tpl'}

{block name='content'}
<div class="card">
    <div class="card-body login-card-body">
        <div class="text-center mb-3">
            <h1 class="h5 mb-1">Verifica identità</h1>
            <p class="text-body-secondary small mb-0">
                Inserisci il codice a 6 cifre generato dalla tua app authenticator.
            </p>
        </div>

        {include file='_partials/alerts.tpl'}

        <form method="post" action="{base_url path='mfa/verify'}">
            {csrf_field}
            <div class="mb-3">
                <label class="form-label" for="code">Codice OTP</label>
                <input type="text" class="form-control form-control-lg text-center" id="code" name="code"
                       inputmode="numeric" maxlength="6" autocomplete="one-time-code"
                       placeholder="000000" autofocus required style="letter-spacing:.5rem;">
            </div>
            <button type="submit" class="btn btn-primary w-100">Verifica</button>
        </form>

        {* Pulsante passkey (mostrato solo se il browser supporta WebAuthn) *}
        <div id="passkey-section" class="mt-4 d-none">
            <hr>
            <p class="text-body-secondary small text-center mb-2">
                In alternativa, puoi usare una passkey (Touch ID, Face ID, Windows Hello).
            </p>
            <button id="passkey-auth-btn" type="button" class="btn btn-outline-secondary w-100 d-flex align-items-center justify-content-center gap-2">
                <i class="bi bi-fingerprint"></i> Accedi con passkey
            </button>
            <div id="passkey-auth-status" class="text-center small mt-2" style="min-height:1rem;"></div>
        </div>

        <p class="text-center mt-3 mb-0 small">
            <a href="{base_url path='mfa/recover'}">Non hai accesso all'app? Usa un codice di recupero</a>
        </p>
        <p class="text-center mt-1 mb-0 small">
            <a href="{base_url path='logout'}">Esci e torna al login</a>
        </p>
    </div>
</div>
{/block}
