@php $url = config('theme.url') @endphp
<div class="col-xl-12">
    <div class="card sub-menu">
        <div class="card-body active">
            <ul class="d-flex show">
                <li class="nav-item">
                    <a href="{{ url('edit-profile'.$url) }}" class="nav-link">
                        <i class="mdi mdi-account-settings-variant"></i>
                        <span>Edit Profile</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a
                        href="{{ url('settings-preferences'.$url) }}"
                        class="nav-link"
                    >
                        <i class="mdi mdi-settings"></i>
                        <span>Preferences</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a
                        href="{{ url('settings-security'.$url) }}"
                        class="nav-link"
                    >
                        <i class="mdi mdi-lock"></i>
                        <span>Security</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a
                        href="{{ url('settings-account'.$url) }}"
                        class="nav-link"
                    >
                        <i class="mdi mdi-bank"></i>
                        <span>Linked Account</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>
