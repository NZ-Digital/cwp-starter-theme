<div class="main-nav ml-auto">
    <nav class="navbar navbar-expand-md navbar-light bg-white" aria-label="<%t CWP_Theme.MAIN 'Main' %>" role="navigation">
        <div class="container">
            <div class="collapse navbar-collapse" id="navbar-collapse">
                <div class="d-block d-md-none border-bottom border-top">
                    <form class="form-inline" action="/search/SearchForm">
                        <% include HeaderSearch ExtraClass="col-12 pt-2 pb-2" %>
                    </form>
                </div>
                <ul class="nav navbar-nav" role="menubar">
                    <% loop Menu(1) %>
                        <li role="menuitem" class="nav-item $FirstLast $LinkingMode<% if $LinkingMode = current %> active<% end_if %><% if $Children %> dropdown <% end_if %>">
                            <a href="$Link" <% if $LinkingMode = current %>aria-current="page"<% end_if %> class="nav-link $LinkingMode">$MenuTitle.XML</a>

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
                    <li><a href="#" class="nav-link"><span class="text-uppercase moderna-sans">Sign up</span><img src="$resourceURL('themes/starter/images/signUp.svg')"  class="link-icon" alt="$SiteConfig.Title - Signup Icon"></a></li>
                    <li><a href="#" class="nav-link"><span class="text-uppercase moderna-sans">Login</span><img src="$resourceURL('themes/starter/images/login.svg')"  class="link-icon" alt="$SiteConfig.Title - Login Icon"></a></li>
                </ul>
            </div>
        </div>
    </nav>
</div>
