@php $url = config('theme.url') @endphp
<div class="col-xl-12">
    <div class="card sub-menu">
        <div class="card-body active">
            <ul class="d-flex show">
                <li class="nav-item">
                    <a href="{{ url('data-tbi'.$url) }}" class="nav-link">
                        <i class="mdi mdi-database-plus"></i>
                        <span>TBI</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a
                        href="{{ url('data-founding-rate'.$url) }}"
                        class="nav-link"
                    >
                        <i class="mdi mdi-book"></i>
                        <span>Founding Rate</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a
                        href="{{ url('data-insurance-found'.$url) }}"
                        class="nav-link"
                    >
                        <i class="mdi mdi-book-multiple"></i>
                        <span>Insurance Found</span>
                    </a>
                </li>
                <li class="nav-item dropdown">
                    <a
                        href="javascript:void(0)"
                        class="nav-link dropdown-toggle data-sub"
                        data-toggle="dropdown"
                    >
                        <i class="mdi mdi-file-export"></i>
                        <span>Export CSV</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right">
                        <a
                            class="dropdown-item"
                            href="{{ url('data-last-price'.$url) }}"
                            >Last Price</a
                        >
                        <a
                            class="dropdown-item"
                            href="{{ url('data-index-price'.$url) }}"
                            >Index Price</a
                        >
                        <a
                            class="dropdown-item"
                            href="{{ url('data-mark-price'.$url) }}"
                            >Mark Price</a
                        >
                        <!-- <a class="dropdown-item" href="javascript:void(0)">Founding Rate</a> -->
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>
