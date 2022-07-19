<div class="filteredNews-container">
    <div class="row">
        <div class="col-lg-3 pb-lg-10 mb-lg-10">
            <div class="filter">
                <div class="filter--categories mb-6">
                    <p><span class="text-footer-gray">Sort by categories</span></p>
                    <div class="filter-items pt-4">
                        <p><a href="news/?tag=All#news-items"><span class="fontsize30 font-weight-medium text-scorpion">All</span></a></p>
                        <% loop $NewsCategories %>
                            <% if $Title != 'All' %>
                                <p><a href="news/?tag={$Title}#news-items"><span class="fontsize30 font-weight-medium text-scorpion">$Title</span></a></p>
                            <% end_if %>
                        <% end_loop %>
                    </div>
                </div>
                <hr style="border-color: #696163;">
                <div class="filter--author mt-5 mb-6">
                    <p><span class="text-footer-gray">Sort by author</span></p>
                    <div class="filter-items pt-4">
                        <% loop $NewsAuthorLists %>
                            <p><a href="news/?author={$Title}#news-items"><span class="fontsize30 font-weight-medium text-scorpion">$Title</span></a></p>
                        <% end_loop %>
                    </div>
                </div>
                <hr style="border-color: #696163;">
            </div>
        </div>
        <div class="col-lg-9 pl-lg-10 position-static" id="news-items">
            <% if $Content %>
                <div class="intro-content">$Content</div>
            <% end_if %>
            <div class="row">
                <% if $NewsLists %>
                    <% loop $NewsLists %>
                        <div class="col-lg-12<% if not $Last %> pb-6 <% else %> pb-5<% end_if %> news-item">
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
                                            <p><a href="<% if $Page %>$Page.Link<% else %>#<% end_if %>" class="text-decoration-none"><span class="halyard-display fontsize19 font-weight-book line-height-140 text-scorpion"><% if $ContentSummary %>{$ContentSummary.LimitWordCount(60)}<% else %><% if $ContentSummaryRaw %>{$ContentSummaryRaw.RAW.LimitWordCount(60)}<% end_if %><% end_if %></span></a></p>
                                            <div class="newslist-content--link"><i class="fal fa-angle-right fontsize35 text-scorpion"></i></div>
                                        </div>
                                    </div>
                                </div>
                                <% if $FeaturedImage %>
                                    <div class="featured-news--img"><img src="$FeaturedImage.URL" alt="$SiteConfig.Title - News - {$Title}"></div>
                                <% end_if %>
                            </div>
                            <hr class="mt-5" style="border-color: #696163;">
                        </div>
                    <% end_loop %>
                    <% if $NewsLists.Count > 4 %>
                        <div class="col-lg-6 pt-lg-5 text-lg-left mobile-bottom-padding tablet-bottom-padding text-center">
                            <p><a href="#" class="loadmore-news"><span class="halyard-display fontsize18 theme-button-hover-dark">Load more</span></a></p>
                        </div>
                    <% end_if %>
                <% else %>
                <div class="col-lg-12<% if not $Last %> pb-6 <% else %> pb-5<% end_if %> news-item">
                    <p class="fontsize20 font-weight-medium">0 items found.</p>
                </div>
                <% end_if %>
            </div>
        </div>
    </div>
</div>

