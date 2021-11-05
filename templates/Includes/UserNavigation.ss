<section class="page-section sectionUserNavigationBar col-lg-12">
    <div class="userNavigation-container">
        <div class="user-navigation">
            <% if $VisibleNavigationBarLinks %>
                <ul class="user-navigation--links">
                    <% loop $VisibleNavigationBarLinks %>
                        <% if $PageLink %>
                            <li class="<% if $Up.URLSegment == $PageLink.URLSegment %>active<% end_if %>"><a href="$PageLink.Link" <% if $Icon %>class="with-icon"<% end_if %>><span class="halyard-display fontsize20 font-weight-normal">$PageLink.Title</span> <% if $Icon %><img src="{$Icon.URL}" class="nav-icon" alt="$PageLink.Title - Navigation button icon"> <% end_if %></a></li>
                        <% end_if %>
                    <% end_loop %>
                </ul>
            <% end_if %>
            <div class="user-navigation--profile">
                <div class="user-profile d-flex align-items-center">
                    <span class="text-white fontsize20 halyard-display">Hi {$CurrentUser.FirstName}</span>
                    <% if $CurrentUser.ProfilePhoto %>
                        <img src="$CurrentUser.ProfilePhoto.URL" alt="$SiteConfig.Title - User photo">
                    <% else %>
                        <img src="https://ui-avatars.com/api/?name={$CurrentUser.Name}&background=f8cc46&color=414141&size=56" alt="$SiteConfig.Title - User photo">
                    <% end_if %>
                    <div class="dropdown">
                        <a class="btn btn-secondary dropdown-toggle user-navigation--dropdown" href="#" role="button" id="user-navigation--dropdown" data-toggle="dropdown" aria-expanded="false"><i class="fal fa-angle-down fontsize25"></i></a>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="user-navigation--dropdown">
                            <a class="dropdown-item" href="#"><span class="fontsize20 font-weight-medium">My Listings</span></a>
                            <a class="dropdown-item" href="#"><span class="fontsize20 font-weight-medium">Account settings</span></a>
                            <a class="dropdown-item" href="#"><span class="fontsize20 font-weight-medium">Resources</span></a>
                            <a class="dropdown-item" href="#"><span class="fontsize20 font-weight-medium">Submit a news article</span></a>
                            <a class="dropdown-item" href="#"><span class="fontsize20 font-weight-medium">Become a contributor</span></a>
                            <a class="dropdown-item" href="#"><span class="fontsize20 font-weight-medium">Ask for help</span></a>
                            <a class="dropdown-item" href="{$LogoutURL}&BackURL=login"><span class="fontsize20 font-weight-medium">Logout</span></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
