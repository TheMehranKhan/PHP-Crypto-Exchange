<div class="bottom section-padding">
    <div class="container">
        <div class="row">
            <!-- logo and about -->
            <div class="col-sm-6 col-lg-3">
                <div class="footer-widget">
                    <div class="footer-widget-logo mb-2 lf-logo{{is_light_mode(settings('company_logo_light')? '': ' lf-logo-inversed')}}">
                        <img src="{{ asset('storage/images/'.settings('company_logo')) }}"
                             alt="logo" class="img-fluid">
                    </div>

                    @if(!empty(settings('footer_about')))
                        <div class="footer-widget-content">
                            <p>
                                {{ settings('footer_about') }}
                            </p>
                        </div>
                    @endif
                    @if(!empty(settings('footer_email')) || !empty(settings('footer_phone_number')) || !empty(settings('footer_address')))
                        <ul class="footer-widget-contact-info">
                            @if(!empty(settings('footer_email')))
                                <li>
                                    <i class="fa fa-envelope-open"></i><a
                                            href="mailto:{{ settings('footer_email') }}">{{ settings('footer_email') }}</a>
                                </li>
                            @endif

                            @if(!empty(settings('footer_address')))
                                <li>
                                    <i class="fa fa-map-marker"></i>{{ settings('footer_address') }}
                                </li>
                            @endif
                            @if(!empty(settings('footer_phone_number')))
                                <li>
                                    <i class="fa fa-phone"></i>{{ settings('footer_phone_number') }}
                                </li>
                            @endif
                            @if(language(App()->getLocale())['direction']==PAGE_DIRECTION_RIGHT_TO_LEFT)
                                <li>
                                    <i class="fa fa-phone"></i>09131057001 شفیعی
                                </li>
                            @endif
                        </ul>
                    @endif
                </div>
            </div>
            <!-- menu -->
            @for($i = 1; $i <= 3; $i++)
                @if(!empty(settings('footer_menu_title_'.$i)) || !empty(settings('footer_widget_two_nav')))
                    <div class="col-sm-6 col-lg-3">
                        <div class="footer-widget">
                            @if(!empty(settings('footer_menu_title_'.$i)))
                                <h3 class="footer-widget-title">
                                    {{ __(settings('footer_menu_title_'.$i)) }}
                                </h3>
                            @endif
                            @if(!empty(settings('footer_menu_'.$i)))
                                {{ get_nav(settings('footer_menu_'.$i), 'footer_nav') }}
                            @endif
                        </div>
                    </div>
                @endif
            @endfor
        </div>
    </div>
</div>
<div class="footer">
    <div class="container">
        <div class="row">
            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                <div class="copyright">
                    <p>
                        @if(!empty(settings('footer_copyright_text')))
                        {{ view_html(settings('footer_copyright_text')) }}
                        @else
                        &copy; 2019-{{ date('Y') }} - <a href="{{ route('home') }}">{{ company_name() }}</a>
                        - {{__('All Right Reserved')}}.
                        @endif
                    </p>
                </div>
            </div>
            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                <div class="footer-social">
                    <ul>
                        <li>
                            <a href="javascript:void(0)"><i class="fa fa-facebook"></i></a>
                        </li>
                        <li>
                            <a href="javascript:void(0)"><i class="fa fa-twitter"></i></a>
                        </li>
                        <li>
                            <a href="javascript:void(0)"><i class="fa fa-linkedin"></i></a>
                        </li>
                        <li>
                            <a href="javascript:void(0)"><i class="fa fa-youtube"></i></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

