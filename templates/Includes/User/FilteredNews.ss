<% loop $NewsLists %>
    <div class="col-lg-12<% if not $Last %> pb-lg-6 <% else %> pb-lg-5<% end_if %> news-item">
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
                        <p><a href="<% if $Page %>$Page.Link<% else %>#<% end_if %>" class="text-decoration-none"><span class="halyard-display fontsize19 font-weight-book line-height-140 text-scorpion"> <% if $ContentSummary %>{$ContentSummary.LimitWordCount(60)}<% else %><% if $ContentSummaryRaw %>{$ContentSummaryRaw.Raw.LimitWordCount(60)}<% end_if %><% end_if %></span></a></p>
                        <div class="newslist-content--link"><i class="fal fa-angle-right fontsize35 text-scorpion"></i></div>
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
<% if $NewsLists.Count > 4 %>
<div class="col-lg-6 pt-5 text-center text-sm-left">
    <p><a href="#" class="loadmore-news"><span class="halyard-display fontsize18 theme-button-hover-dark">Load more</span></a></p>
</div>
<% end_if %>
