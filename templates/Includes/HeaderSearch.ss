<% if $SearchForm %>
    <div class="site-header-search $ExtraClass">
        <div class="row">
            <div class="col-auto mr-auto">
                <div class="site-logo">
                    <img src="$SiteConfig.LogoScrolled.URL" alt="$SiteConfig.Title">
                </div>
            </div>
            <div class="col-auto">
                <button class="btn-close"><i class="fal fa-times fontsize30"></i></button>
            </div>
        </div>
        <div class="search-form">
            <label><span class="fontsize30 font-weight-book text-white">Search What’s On</span></label>
            $SearchForm
        </div>
    </div>
<% end_if %>
