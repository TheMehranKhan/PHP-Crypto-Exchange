@include('layouts.includes.header')
@section('title', __("Transfer ADVCash..."))
<style>
    #pageloader
    {
        background: rgba( 255, 255, 255, 0.8 );
        display: block;
        height: 100%;
        position: fixed;
        width: 100%;
        z-index: 9999;
    }

    #pageloader img
    {
        left: 50%;
        margin-left: -32px;
        margin-top: -32px;
        position: absolute;
        top: 50%;
    }
    #pageloader h3 {
        margin-left: -155px;
        margin-top: 50px;
        left: 50%;
        top: 50%;
        position: absolute;
    }
</style>
<div id="pageloader">
    <img src="http://cdnjs.cloudflare.com/ajax/libs/semantic-ui/0.16.1/images/loader-large.gif" alt="processing..." />
    <h3>Redirecting to ADVCash Payment...</h3>
</div>

<form name="advcash_payment" method="post" action="{{ $action }}">
    <input type="hidden" name="ac_account_email" value="{{ $ac_account_email }}"/>
    <input type="hidden" name="ac_sci_name" value="{{ $ac_sci_name }}"/>
    <input type="hidden" name="ac_amount" value="{{ $ac_amount }}"/>
    <input type="hidden" name="ac_currency" value="{{ $ac_currency }}"/>
    <input type="hidden" name="ac_order_id" value="{{ $ac_order_id }}"/>
    <input type="hidden" name="ac_sign" value="{{ $ac_sign }}"/>
    <!-- Optional Fields -->
    <input type="hidden" name="ac_success_url" value="{{ $ac_success_url }}"/>
    <input type="hidden" name="ac_success_url_method" value="POST"/>
    <input type="hidden" name="ac_fail_url" value="{{ $ac_fail_url }}"/>
    <input type="hidden" name="ac_fail_url_method" value="POST"/>
    <input type="hidden" name="ac_status_url" value="{{ $ac_status_url }}"/>
    <input type="hidden" name="ac_status_url_method" value="POST"/>
    @if($comment !== '') <input type="hidden" name="ac_comments" value="{{ $comment }}"/> @endif
    <input type="hidden" name="ident" value="{{ $ident }}">
</form>


<script>
    window.onload = function () {
        document.forms['advcash_payment'].submit();
    }
</script>
