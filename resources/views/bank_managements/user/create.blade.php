@extends('layouts.master',['hideBreadcrumb'=>true,'activeSideNav' => active_side_nav(),'topLess' => true])
@section('title', $title)
@section('content')
    @include('layouts.dashboard.title')
    @component('components.card')
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">{{__($title)}}</h4>
                    <a href="{{ route('bank-accounts.index') }}"
                       class="btn btn-info btn-sm back-button">
                        <i class="fa fa-reply"></i>
                    </a>
                </div>
                <div class="card-body">
                    {{ Form::open(['route'=>'bank-accounts.store', 'method' => 'post', 'class'=>'form-horizontal validator-form', 'id' => 'bankForm']) }}
                    @include('bank_managements.user._form')
                    {{ Form::close() }}
                </div>
            </div>
        </div>
    @endcomponent

@endsection

@section('script')
    @include('bank_managements.user._script')
@endsection
