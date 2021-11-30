<% include VisibleSection %>
<section class="sectionLatestNews page-section col-lg-12 pt-lg-8 pb-lg-8 padding-left-100px padding-right-100px" id="news-lists">
    <div class="container-fluid p-0">
        <div class="latestNews-container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="filter">
                        <div class="filter--categories mb-6">
                            <p><span class="text-footer-gray">Sort by categories</span></p>
                            <div class="filter-items pt-5">
                                <p><a href="news/?tag=All#news-lists"><span class="fontsize30 font-weight-medium text-scorpion">All</span></a></p>
                                <% loop $NewsCategories %>
                                    <% if $Title != 'All' %>
                                        <p><a href="news/?tag={$Title}#news-lists"><span class="fontsize30 font-weight-medium text-scorpion">$Title</span></a></p>
                                    <% end_if %>
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
                <div class="col-lg-9 pl-lg-10">
                    <div class="row">
                        <% include Includes/User/FilteredNews %>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
