<div class="latestNewsBanner-container">
    <div class="row no-gutters">
        <div class="col-lg-5<% if $ContentPosition == 'cp-left' %> order-last<% end_if %>" >
            <% if $News.FeaturedImage %>
                <div class="image-content--img $ImageHeight $ImageSize" style="background-image: url('{$News.FeaturedImage.URL}')"></div>
            <% end_if %>
        </div>
        <div class="col-lg-7<% if $ContentPosition == 'cp-left' %> order-first<% end_if %>">
            <div class="image-content--content $ImageHeight"style="<% if $ContentBg %> background-image: url('{$ContentBg.URL}'); <% end_if %><% if $ContentBgColor %>background-color:#{$ContentBgColor};<% end_if %>" >
                <div class="content-tags">
                    <% loop $News.NewsCategories %>
                        <% if $Title != 'All' %>
                            <a href="news/?tag={$Title}#news-lists"><span class="fontsize30 font-weight-medium text-scorpion">$Title</span></a>
                        <% end_if %>
                    <% end_loop %>
                </div>
                <div class="content-title"><p><span class="fontsize80 font-weight-light line-height-100">$News.Name</span></p></div>
                <div class="content-author"><span class="text-footer-gray mr-1">by</span> <% loop $News.NewsAuthors %><a href="news/?author={$Title}#news-lists"><span class="text-cod-gray mr-2">$Title</span></a><% if not $Last %>,<% end_if %><% end_loop %> <span class="text-light-gray">|</span> <span class="text-footer-gray ml-2">$News.Created.Ago</span></div>
                <div class="content-body"><p class="fontsize19 font-weight-book">$News.ContentSummary.LimitWordCount(60)</p></div>
                <% if $News.Page %>
                    <div class="content-body"><p class="fontsize16 font-weight-medium"><a href="$News.Page.Link" class="d-flex"><span class="theme-button-white-arrow-small">Read More</span></a></p></div>
                <% end_if %>
            </div>
        </div>
    </div>
</div>
