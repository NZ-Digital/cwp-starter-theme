<div class="main-nav ml-auto">
    <nav class="navbar navbar-expand-md navbar-light" aria-label="<%t CWP_Theme.MAIN 'Main' %>" role="navigation">
        <div class="container-fluid p-0">
            <div class="collapse navbar-collapse" id="navbar-collapse">
<%--                <div class="d-block d-md-none border-bottom border-top">--%>
<%--                    <form class="form-inline" action="/search/SearchForm">--%>
<%--                        <% include HeaderSearch ExtraClass="col-12 pt-2 pb-2" %>--%>
<%--                    </form>--%>
<%--                </div>--%>
                <ul class="nav navbar-nav" role="menubar">
                    <% loop Menu(1) %>
                        <li role="menuitem" class="nav-item $FirstLast $LinkingMode<% if $LinkingMode = current %> active<% end_if %><% if $Children %> dropdown <% end_if %>">
                            <a href="$Link" <% if $LinkingMode = current %>aria-current="page"<% end_if %> class="nav-link $LinkingMode"><span>$MenuTitle.XML</span></a>

                            <% if $Children %>
                                <button class="btn btn-link float-right navbar-touch-caret" aria-haspopup="true" aria-expanded="false" data-toggle="dropdown">
                                    <span class="sr-only"><%t CWP_Theme.DISPLAY_SUBMENU_PAGES "Display {count} submenu pages" count=$MenuTitle.XML %></span>
                                    <i class="fa fa-caret-down" aria-hidden="true"></i>
                                </button>

                                <ul class="dropdown-menu" role="menu" aria-hidden="true">
                                    <% loop $Children %>
                                        <li role="menuitem" class="<% if $LinkingMode = current %>active <% end_if %>">
                                            <a class="dropdown-item" role="menuitem" href="$Link" <% if $LinkingMode = current %>aria-label="current page" <% end_if %>>
                                                $MenuTitle.XML
                                            </a>
                                        </li>
                                    <% end_loop %>
                                </ul>
                            <% end_if %>
                        </li>
                    <% end_loop %>
                </ul>
                <ul class="user-nav">
                    <li><a href="<% if $CurrentUser %>{$LogoutURL}&BackURL=login<% else %>sign-up<% end_if %>" class="nav-link"><span class="text-uppercase moderna-sans"><% if $CurrentUser %>Sign Out<% else %>Sign up<% end_if %></span><img src="$resourceURL('themes/starter/images/SignUp.svg')"  class="link-icon" alt="$SiteConfig.Title - Signup Icon"></a></li>
                    <li><a href="<% if $CurrentUser %>my-favourites<% else %>login<% end_if %>" class="nav-link <% if $CurrentUser %><% if $URLSegment == 'my-favourites'%>active<% end_if %><% end_if %>"><span class="text-uppercase moderna-sans"><% if $CurrentUser %>My Portal<% else %>Login<% end_if %></span><img src="$resourceURL('themes/starter/images/Login.svg')"  class="link-icon" alt="$SiteConfig.Title - Login Icon"></a></li>
                </ul>
                <ul class="util-nav align-items-center">
                    <li><a href="my-favourites" class="nav-link nav-favourites"><i class="far fa-heart "></i><% if $CurrentUser %><span class="fav-counter<% if $CountFavourites %> filled<% end_if %>" data-count="$CountFavourites">$CountFavourites</span><% end_if %></a></li>
                    <li><button class="nav-link nav-search"><i class="fas fa-search"></i></button></li>
<%--                    <img src="$resourceURL('themes/starter/images/header-search.svg')"  class="link-icon align-text-bottom" alt="$SiteConfig.Title - Search Icon">--%>
                </ul>
                <% if $VisibleSocials %>
                    <ul class="socials">
                        <% loop $VisibleSocials %>
                            <li><a href="{$URL}" class="nav-link" target="_blank">{$Icon.RAW}</a></li>
                        <% end_loop %>
                    </ul>
                <% end_if %>

                <div class="hamburger-menu--mobile">
                    <div class="hamburger hamburger--slider hamburger--accessible" tabindex="0" aria-label="Menu" role="button" aria-controls="navigation">
                        <div class="hamburger-box">
                            <div class="hamburger-inner"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </nav>
</div>
