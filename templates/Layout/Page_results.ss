<section class="page-section loginSection col-lg-12">
    <div class="container-fluid p-0">
        <div class="row no-gutters <% if not $Results %>align-items-center<% end_if %>">
            <div class="col-lg-5">
                <img src="$resourceURL('themes/starter/images/LoginFormImage.jpg')" class="bg-image w-100 <% if $Results %>h-100<% end_if %>" alt="$SiteConfig.Title - ">
            </div>
            <div class="col-lg-7">
                <div class="form-container padding-right-150px padding-left-150px pt-5 pb-5">
                    <p class="pt-lg-2 pb-lg-2 pl-3"><span class="fontsize35 font-weight-medium">Search Results for "{$Query}".</span></p>
<%--                    $SearchForm--%>
                    <% if $Query %>
                        <div class="page-summary clearfix mb-4">
                            <% if $Results %>
                                <% if $Original %>
                                    <div class="row search-results-no-result">
                                        <div class="col-md-12">
                                            <div class="alert alert-warning" role="alert">
                                                <%t CWP_Search.Original "No search results were found matching <strong>{original}</strong>." original=$Original %>
                                            </div>
                                        </div>
                                    </div>
                                <% end_if %>
                                <div class="row">
                                    <div class="col-sm-12 col-md-8 search-results-results-message">
                                        <p class="lead" tabindex="-1">
                                            <% if $Original %>
                                                <%t CWP_Search.ShowingResultsInsteadFor 'Showing results for "{query}" instead' query=$Query.XML %>
                                            <% else %>
                                                <%t CWP_Search.ShowingResultsFor 'Showing results for "{query}"' query=$Query.XML %>
                                            <% end_if %>
                                        </p>
                                    </div>
<%--                                    <div class="col-sm-12 col-md-4 float-right search-results-results-page">--%>
<%--                                        <p class="text-muted">--%>
<%--                                            <%t CWP_Search.Pages "Displaying page {current} of {total}" current=$Results.CurrentPage total=$Results.TotalPages %>--%>
<%--                                        </p>--%>
<%--                                    </div>--%>
                                </div>

                            <% else %>
                                <div class="row search-results-no-result">
                                    <div class="col-md-12">
                                        <p class="pt-lg-2 pb-lg-4 pl-3"><span class="fontsize25 font-weight-light">No results found.</span></p>
                                    </div>
                                </div>
                            <% end_if %>
                        </div>

                        <% if $Results %>
                            <div class="results listing">
                                <article class="result listing__item row">
                                    <% loop $Results %>
                                        <article class="col-6 grid-item" data-highlight="$Up.Query.ATT">
                                            <div class="listing-content mb-6">
                                                <% if $FeaturedImage %>
                                                    <div class="listing-content--img">
                                                        <a href="<% if $Page %>$Page.Link<% else %>#<% end_if %>">
                                                            <img src="{$FeaturedImage.URL}" class="mb-2" alt="{$SiteConfig.Title} - {$Name}">
                                                        </a>
                                                    </div>
                                                <% end_if %>
                                                <% if $City %>
                                                    <div class="listing-content--location">
                                                        <a href="/all-listings?city={$City}"><span class="text-footer-gray text-underline">$City</span></a>
                                                    </div>
                                                <% end_if %>
                                                <div class="listing-content--details" style="min-height: auto;">
                                                    <p class="mb-sm-3 mt-sm-4 mt-3 mb-2 listing-title"><a href="<% if $Page %>$Page.Link<% else %>#<% end_if %>"><span class="halyard-display fontsize19 font-weight-normal line-height-100">{$Name}</span></a></p>
                                                    <% if $ContentSummary %>
                                                        <p class="listing-text"><a href="<% if $Page %>$Page.Link<% else %>#<% end_if %>" class="text-decoration-none"><span class="halyard-display fontsize16 font-weight-book line-height-100">$ContentSummary.LimitWordCount(15)</span></a></p>
                                                    <% else %>
                                                        <% if $ContentSummaryRaw %>
                                                            <p class="listing-text"><a href="<% if $Page %>$Page.Link<% else %>#<% end_if %>" class="text-decoration-none"><span class="halyard-display fontsize16 font-weight-book line-height-100">$ContentSummaryRaw.RAW.LimitWordCount(15)</span></a></p>
                                                        <% else %>
                                                            <% if $ContentRaw %>
                                                                <p class="listing-text"><a href="<% if $Page %>$Page.Link<% else %>#<% end_if %>" class="text-decoration-none"><span class="halyard-display fontsize16 font-weight-book line-height-100">$ContentRaw.RAW.LimitWordCount(15)</span></a></p>
                                                            <% else %>
                                                                <p class="listing-text"><a href="<% if $Page %>$Page.Link<% else %>#<% end_if %>" class="text-decoration-none"><span class="halyard-display fontsize16 font-weight-book line-height-100">$Content.LimitWordCount(15)</span></a></p>
                                                            <% end_if %>
                                                        <% end_if %>
                                                    <% end_if %>
                                                </div>
                                                <div class="listing-content--tags">
<%--                                                    <button class="btn-utils addtofavourites fontsize35<% if $Up.Up.addedToFavourites($ID) %> active<% end_if %>" data-id="{$ID}" data-member="$Up.Up.addedToFavourites($ID)"><i class="<% if $Up.Up.addedToFavourites($ID) %>fas<% else %>far<% end_if %> fa-heart"></i></button>--%>
                                                    <% if $Category %>
                                                        <% include ListingCategory Category=$Category %>
                                                    <% end_if %>
                                                    <p class="ml-sm-auto ml-0 pt-sm-0 pt-3 w-auto d-sm-block d-none view-listing"><a href="<% if $Page %>$Page.Link<% else %>#<% end_if %>"><span class="theme-button-gray-small-arrow halyard-display font-weight-medium fontsize16">More info</span></a></p>
                                                </div>
                                            </div>
                                        </article>
                                        <% if not $Last %>
                                            <hr>
                                        <% end_if %>
                                    <% end_loop %>
                                </article>
<%--                                <% loop $Results %>--%>
<%--                                    <article class="result listing__item mb-4" data-highlight="$Up.Query.ATT">--%>
<%--                                        <header>--%>
<%--                                            <h1 class="h3">--%>
<%--                                                <a href="$Link" title="$Title">$Title</a>--%>
<%--                                            </h1>  --%>
<%--                                            <h1 class="h3">--%>
<%--                                                <a href="$Page.Link" title="$Title">$Page.Title</a>--%>
<%--                                            </h1>--%>

<%--                                            <p><% if $Content %><span class="fontsize16 text-footer-gray">$Content.LimitWordCount(15)</span><% else %><span class="fontsize16 text-footer-gray">$ContentRAW.LimitWordCount(15)</span><% end_if %></p>--%>
<%--                                            <p><% if $Town %>$Town<% else %>$City<% end_if %></p>--%>
<%--                                            <p>$Category.Title</p>--%>

<%--                                        </header>--%>
<%--                                        $Content.Summary--%>
<%--                                    </article>--%>
<%--                                <% end_loop %>--%>
                            </div>
                            <% with $Results %>
                                <% include Pagination %>
                            <% end_with %>
                        <% end_if %>
                    <% else %>
                        <div class="row search-results__empty-search">
                            <div class="col-md-12">
                                <p class="pt-lg-2 pb-lg-4 pl-3"><span class="fontsize25 font-weight-light">No results found.</span></p>
                            </div>
                        </div>
                    <% end_if %>
                </div>
            </div>
        </div>
    </div>
</section>

<%--<section class="sectionSearchForm col-lg-12 pt-7 inner-padding pb-7">--%>
<%--<div class="content search-results">--%>
<%--    <div class="container">--%>
<%--        <div class="row">--%>
<%--            <section class="col-lg-8 offset-lg-2">--%>
<%--                <div class="pb-2 mt-4 mb-4 pb-3 border-bottom">--%>
<%--                    <h1>$Title.XML</h1>--%>
<%--                </div>--%>
<%--            </section>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<%--</section>--%>
