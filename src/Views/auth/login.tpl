{extends file='layout/main.tpl'}

{block name='content'}
<div class="card">
    <div class="card-body login-card-body">
        <div class="text-center mb-3">
            <h1 class="h4 mb-1">{$brand}</h1>
            <p class="text-body-secondary small mb-0">Pannello di amministrazione</p>
        </div>

        {include file='_partials/alerts.tpl'}

        <form method="post" action="{base_url path='login/process'}">
            {csrf_field}
            <div class="mb-3">
                <label class="form-label" for="email">Email</label>
                <input type="email" class="form-control" id="email" name="email" required autofocus>
            </div>
            <div class="mb-3">
                <label class="form-label" for="password">Password</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <button type="submit" class="btn btn-primary w-100">Accedi</button>
        </form>

        <p class="text-center mt-3 mb-0 small">
            <a href="{base_url path='forgot-password'}">Password dimenticata?</a>
        </p>
    </div>
</div>
{/block}
