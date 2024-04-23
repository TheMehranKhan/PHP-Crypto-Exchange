<div class="footer dashboard">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-8 col-12">
                <div class="copyright">
                    <p>
                        @if(!empty(settings('footer_copyright_text')))
                        {{ view_html(settings('footer_copyright_text')) }}
                        @else
                        &copy; 2020-{{ date('Y') }} - <a href="{{ route('home') }}">{{ company_name() }}</a> - {{__('All Right Reserved')}}.
                        @endif
                    </p>
                </div>
            </div>
            <div class="col-sm-4 col-12">
                <div class="footer-social">
                    <ul>
                        <li>
                            <a href="javascript:void(0)"
                                ><i class="fa fa-facebook"></i
                            ></a>
                        </li>
                        <li>
                            <a href="javascript:void(0)"
                                ><i class="fa fa-twitter"></i
                            ></a>
                        </li>
                        <li>
                            <a href="javascript:void(0)"
                                ><i class="fa fa-linkedin"></i
                            ></a>
                        </li>
                        <li>
                            <a href="javascript:void(0)"
                                ><i class="fa fa-youtube"></i
                            ></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
