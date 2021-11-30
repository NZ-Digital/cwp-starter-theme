<section class="sectionLatestNewsBanner page-section col-lg-12">
    <div class="latestNewsBanner-container">
        <div class="row no-gutters">
            <div class="col-lg-5<% if $ContentPosition == 'cp-left' %> order-last<% end_if %>" >
                <% if $News.FeaturedImage %>
                    <div class="image-content--img bh-large bg-cover" style="background-image: url('{$News.FeaturedImage.URL}')"></div>
                <% end_if %>
            </div>
            <div class="col-lg-7<% if $ContentPosition == 'cp-left' %> order-first<% end_if %>">
                <div class="image-content--content bh-large" style="background-color:#F0EFED;">
                    <div class="content-tags">
                        <% loop $News.NewsCategories %>
                            <% if $Title != 'All' %>
                                <a href="news/?tag={$Title}"><span class="fontsize30 font-weight-medium text-scorpion">$Title</span></a>
                            <% end_if %>
                        <% end_loop %>
                    </div>
                    <div class="content-title"><p><span class="fontsize80 font-weight-light line-height-100">$News.Name</span></p></div>
                    <div class="content-author"><span class="text-footer-gray mr-1">by</span> <% loop $News.NewsAuthors %><a href="news/?author={$Title}"><span class="text-cod-gray">$Title</span></a><% if not $Last %>,&nbsp;<% end_if %><% end_loop %> <span class="text-light-gray ml-2">|</span> <span class="text-footer-gray ml-2">$News.Created.Ago</span></div>
                    <div class="content-body"><p class="fontsize19 font-weight-book">$News.ContentSummary.LimitWordCount(80)</p></div>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="sectionNewsContent page-section col-lg-12 pt-lg-8 pb-lg-8 padding-left-100px padding-right-100px">
    <div class="container-fluid p-0">
        <div class="newsContent-container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="filter">
                        <div class="filter--categories mb-6">
                            <p><span class="text-footer-gray">Sort by categories</span></p>
                            <div class="filter-items pt-5">
                                <p><a href="news/?tag=All"><span class="fontsize30 font-weight-medium text-scorpion">All</span></a></p>
                                <% loop $NewsCategories %>
                                    <p><a href="news/?tag={$Title}#news-lists"><span class="fontsize30 font-weight-medium text-scorpion">$Title</span></a></p>
                                <% end_loop %>
                            </div>
                        </div>
                        <hr style="border-color: #696163;">
                        <div class="filter--author mt-5 mb-7">
                            <p><span class="text-footer-gray">Sort by author</span></p>
                            <div class="filter-items pt-5">
                                <% loop $NewsAuthorLists %>
                                    <p><a href="news/?author={$Title}#news-lists"><span class="fontsize30 font-weight-medium text-scorpion">$Title</span></a></p>
                                <% end_loop %>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8 pl-lg-10 pb-8">
                    <div class="news-content pb-5">$News.Content</div>
                    <hr>
                    <div class="news-footer pt-5 row">
                        <div class="col-lg-auto">
                            <div class="d-flex align-items-center">
                                <span class="text-uppercase fontsize25 font-weight-medium letterspacing-7px mr-4">Tags</span><% loop $News.NewsCategories %><% if $Title != "All" %><a href="news/?tag={$Title}#news-lists"><span class="text-uppercase text-underline font-weight-semibold text-footer-gray">{$Title} +</span></a><% end_if %><% end_loop %>
                            </div>
                        </div>
                        <div class="col-lg-auto">

                        </div>
                        <div class="col-lg-12 pt-7">
                            <p><a href="news"><span class="theme-button">Back to all news</span></a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
