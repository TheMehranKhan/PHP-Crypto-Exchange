<div class="sidebar d-xs-none">
    <div class="menu">
        <ul>
            <li>
                <a href="{{route('exchange.index')}}" data-toggle="tooltip" data-placement="right" title="{{__('Exchange')}}" class="exchange">
                    <span>
                        <i class="mdi mdi-tumblr-reblog"></i>
                    </span>
                </a>
            </li>
            <li>
                <a href="{{route('user.wallets.index')}}" data-toggle="tooltip" data-placement="right" title="{{__('My Wallets')}}" class="wallets">
                    <span>
                        <i class="mdi mdi-wallet"></i>
                    </span>
                </a>
            </li>
            <li>
                <a href="{{route('user.open.order')}}" data-toggle="tooltip" data-placement="right" title="{{__('All Orders')}}" class="orders">
                    <span>
                        <i class="mdi mdi-shopping"></i>
                    </span>
                </a>
            </li>
            <li>
                <a href="{{route('tickets.index')}}" data-toggle="tooltip" data-placement="right" title="{{__('Support')}}" class="support">
                    <span>
                        <i class="mdi mdi-help-box"></i>
                    </span>
                </a>
            </li>
            <li>
                <a href="{{route('profile.index')}}" data-toggle="tooltip" data-placement="right" title="{{__('Setting')}}" class="setting">
                    <span>
                        <i class="mdi mdi-settings"></i>
                    </span>
                </a>
            </li>
        </ul>
    </div>
</div>
