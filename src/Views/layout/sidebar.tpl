<aside class="app-sidebar bg-body-secondary shadow" data-bs-theme="dark">
    <div class="sidebar-brand">
        <a href="{base_url path='admin'}" class="brand-link">
            {if $logoUrl}<img src="{$logoUrl}" alt="{$brand}" class="brand-image opacity-75 shadow">{/if}
            <span class="brand-text fw-light px-3">{$brand}</span>
        </a>
    </div>
    <div class="sidebar-wrapper">
        <nav class="mt-2">
            <ul class="nav sidebar-menu flex-column" data-lte-toggle="treeview" role="menu">
                {block name='sidebar_top'}
                <li class="nav-item">
                    <a href="{base_url path='admin'}" class="nav-link{if $currentPath == '/admin'} active{/if}">
                        <i class="nav-icon bi bi-speedometer"></i>
                        <p>Dashboard</p>
                    </a>
                </li>
                {/block}

                {nav_menu items=$menuTree current_path=$currentPath}

            </ul>
        </nav>
    </div>
</aside>
