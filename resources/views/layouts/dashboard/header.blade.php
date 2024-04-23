<div class="header dashboard">
    <div class="container-fluid">
        <div class="row">
            <div class="col-xl-12">
                <nav
                        class="
                        navbar navbar-expand-lg navbar-light
                        px-0
                        justify-content-between">
                    <div class="flex-grow-1 flex-lg-grow-0">
                        <a href="{{route('home')}}"
                           class="lf-logo{{isset($inversedLogo) ? ($inversedLogo  ? ' lf-logo-inversed' : '') : is_light_mode(settings('company_logo_light')? '': ' lf-logo-inversed')}}">
                            <!-- lf-logo-inversed -->
                            <img src="{{ company_logo() }}"
                                 class="img-fluid"
                                 alt="">
                        </a>
                        @if((!isset($activeSideNav) && in_array(settings('navigation_type'), [1,2])) || (isset($activeSideNav) && $activeSideNav))
                            <a href="javascript:"
                               class="top-0 start-0 lf-side-nav-controller lf-side-nav-toggler">
                                <div class="d-flex">
                                    <div class="img"></div>
                                    <i class="fa fa-angle-down px-1 font-size-16 line-height-medium"></i>
                                </div>
                            </a>
                        @endif
                    </div>

                    @if(in_array(settings('navigation_type'), [0,2]))
                        <div class="flex-lg-grow-1 ml-3 mr-3">
                            <nav class="d-lg-block d-none">
                                {{ get_nav('top-nav') }}
                            </nav>
                            <div class="lf-responsive-menu-wrapper d-lg-none d-block"></div>
                        </div>
                    @endif

                    <div class="header-right d-flex my-0 align-items-center">
                        <div class="dashboard_log">
                            <ul class="d-flex justify-content-center align-items-center lf-user-menu">
                                @guest
                                    <li>
                                        <a href="{{route('login')}}">{{__('Login')}}</a>
                                    </li>
                                    <li>
                                        <a href="{{route('register.index')}}">{{__('Signup')}}</a>
                                    </li>
                                @endguest
                                @auth
                                    @php
                                        $userNotifications = get_user_specific_notice()
                                    @endphp
                                    <li>
                                        <div class="btn-group lf-user-notification">
                                            <button type="button"
                                                    class="dropdown-toggle"
                                                    data-toggle="dropdown"
                                                    aria-haspopup="true"
                                                    aria-expanded="false">
                                                <i class="fa fa-bell-o notification-icon"></i>
                                                <div class="lf-notification-count">{{ $userNotifications['count_unread'] }}</div>
                                            </button>
                                            @if(!empty($userNotifications['list']->count()))
                                                <div class="dropdown-menu dropdown-menu-sm-left dropdown-menu-md-right">
                                        <span
                                                class="dropdown-header">{{ __('You have :count notifications',['count' => $userNotifications['count_unread']]) }}</span>

                                                    @foreach($userNotifications['list'] as $notification)
                                                        <a href="{{ route('notifications.mark-as-read',$notification->id) }}" class="dropdown-item">
                                                            <i class="fa fa-bell text-muted pr-2"></i>
                                                            {{ $notification->message }}
                                                        </a>
                                                    @endforeach
                                                    <a class="btn btn-info text-center all-notification"
                                                       href="{{ route('notifications.index') }}">{{__('See All Notifications')}}</a>
                                                </div>
                                            @endif
                                        </div>
                                    </li>
                                    <li>
                                        <div class="btn-group lf-user-dropdown">
                                            <button type="button"
                                                    class="dropdown-toggle"
                                                    data-toggle="dropdown"
                                                    aria-haspopup="true"
                                                    aria-expanded="false">
                                                <i class="fa fa-user"></i>
                                            </button>
                                            <div class="dropdown-menu dropdown-menu-sm-left dropdown-menu-md-right">
                                                <div class="dropdown-header">
                                                    <div class="d-flex pb-2">
                                                        <div class="avatar">
                                                            <img src="{{get_avatar(auth()->user()->avatar)}}"
                                                                 alt=""
                                                                 class="img-fluid">
                                                        </div>
                                                        <div class="user-info">
                                                            <h6>{{auth()->user()->profile->full_name}}</h6>
                                                            <div>{{auth()->user()->username}}</div>
                                                        </div>
                                                    </div>
                                                    <a class="btn btn-info btn-sm"
                                                       href="{{route('logout')}}"><i
                                                                class="mdi mdi-face"></i> {{__('Log out')}}</a>
                                                </div>
                                                {{ get_nav('profile-nav', 'profile_dropdown') }}
                                            </div>
                                        </div>
                                    </li>
                                @endauth
                                @if(settings('lang_switcher'))
                                    <li>
                                        <div class="btn-group lf-language">
                                            <button type="button"
                                                    class="dropdown-toggle"
                                                    data-toggle="dropdown"
                                                    aria-haspopup="true"
                                                    aria-expanded="false">
                                                <div>{{ display_language(App::getLocale()) }}</div>
                                            </button>
                                            <div class="dropdown-menu dropdown-menu-right">
                                                @foreach(language() as $language => $parameter)
                                                    <a class="dropdown-item"
                                                       href="{{ generate_language_url($language) }}">
                                                        {{ display_language($language, $parameter) }}
                                                    </a>
                                                @endforeach
                                            </div>
                                        </div>
                                    </li>
                                @endif
                                <li>
                                    <div class="btn-group btn-group-sm lf-theme-switcher ml-2" role="group">
                                        <button
                                                class="rounded-0 btn py-0 {{ is_light_mode('active') }}"
                                                data-theme="light">
                                            <i class="icofont-sun"></i>
                                        </button>
                                        <button
                                                class="rounded-0 btn py-0 {{ is_light_mode('', 'active') }}"
                                                data-theme="dark">
                                            <i class="icofont-moon"></i>
                                        </button>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
    </div>
</div>
