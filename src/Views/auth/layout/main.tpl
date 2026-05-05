<!doctype html>
<html lang="{$htmlLang|default:'it'}">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{$title|default:$brand}</title>
    {if $useCdn}
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fontsource/source-sans-3@5.0.12/index.css" crossorigin="anonymous"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" crossorigin="anonymous"/>
    {/if}
    <link rel="stylesheet" href="{$themeAssets}/dist/app.css"/>
</head>
<body class="login-page bg-body-secondary">
    <div class="login-box">
        {block name='content'}{/block}
    </div>

    <script src="{$themeAssets}/dist/app.js"></script>
    {foreach $scripts|default:[] as $script}
        {if $script.type === 'url'}
            <script src="{$script.content}"></script>
        {else}
            <script>{$script.content nofilter}</script>
        {/if}
    {/foreach}
</body>
</html>
