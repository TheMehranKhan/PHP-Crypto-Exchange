<div class="page-title dashboard d-block">
    <div class="container">
        <div class="row card-body">
            <div class="col-xl-3 col-md-5 col-lg-3 col-sm-12">
                <div class="page-title-content">
                    <p>
                        {{__('Welcome Back')}},
                        <span> {{auth()->user()->profile->full_name}}</span>
                    </p>
                </div>
            </div>
            <div class="col-xl-9 col-md-7 col-lg-9 col-sm-12">
                <nav aria-label="breadcrumb">
                    <ol class="text-right breadcrumbs list-unstyle mb-0">
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
        </div>
    </div>
</div>
