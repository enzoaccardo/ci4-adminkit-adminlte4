<nav class="app-header navbar navbar-expand bg-body">
    <div class="container-fluid">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" data-lte-toggle="sidebar" href="#" role="button">
                    <i class="bi bi-list"></i>
                </a>
            </li>
        </ul>
        <ul class="navbar-nav ms-auto">
            {block name='header_right'}
            <li class="nav-item dropdown">
                <a class="nav-link p-0" data-bs-toggle="dropdown" href="#">
                    {if $userAvatarUrl}
                        <img src="{$userAvatarUrl}" alt="Avatar"
                             style="width:32px; height:32px; border-radius:50%; object-fit:cover; border:2px solid var(--bs-primary);">
                    {else}
                        <i class="bi bi-person-circle" style="font-size:1.4rem;"></i>
                    {/if}
                </a>
                <ul class="dropdown-menu dropdown-menu-end">
                    <li><a class="dropdown-item" href="{base_url path='admin/profile'}"><i class="bi bi-person me-2"></i>Profilo</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="{base_url path='logout'}"><i class="bi bi-box-arrow-right me-2"></i>Logout</a></li>
                </ul>
            </li>
            {/block}
        </ul>
    </div>
</nav>
