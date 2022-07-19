<section class="sectionLatestNewsBanner page-section col-lg-12">
    <div class="latestNewsBanner-container">
        <div class="row no-gutters">
            <div class="col-lg-5<% if $ContentPosition == 'cp-left' %> order-last<% end_if %> order-lg-0 order-1">
                <% if $News.FeaturedImage %>
                    <div class="image-content--img bh-large bg-cover" style="background-image: url('{$News.FeaturedImage.URL}')"></div>
                <% end_if %>
            </div>
            <div class="col-lg-7<% if $ContentPosition == 'cp-left' %> order-first<% end_if %> order-lg-1 order-0">
                <div class="image-content--content bh-large" style="background-color:#F0EFED;">
                    <div class="content-tags pb-lg-4 pb-3">
                        <% loop $News.NewsCategories %>
                            <% if $Title != 'All' %>
                                <a href="news/?tag={$Title}"><span class="fontsize30 font-weight-medium text-scorpion">$Title</span></a>
                            <% end_if %>
                        <% end_loop %>
                    </div>
                    <div class="content-title pb-lg-6 pb-4"><p><span class="fontsize80 font-weight-light line-height-100">$News.Name</span></p></div>
                    <div class="content-author"><span class="text-footer-gray mr-1">by</span> <% loop $News.NewsAuthors %><a href="news/?author={$Title}"><span class="text-cod-gray">$Title</span></a><% if not $Last %>,&nbsp;<% end_if %><% end_loop %> <span class="text-light-gray ml-2">|</span> <span class="text-footer-gray ml-2">$News.Created.Ago</span></div>
                    <div class="content-body"><p class="fontsize19 font-weight-book"><% if $News.ContentSummary %>{$News.ContentSummary.LimitWordCount(60)}<% else %><% if $News.ContentSummaryRaw %>{$News.ContentSummaryRaw.RAW.LimitWordCount(60)}<% end_if %><% end_if %></p></div>
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
                                    <p><a href="news/?tag={$Title}#news-items"><span class="fontsize30 font-weight-medium text-scorpion">$Title</span></a></p>
                                <% end_loop %>
                            </div>
                        </div>
                        <hr style="border-color: #696163;">
                        <div class="filter--author mt-5 mb-7">
                            <p><span class="text-footer-gray">Sort by author</span></p>
                            <div class="filter-items pt-5">
                                <% loop $NewsAuthorLists %>
                                    <p><a href="news/?author={$Title}#news-items"><span class="fontsize30 font-weight-medium text-scorpion">$Title</span></a></p>
                                <% end_loop %>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8 pl-lg-10 pb-8">
                    <div class="news-content pb-7 font-weight-book fontsize19"><% if $News.Content %>$News.Content<% else %>$News.ContentRaw.RAW<% end_if %></div>
                    <% if $News.GalleryImages %>
                        <div class="article-gallery pb-5">
                            <% if $News.GalleryImages.Count > 2 %>
                            <div class="owl-carousel">
                                <% loop $News.GalleryImages %>
                                    <div class="gallery-image">
                                        <img src="$URL" alt="Listing gallery image">
                                    </div>
                                <% end_loop %>
                            </div>
                            <% else %>
                                <div class="row article-gallery">
                                    <% loop $News.GalleryImages %>
                                        <div class="col-lg-6">
                                            <div class="gallery-image">
                                                <img src="$URL" alt="Listing gallery image">
                                            </div>
                                        </div>
                                    <% end_loop %>
                                </div>
                            <% end_if %>
                        </div>
                    <% end_if %>
                    <div class="row no-gutters authors-bio">
                        <div class="col-12 p-0">
                            <div class="row no-gutters">
                                <div class="col-6 p-0">
                                    <% if $News.NewsAuthors %>
                                        <% loop $News.NewsAuthors %>
                                            <p><a href="news/?author=$Title#news-items"><span class="fontsize25 font-weight-medium">$Title</span></a></p>
                                        <% end_loop %>
                                    <% end_if %>
                                    <% if $News.AuthorBio %>
                                        $News.AuthorBio
                                    <% else %>
                                        <% if $News.AuthorBioRaw %>
                                            $News.AuthorBioRaw.RAW
                                        <% end_if %>
                                    <% end_if %>
                                    <% if $News.AuthorPage %>
                                        <p class="pt-4 pb-4"><a href="{$News.AuthorPage}"><span class="fontsize16 theme-button-yellow-small-arrow">Author's website</span></a></p>
                                    <% end_if %>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <div class="news-footer pt-5 row align-items-end">
                        <div class="col-lg-auto">
                            <div class="d-flex align-items-center">
                                <span class="text-uppercase fontsize25 font-weight-medium letterspacing-7px mr-4">Tags</span><% loop $News.NewsCategories %><% if $Title != "All" %><a href="news/?tag={$Title}#news-items"><span class="text-uppercase text-underline font-weight-semibold text-footer-gray">{$Title} +</span></a><% end_if %><% end_loop %>
                            </div>
                        </div>
                        <div class="col-lg-auto ml-auto">
                            <p class="pb-3 text-lg-right"><span class="text-footer-gray">Share this story</span></p>
                            <div class="share-socials">
                                <a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u={$AbsoluteLink}"><i class="fab fa-facebook-f"></i></a>
                                <a target="_blank" href="https://twitter.com/share?url={$AbsoluteLink}"><i class="fab fa-twitter"></i></a>
                                <a target="_blank" href="https://www.linkedin.com/shareArticle?mini=true&url={$AbsoluteLink}"><i class="fab fa-linkedin-in"></i></a>
                            </div>
                        </div>
                        <div class="col-lg-12 pt-6">
                            <p><a href="news"><span class="theme-button">Back to all news</span></a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
