<div class="latestNews-container">
    <% if $VisibleLatestNews %>
        <div class="container-fluid p-0">
            <div class="row no-gutters">
                <div class="align-self-center col-lg-4">
                </div>
                <div class="col-lg-8 padding-left-150px">
                    <div class="row">
                        <% loop $VisibleLatestNews %>
                            <div class="col-lg-12<% if not $Last %> pb-lg-7<% end_if %>">
                                <div class="newslist-content">
                                    <div class="newslist-content--details">
                                        <div class="row">
                                            <div class="col-lg-2">
                                                <div class="news-categories">
                                                    <% if $NewsCategories %>
                                                        <% loop $NewsCategories %>
                                                            <span class="halyard-display fontsize30 font-weight-medium text-scorpion line-height-100">$Title</span>
                                                        <% end_loop %>
                                                    <% end_if %>
                                                </div>
                                                <div class="news-date mt-3"><p><span class="text-footer-gray">$Created.Ago</span></p></div>
                                            </div>
                                            <div class="col-lg-10 pr-lg-7">
                                                <p class="mb-3"><a href="<% if $Page %>$Page.Link<% else %>#<% end_if %>"><span class="halyard-display fontsize30 font-weight-medium line-height-100 text-scorpion">{$Name}</span></a></p>
                                                <p><a href="<% if $Page %>$Page.Link<% else %>#<% end_if %>" class="text-decoration-none"><span class="halyard-display fontsize19 font-weight-book line-height-140 text-scorpion">{$ContentSummary.LimitWordCount(60)}</span></a></p>
                                                <div class="newslist-content--link"><i class="fal fa-angle-right fontsize35"></i></div>
                                            </div>
                                        </div>
                                    </div>
                                    <% if $FeaturedImage %>
                                        <div class="featured-news--img"><img src="$FeaturedImage.URL" alt="$SiteConfig.Title - News - {$Title}"></div>
                                    <% end_if %>
                                </div>
                                <hr class="mt-lg-5" style="border-color: #696163;">
                            </div>
                        <% end_loop %>
                    </div>
                </div>
            </div>
        </div>
    <% end_if %>
</div>
