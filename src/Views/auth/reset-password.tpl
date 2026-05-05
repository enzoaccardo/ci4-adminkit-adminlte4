{extends file='layout/main.tpl'}

{block name='content'}
<div class="card">
    <div class="card-body login-card-body">
        <div class="text-center mb-3">
            <h1 class="h5 mb-1">Nuova password</h1>
            <p class="text-body-secondary small mb-0">Scegli una nuova password di almeno 8 caratteri.</p>
        </div>

        {include file='_partials/alerts.tpl'}

        <form method="post" action="{base_url path='reset-password'}">
            {csrf_field}
            <input type="hidden" name="token" value="{$token}">
            <div class="mb-3">
                <label class="form-label" for="password">Nuova password</label>
                <input type="password" class="form-control" id="password" name="password" required autofocus minlength="8">
            </div>
            <div class="mb-3">
                <label class="form-label" for="password_confirm">Conferma password</label>
                <input type="password" class="form-control" id="password_confirm" name="password_confirm" required minlength="8">
            </div>
            <button type="submit" class="btn btn-primary w-100">Imposta nuova password</button>
        </form>

        <p class="text-center mt-3 mb-0 small">
            <a href="{base_url path='login'}">Torna al login</a>
        </p>
    </div>
</div>
{/block}
