<% if $SearchForm %>
    <div class="site-header-search $ExtraClass">
        <div class="row no-gutters align-items-center">
            <div class="col-auto mr-auto">
                <div class="site-logo">
                    <a href="$BaseHref">
                        <img src="$SiteConfig.LogoScrolled.URL" alt="$SiteConfig.Title">
                    </a>
                </div>
            </div>
            <div class="col-auto">
                <button class="btn-close"><i class="fal fa-times fontsize30"></i></button>
            </div>
        </div>
        <div class="search-form tablet-padding mobile-padding">
            <label><span class="fontsize30 font-weight-book text-white">Search What’s On</span></label>
            $SearchForm
        </div>
    </div>
<% end_if %>
