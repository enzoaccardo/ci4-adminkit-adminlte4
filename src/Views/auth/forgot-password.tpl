{extends file='layout/main.tpl'}

{block name='content'}
<div class="card">
    <div class="card-body login-card-body">
        <div class="text-center mb-3">
            <h1 class="h5 mb-1">Recupero password</h1>
            <p class="text-body-secondary small mb-0">
                Inserisci la tua email e ti invieremo un link per reimpostare la password.
            </p>
        </div>

        {include file='_partials/alerts.tpl'}

        <form method="post" action="{base_url path='forgot-password'}">
            {csrf_field}
            <div class="mb-3">
                <label class="form-label" for="email">Email</label>
                <input type="email" class="form-control" id="email" name="email" required autofocus>
            </div>
            <button type="submit" class="btn btn-primary w-100">Invia link di recupero</button>
        </form>

        <p class="text-center mt-3 mb-0 small">
            <a href="{base_url path='login'}">Torna al login</a>
        </p>
    </div>
</div>
{/block}
