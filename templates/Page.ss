<!doctype html>
<html class="no-js" lang="$ContentLocale">
    <head>
        <% base_tag %>
        <title><% if $MetaTitle %>$MetaTitle.XML<% else %>$Title.XML<% end_if %> | $SiteConfig.Title.XML</title>
        $MetaTags(false)
        <meta name="viewport" id="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=10.0,initial-scale=1.0" />
        <% if $RSSLink %>
        <link rel='alternate' type='application/rss+xml' title='RSS' href='$RSSLink'>
        <% end_if %>
        <% require themedCSS('dist/css/main.css') %>
        <% include Favicon %>
    </head>
    <body class="$ClassName">
        <% include HeaderSearch %>
        <% include PreHeader %>
        <header role="banner">
            <% include Header %>
        </header>
        <% include MobileNav %>
        <main id="main" class="main" role="main">
            <div class="row no-gutters">
                $Layout
            </div>
        </main>
        <% include PageShowcase %>
        <footer class="footer-site" role="contentinfo">
            <% include Footer %>
        </footer>
        <% require themedJavascript('dist/js/jquery.min.js') %>
        <% require themedJavascript('dist/js/main.js') %>
        <script>

            window.Userback = window.Userback || {};

            Userback.access_token = '32243|61395|JULe63uJWZNk4LVD36qVySMpX';
            setTimeout(function () {
                $('.report-listing').click(function () {
                    $('.userback-button-e').trigger( "click" );
                });
            },1000);
            (function(d) {
                var s = d.createElement('script');s.async = true;
                s.src = 'https://static.userback.io/widget/v1.js';
                (d.head || d.body).appendChild(s);
            })(document);

        </script>
        <div id="fb-root"></div>
        <script>(function(d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s); js.id = id;
            js.src = "https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v3.0";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));</script>
        <% include GoogleAnalytics %>
    </body>
</html>
