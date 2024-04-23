<section class="h-100 gradient-form">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-xl-10">
                <div class="card rounded-3 text-black">
                    <div class="row g-0">
                        <div class="col-lg-6">
                            <div class="card-body p-md-5 mx-md-4">

                                <div class="text-center">
                                    <a href="{{route('home')}}"
                                       class="lf-logo{{is_light_mode(settings('company_logo_light')? '': ' lf-logo-inversed')}}">
                                        <img src="{{ company_logo() }}"
                                             class="img-fluid"
                                             style="width: 185px;"
                                             alt="{{company_name()}}">
                                    </a>
                                    @isset($pageTitle)
                                        <h4 class="mt-1 mb-5 pb-1">{{ $pageTitle }}</h4>
                                    @endisset
                                </div>
                                {{ $slot }}
                            </div>
                        </div>
                        <div class="col-lg-6 d-flex align-items-center gradient-custom-2">
                            <div class="text-white px-3 py-4 p-md-5 mx-md-4">
                                <h4 class="mb-4">{{__('We are more than just a company')}}</h4>
                                <div class="pt-2">
                                    <b class="txt2">{{ __('Username') }}:</b> superadmin, <b class="txt2">{{ __('Password') }}:</b> Codemen11*<br>
                                    <b class="txt2">{{ __('Username') }}:</b> admin, <b class="txt2">{{ __('Password') }}:</b> password<br>
                                    <b class="txt2">{{ __('Username') }}:</b> user, <b class="txt2">{{ __('Password') }}:</b> password
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

