<div class="lf-title">
    <div class="container">
        <div class="row align-items-center">
            <div class="{{(isset($isRoute) && has_permission($route)) ? 'col-xl-10 col-lg-9 col-sm-8 col-7' : 'col'}} ">
                @if(isset($title))
                <h3>{{ __(ucwords(preg_replace('/[-_]+/', ' ', $title))) }}</h3>
                @endif
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a class="text-info" href="{{ route('home') }}"><i class="fa fa-home"></i> {{ __('Home') }}</a></li>
                        @foreach(get_breadcrumbs() as $breadcrumb)
                            @if($loop->last || empty($breadcrumb['display_url']))
                                <li class="breadcrumb-item active" aria-current="page">{{ $breadcrumb['name'] }}</li>
                            @else
                                <li class="breadcrumb-item"><a class="text-info" href="{{ $breadcrumb['url'] }}">{{ $breadcrumb['name'] }}</a>
                                </li>
                            @endif
                        @endforeach
                    </ol>
                </nav>
            </div>
            @if(isset($isRoute) && has_permission($route))
                <div class="col-xl-2 col-lg-3 col-sm-4 col-5 text-right">
                    <a class="btn btn-info {{isset($extraClass)?$extraClass:''}}" href="{{ route($route) }}">{{ __($routeName) }}</a>
                </div>
            @endif
        </div>
    </div>
</div>
