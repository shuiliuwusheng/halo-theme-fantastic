<div>
    <div id="toc"></div>
</div>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script>
    initToc()
    function initToc() {
        var toc = $(".post-article ul").first();
        $("#toc").html(toc);
        initRelationship()
        tocFixed()
    }
    function initRelationship() {
        var win = $(window);
        var anchors = $('#toc').find('a');
        var offset = 200; //偏移量看情况调
        win.on('scroll', function () {
            var scrollTop = win.scrollTop();
            anchors.each(function (i, v) {
                var that = $(v);
                var id = that.attr('href');
                var target = $(id);

                if (scrollTop >= target.offset().top - offset) {
                    anchors.removeClass('active');
                    anchors.parent().removeClass("lit-active");
                    that.addClass('active');
                    that.parent().addClass("lit-active");
                }
            })
        })

    }
    function tocFixed() {
        var dir = $("#toc");
        var postdiv = $(".article-content");
        var offsetLength = dir.offset().top
        $(document).scroll(function () {
            var distance = offsetLength - $(window).scrollTop();
            console.log(distance)
            // console.log(allpostdiv)
            if (distance <= 0) {
                if (!dir.hasClass('directory-fixed')) {
                    dir.addClass('directory-fixed');
                }
            } else if (distance > 0) {
                if (dir.hasClass('directory-fixed')) {
                    dir.removeClass('directory-fixed');
                }
            }
        });
    }

</script>
<style>
    #toc {
        /*position: fixed;*/
        z-index: -1;
        /*left: 44%;*/
        display: inline-block;
        text-align: left;
        margin-top: 20px;
        /*width: 260px;*/
        /*margin-left: 330px;*/
    }

    .toc-fixed {
        position: fixed;
        z-index: 0;
        left: 50%;
        display: inline-block;
        text-align: left;
        width: 260px;
        top: 40px;
    }

    #toc > ul:before {
        content: "";
        position: absolute;
        top: 0;
        left: 0px;
        bottom: 0;
        width: 3px;
        opacity: .2;
        z-index: 1;

    }

    #toc li, #toc ul {
        margin: 0;
        padding-left: 0;
        list-style: none;
        padding-top: 0.3rem;
    }

    #toc > ul {
        position: relative;
    }


    #toc > ul li::before {
        position: relative;
        top: 0;
        left: -2px;
        display: inline-block;
        width: 7px;
        height: 7px;
        content: '';
        border-radius: 50%;
        z-index: 100;
        opacity: 0.5;
        vertical-align: middle;
    }

    #toc > ul > li:hover::before {
        opacity: 1;
    }

    .lit-active::before {
        opacity: 1 !important;
    }

    #toc > ul > li > a {
        font-weight: bold;
    }

    #toc ul li a {
        display: inline-table;
        white-space: -moz-pre-wrap;
        vertical-align: middle;
    }

    #toc ul li a {
        margin-left: -5px;
        white-space: nowrap;
        width: 200px;
        padding-left: 15px;
        display: inline-block;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;

    }

    #toc ul li ul li a {
        margin-left: -15px;
        white-space: nowrap;
        width: 200px;
        padding-left: 30px;
        display: inline-block;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }

    #toc ul li ul li ul li a {
        display: inline-block;
        margin-left: -15px;
        padding-left: 35px;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
        width: 200px;
    }



    .directory-fixed {
        position: fixed;
        top: 0rem;
    }
</style>
