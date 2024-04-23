@if(!empty($IDAnalyzer['url']))
<iframe class="col-xl-12 kyc-frame" src="{{ $IDAnalyzer['url'] }}"></iframe>
@else
<p><span class="font-weight-bold">{{__('Error')}}: </span> {{$IDAnalyzer['error']['message']}}</p>
@endif
