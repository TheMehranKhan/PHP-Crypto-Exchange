"use strict";
/* -------------------------------------------
::::::: Start Cookie :::::::
------------------------------------------- */
function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
    var expires = "expires=" + d.toUTCString();
    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

function getCookie(cname) {
    var name = cname + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var ca = decodedCookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}

/* -------------------------------------------
::::::: End Cookie :::::::
------------------------------------------- */

/* -------------------------------------------
::::::: Start stripTag :::::::
------------------------------------------- */
function stripTag(input) {
    input = input.toString();
    return input.replace(/(<([^>]+)>)/ig, "");
}

/* -------------------------------------------
    ::::::: Start slicknav :::::::
    ------------------------------------------- */
if ($('#lf-main-nav').length > 0) {
    $('#lf-main-nav').find('.active').parents('li').addClass('active');
    $('#lf-main-nav').slicknav({
        prependTo: ".lf-responsive-menu-wrapper",
        'closedSymbol': '&#xf105;',
        'openedSymbol': '&#xf107;',
        label: ""
    });
}

if ($('#lf-side-nav').length > 0) {
    $(window).on("load", function () {
        $("#lf-side-nav").mCustomScrollbar({
            theme: "dark",
            scrollInertia: 300,
            axis: 'y'
        });
    });
}

if ($('.lf-side-nav').length > 0) {
    let navDir = 'margin-left';
    if($('html').attr('dir')=='rtl'){
        navDir = 'margin-right';
    }
    $('.lf-side-nav li.active').parents('li').addClass('active menu-open');
    // $(window).on("load", function () {
    $(document).on('click', ".lf-side-nav-controller", function () {

        if($('.lf-side-nav').hasClass('lf-side-nav-open')){
            $('.lf-side-nav').removeClass('lf-side-nav-open');
            if($('body').hasClass('lf-fixed-sidenav') && $(window).width() >= 992){
                $('.wrapper').css(navDir,'0px');
            }
        }
        else{
            $('.lf-side-nav').addClass('lf-side-nav-open');
            if($('body').hasClass('lf-fixed-sidenav') && $(window).width() >= 992){
                $('.wrapper').css(navDir,'280px');
            }
        }
    });
    if($('body').hasClass('lf-fixed-sidenav')){
        $(window).on('resize', function(){
            if($('.lf-side-nav').hasClass('lf-side-nav-open')){
                if($(window).width() >= 992){
                    $('.wrapper').css(navDir,'280px');
                }
                else{
                    $('.wrapper').css(navDir,'0px');
                }
            }
            else{
                $('.wrapper').css(navDir,'0px');
            }
        })
    }
    // });
    $(document).on('click', '.lf-side-nav li a', function () {
        var a = $(this).parent();
        var b = a.hasClass('menu-open');
        if (b) {
            a.children('ul').slideUp(200, function () {
                a.removeClass('menu-open')
            });
        } else {
            a.children('ul').slideDown(200, function () {
                a.addClass('menu-open')
            });
        }
    })
}

/* -------------------------------------------
::::::: End slicknav :::::::
------------------------------------------- */

$('#notice-0').modal('show');

$('.notice-modal').on('hidden.bs.modal', function (e) {
    $('#notice-' + $(this).attr('data-next-modal')).modal('show');
});

$(document).on('click', '.lf-theme-switcher .btn', function () {
    let currentTheme = getCookie("style");
    const triggeredTheme = $(this).data('theme');

    if (currentTheme.length === 0 || triggeredTheme !== currentTheme) {
        setCookie("style", triggeredTheme, 365);
        window.location.reload();
    }
});

//  Preloader
jQuery(window).on("load", function () {
    $("#preloader").fadeOut(500);
    $("#main-wrapper").addClass("show");
});

(function ($) {
    //  Header fixed
    $(window).scroll(function () {
        if ($(this).scrollTop() > 100) {
            $(".header").addClass("animated slideInDown fixed"), 3000;
        } else {
            $(".header").removeClass("animated slideInDown fixed"), 3000;
        }
    });

    // $("select").niceSelect();

    // active
    // $(function () {
    //     for (
    //         var nk = window.location,
    //             o = $(".menu a, .sub-menu a")
    //                 .filter(function () {
    //                     return nk.href.includes(this.href);
    //                 })
    //                 .addClass("active")
    //                 .parent()
    //                 .addClass("active");
    //         ;
    //
    //     ) {
    //         // console.log(o)
    //         if (!o.is("li")) break;
    //         o = o.parent().addClass("show").parent().addClass("active");
    //     }
    // });

    function activeNav(include, className) {
        $(function () {
            if (window.location.href.includes(include)) {
                $(className).addClass("active").parent().addClass("active");
            }
        });
    }

    // Account active
    activeNav("exchange", ".trade");
    activeNav("swap", ".exchange");
    activeNav("data", ".data");
    activeNav("setting", ".setting");
    activeNav("price", ".data-sub");

    $(".sidebar-right-trigger").on("click", function () {
        $(".sidebar-right").toggleClass("show");
    });

    $('[data-toggle="tooltip"]').tooltip();

    $(".data-close").on("click", function () {
        e.preventDefault();
        $(this).parent().parent().remove();
    });

    $("#tbUser").on("click", ".btnDelete", function () {
        $(this).closest("tr").remove();
    });

    $(function () {
        if (window.location.href.includes("dark")) {
            $("body").addClass("dark");
        }
    });
})(jQuery);
