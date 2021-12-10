<section class="page-section loginSection col-lg-12">
    <div class="container-fluid p-0">
        <div class="row align-items-center no-gutters">
            <div class="col-lg-5">
                <img src="$resourceURL('themes/starter/images/LoginFormImage.jpg')" class="bg-image w-100" alt="$SiteConfig.Title - ">
            </div>
            <div class="col-lg-7">
                <div class="form-container padding-right-150px padding-left-150px">
                    <p class="pt-lg-2 pb-lg-2 pl-3"><span class="fontsize35 font-weight-medium">Search Results</span></p>
                    $SearchForm
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
                                    <div class="col-sm-12 col-md-4 float-right search-results-results-page">
                                        <p class="text-muted">
                                            <%t CWP_Search.Pages "Displaying page {current} of {total}" current=$Results.CurrentPage total=$Results.TotalPages %>
                                        </p>
                                    </div>
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
                                <% loop $Results %>
                                    <article class="result listing__item mb-4" data-highlight="$Up.Query.ATT">
                                        <header>
                                            <h1 class="h3">
                                                <a href="$Link" title="$Title">$Title</a>
                                            </h1>
                                        </header>
<%--                                        $Content.Summary--%>
                                    </article>
                                <% end_loop %>
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
