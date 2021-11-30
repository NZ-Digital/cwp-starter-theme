<section class="page-section sectionUserSideNav col-lg-4 pl-lg-7 pt-lg-9 pb-lg-9">
    <div class="userSideNav-container">
        <ul class="user-sidenav--links list-unstyled">
            <% loop $VisibleUserNavigation %>
                <li class="mb-2"><a href="$PageLink.Link" class="<% if $Up.URLSegment == $PageLink.URLSegment %>active<% end_if %>"><span class="halyard-display fontsize20 font-weight-medium lineheight-30px">$Name</span></a></li>
            <% end_loop %>
            <li class=""><a href="{$LogoutURL}&BackURL=login"><span class="halyard-display fontsize20 font-weight-medium lineheight-30px">Logout</span></a></li>
        </ul>
    </div>
</section>
