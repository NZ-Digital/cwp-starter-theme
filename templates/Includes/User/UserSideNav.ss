<section class="page-section sectionUserSideNav col-lg-4 pl-lg-7 pt-lg-9">
    <div class="userSideNav-container">
        <ul class="user-sidenav--links list-unstyled">
            <% loop $VisibleUserNavigation %>
                <li class=""><a href="$PageLink.Link"><span class="halyard-display fontsize20 font-weight-normal">$Name</span></a></li>
            <% end_loop %>
            <li class=""><a href="{$LogoutURL}&BackURL=login"><span class="halyard-display fontsize20 font-weight-normal">$Name</span></a></li>
        </ul>
    </div>
</section>
