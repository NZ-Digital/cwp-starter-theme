<div class="latestNews-container">
    <% if $NewsLists %>
        <div class="row no-gutters align-items-center justify-content-between pr-lg-7 pb-lg-8">
            <div class="col-auto">
                <p><span class="font-weight-light fontsize80 halyard-display yellow-line">$Name</span></p>
            </div>
            <div class="col-auto">
                <% if $PageLink %>
                    <a href="{$PageLink.Link}"><span class="theme-button-hover-dark fontsize18 font-weight-medium">{$ButtonText}</span></a>
                <% end_if %>
            </div>
        </div>
        <div class="container-fluid p-0">
            <div class="row no-gutters pl-lg-9 pr-lg-7">
                <div class="align-self-center col-lg-4 pr-lg-4">
                    $Content
                    <% if $Image %>
                        <img src="$Image.URL" class="content-img" alt="{$SiteConfig.Title} - {$Name}">
                    <% end_if %>
                </div>
                <div class="col-lg-8 pl-lg-5">
                    <div class="row">
                        <% loop $NewsLists %>
                            <div class="col-lg-12<% if not $Last %> pb-lg-7<% end_if %>">
                                <div class="newslist-content">
                                    <% if $FeaturedImage %>
                                        <div class="newslist-content--img">
                                            <img src="{$FeaturedImage.URL}" class="mb-2" alt="{$SiteConfig.Title} - {$Name}">
                                        </div>
                                    <% end_if %>
                                    <div class="newslist-content--details">
                                        <div class="row">
                                            <div class="col-lg-2">
                                                <% if $NewsCategories %>
                                                    <% loop $NewsCategories %>
                                                        <span class="halyard-display fontsize30 font-weight-medium line-height-100">$Title</span>
                                                    <% end_loop %>
                                                <% end_if %>
                                            </div>
                                            <div class="col-lg-10 pr-lg-7">
                                                <p class="mb-3"><span class="halyard-display fontsize30 font-weight-medium line-height-100">{$Name}</span></p>
                                                <p><span class="halyard-display fontsize19 font-weight-book line-height-140">{$Content.LimitWordCount(35)}</span></p>
                                                <div class="newslist-content--link"><i class="fal fa-angle-right fontsize35"></i></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <hr class="mt-lg-5">
                            </div>
                        <% end_loop %>
                    </div>
                </div>
            </div>
        </div>
    <% end_if %>
</div>
