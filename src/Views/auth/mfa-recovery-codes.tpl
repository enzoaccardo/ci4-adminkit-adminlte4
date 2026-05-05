{extends file='layout/main.tpl'}

{block name='content'}
<div class="card" style="width:100%;">
    <div class="card-body login-card-body">
        <div class="text-center mb-3">
            <h1 class="h5 mb-1">Codici di recupero</h1>
            <p class="text-body-secondary small mb-0">
                Salva questi codici in un posto sicuro: servono ad accedere se perdi l'app authenticator.
            </p>
        </div>

        <div class="alert alert-warning py-2 small">
            <strong>Attenzione:</strong> vengono mostrati <strong>una sola volta</strong> e ciascun codice è usabile una volta.
        </div>

        <div class="border rounded p-3 mb-3 bg-body-tertiary">
            <div class="row row-cols-2 g-2 font-monospace">
                {foreach $codes as $code}
                    <div class="col">
                        <div class="border rounded bg-body text-center py-1">{$code}</div>
                    </div>
                {/foreach}
            </div>
        </div>

        <form method="post" action="{base_url path='mfa/recovery-codes'}">
            {csrf_field}
            <div class="form-check mb-3">
                <input class="form-check-input" type="checkbox" name="saved" value="1" id="saved" required>
                <label class="form-check-label small" for="saved">Ho salvato i codici in un posto sicuro.</label>
            </div>
            <button type="submit" class="btn btn-success w-100">Continua</button>
        </form>
    </div>
</div>
{/block}
