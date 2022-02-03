<div class="mobile-nav">
    <div class="mobile-nav--container">
        <% include PreHeader %>
        <div class="mobile-nav--logo">
            <img src="$SiteConfig.LogoScrolled.URL" alt="$SiteConfig.Title">
        </div>
        <div class="mobile-nav--top align-items-center">
            <% if $VisibleSocials %>
                <ul class="socials">
                    <% loop $VisibleSocials %>
                        <li><a href="{$URL}" class="nav-link">{$Icon.RAW}</a></li>
                    <% end_loop %>
                </ul>
            <% end_if %>
            <ul class="user-nav ml-auto">
                <li><a href="<% if $CurrentUser %>{$LogoutURL}&BackURL=login<% else %>sign-up<% end_if %>" class="nav-link"><span class="text-uppercase moderna-sans"><% if $CurrentUser %>Sign Out<% else %>Sign up<% end_if %></span><img src="$resourceURL('themes/starter/images/SignUp.svg')"  class="link-icon" alt="$SiteConfig.Title - Signup Icon"></a></li>
                <li><a href="<% if $CurrentUser %>my-favourites<% else %>login<% end_if %>" class="nav-link <% if $CurrentUser %><% if $URLSegment == 'my-favourites'%>active<% end_if %><% end_if %>"><span class="text-uppercase moderna-sans"><% if $CurrentUser %>My Portal<% else %>Login<% end_if %></span><img src="$resourceURL('themes/starter/images/Login.svg')"  class="link-icon" alt="$SiteConfig.Title - Login Icon"></a></li>
                <li class="d-flex align-items-center">
                    <div class="hamburger-menu--mobile">
                        <div class="hamburger hamburger--slider hamburger--accessible" tabindex="0" aria-label="Menu" role="button" aria-controls="navigation">
                            <div class="hamburger-box">
                                <div class="hamburger-inner"></div>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
        <div class="mobile-nav--body">
            <ul class="nav navbar-nav" role="menubar">
<%--                <li class="d-sm-none d-block"><a href="<% if $CurrentUser %>{$LogoutURL}&BackURL=login<% else %>sign-up<% end_if %>" class="nav-link"><span class="text-uppercase moderna-sans font-weight-medium"><% if $CurrentUser %>Sign Out<% else %>Sign up<% end_if %></span><img src="$resourceURL('themes/starter/images/SignUp.svg')"  class="link-icon ml-2" alt="$SiteConfig.Title - Signup Icon"></a></li>--%>
<%--                <li class="d-sm-none d-block"><a href="<% if $CurrentUser %>my-favourites<% else %>login<% end_if %>" class="nav-link <% if $CurrentUser %><% if $URLSegment == 'my-favourites'%>active<% end_if %><% end_if %>"><span class="text-uppercase moderna-sans font-weight-medium"><% if $CurrentUser %>My Portal<% else %>Login<% end_if %></span><img src="$resourceURL('themes/starter/images/Login.svg')"  class="link-icon ml-2" alt="$SiteConfig.Title - Login Icon"></a></li>--%>
                <% loop Menu(1) %>
                    <li role="menuitem" class="nav-item $FirstLast $LinkingMode<% if $LinkingMode = current %> active<% end_if %><% if $Children %> dropdown <% end_if %>">
                        <a href="$Link" <% if $LinkingMode = current %>aria-current="page"<% end_if %> class="nav-link $LinkingMode"><span>$Title</span></a>
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
            <div class="pt-md-5 pb-md-4 pt-3 pb-2">
                <hr>
            </div>
        </div>
        <div class="mobile-nav--extra-menu">
            <div class="row no-gutters">
                <% loop $VisibleMobileMenuItems %>
                    <% if not $IsHeaderMenuFooter %>
                        <div class="{$Width}<% if $ReadablePaddings %><% loop $ReadablePaddings %> $Name<% end_loop %><% end_if %> $Type" <% if $BgColor %>style="background-color:#{$BgColor};"<% end_if %>>
                            $Content
                        </div>
                    <% end_if %>
                <% end_loop %>
            </div>
        </div>
        <div class="mobile-nav--footer">
            <div class="row no-gutters">
                <% loop $VisibleMobileMenuItems %>
                    <% if $IsHeaderMenuFooter %>
                        <div class="{$Width}<% if $ReadablePaddings %><% loop $ReadablePaddings %> $Name<% end_loop %><% end_if %> $Type" <% if $BgColor %>style="background-color:#{$BgColor};"<% end_if %>>
                            $Content
                        </div>
                    <% end_if %>
                <% end_loop %>
            </div>
        </div>
    </div>
</div>
