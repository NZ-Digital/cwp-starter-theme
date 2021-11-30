<div class="container-fluid site-header d-flex align-items-end clearfix">
    <% include SkipLinks %>
    <div class="site-header-brand">
        <a title="<%t CWP_Header.Title "Go to Home Page" %>" class="site-header-brand-link-default" href="$BaseHref">
            <% if $SiteConfig.Logo %>
                <style>
                    @media only screen and (min-width: 1590px) {
                        .logo-img {
                            width: {$SiteConfig.LogoWidth}px;
                        }
                    }
                    @media only screen and (max-width: 1589px) and (min-width: 669px) {
                        .logo-img {
                            width: {$SiteConfig.LogoWidthIpad}px;
                        }
                    }
                    @media only screen and (max-width: 668px) {
                        .logo-img {
                            width: 100px;
                        }
                    }
                </style>
                <img src="$SiteConfig.Logo.URL" class="logo-img" alt="$SiteConfig.Title - Logo">
            <% else %>
                <span>$SiteConfig.Title</span>
            <% end_if %>
        </a>
        <% if $SiteConfig.Tagline %>
            <span class="site-header-brand-tagline">$SiteConfig.Tagline</span>
        <% end_if %>
    </div>
    <div class="navbar-expand-md navbar-light">
        <button class="navbar-toggler float-right" type="button" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false">
            <span class="sr-only"><%t CWP_Header.Toggle "Toggle navigation" %></span>
            <span class="navbar-toggler-icon"></span>
        </button>
    </div>

    <% include MainNav %>
    <% include LanguageSelector %>
</div>
<div class="container-fluid site-header scrolled d-flex align-items-end clearfix">
    <% include SkipLinks %>
    <div class="site-header-brand">
        <a title="<%t CWP_Header.Title "Go to Home Page" %>" class="site-header-brand-link-default" href="$BaseHref">
            <% if $SiteConfig.Logo %>
                <img src="$SiteConfig.LogoScrolled.URL" alt="$SiteConfig.Title" style="width:248px;">
            <% else %>
                <span>$SiteConfig.Title</span>
            <% end_if %>
        </a>
        <% if $SiteConfig.Tagline %>
            <span class="site-header-brand-tagline">$SiteConfig.Tagline</span>
        <% end_if %>
    </div>
    <div class="navbar-expand-md navbar-light">
        <button class="navbar-toggler float-right" type="button" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false">
            <span class="sr-only"><%t CWP_Header.Toggle "Toggle navigation" %></span>
            <span class="navbar-toggler-icon"></span>
        </button>
    </div>

    <% include MainNav %>
    <% include LanguageSelector %>
</div>

