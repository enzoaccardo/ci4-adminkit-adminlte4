{extends file='layout/main.tpl'}

{block name='content'}
<div class="card">
    <div class="card-body login-card-body">
        <div class="text-center mb-3">
            <h1 class="h5 mb-1">Codice di recupero</h1>
            <p class="text-body-secondary small mb-0">Inserisci uno dei tuoi codici di recupero per accedere.</p>
        </div>

        {include file='_partials/alerts.tpl'}

        <form method="post" action="{base_url path='mfa/recover'}">
            {csrf_field}
            <div class="mb-3">
                <label class="form-label" for="code">Codice di recupero</label>
                <input type="text" class="form-control text-center font-monospace text-uppercase" id="code" name="code"
                       placeholder="XXXX-XXXX-XXXX" autofocus required autocomplete="off" style="letter-spacing:.1em;">
            </div>
            <button type="submit" class="btn btn-primary w-100">Accedi</button>
        </form>

        <p class="text-center mt-3 mb-0 small">
            <a href="{base_url path='mfa/verify'}">Torna alla verifica TOTP</a>
            &nbsp;·&nbsp;
            <a href="{base_url path='logout'}">Esci</a>
        </p>
    </div>
</div>
{/block}
