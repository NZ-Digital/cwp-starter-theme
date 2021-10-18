<div class="container-fluid">
    <% if $VisibleFooterItems %>
    <div class="row no-gutters justify-content-between">
        <% loop $VisibleFooterItems %>
            <div class="{$Width}<% if $ReadablePaddings %><% loop $ReadablePaddings %> $Name<% end_loop %><% end_if %>">
                $Content
            </div>
        <% end_loop %>
<%--        <% if $Footer.Children %>--%>
<%--            <nav class="footer-nav-links col-auto" aria-label="<%t CWP_Theme.FOOTER 'Footer' %>" role="navigation">--%>
<%--                <% loop $Footer.Children %>--%>
<%--                    <a href="$Link" class="$LinkingMode <% if $LinkingMode = current %> active<% end_if %>">--%>
<%--                        $MenuTitle.XML--%>
<%--                    </a>--%>
<%--                <% end_loop %>--%>
<%--            </nav>--%>
<%--        <% end_if %>--%>

<%--        <% if $SiteConfig.FacebookURL || $SiteConfig.TwitterUsername %>--%>
<%--            <div class="footer-nav-links footer-social-links col-auto">--%>
<%--                <% if $SiteConfig.TwitterUsername %>--%>
<%--                    <a href="http://www.twitter.com/$SiteConfig.TwitterUsername">--%>
<%--                        <%t CWP_Footer.FollowOnTwitter "Follow us on Twitter" %></a>--%>
<%--                <% end_if %>--%>

<%--                <% if $SiteConfig.FacebookURL %>--%>
<%--                    <a href="http://www.facebook.com/$SiteConfig.FacebookURL">--%>
<%--                        <%t CWP_Footer.FollowOnFacebook "Follow us on Facebook" %></a>--%>
<%--                <% end_if %>--%>
<%--            </div>--%>
<%--        <% end_if %>--%>
    </div>
    <% end_if %>
    <div class="row row-cols-5 pt-lg-7 pb-lg-4">
        <div class="col">
            <p>
                <span class="halyard-display font-weight-medium text-footer-gray fontsize14">&copy; $Now.Year {$SiteConfig.Title}. All rights reserved.</span>
            </p>
        </div>
        <div class="col"></div>
        <div class="col"></div>
        <div class="col">
            <ul class="footer-menu">
                <li><a href="#"><span class="halyard-display font-weight-medium text-footer-gray fontsize14">Add an event</span></a></li>
                <li><a href="#"><span class="halyard-display font-weight-medium text-footer-gray fontsize14">Join the creative directory</span></a></li>
                <li><a href="#"><span class="halyard-display font-weight-medium text-footer-gray fontsize14">List a creative space</span></a></li>
            </ul>

        </div>
        <div class="col">
            <ul class="footer-secondarymenu">
                <li><a href="#"><span class="halyard-display font-weight-medium text-footer-gray fontsize14">Disclaimer</span></a></li>
                <li><a href="#"><span class="halyard-display font-weight-medium text-footer-gray fontsize14">Privacy Policy</span></a></li>
                <li><a href="#"><span class="halyard-display font-weight-medium text-footer-gray fontsize14">Terms of Service</span></a></li>
            </ul>
        </div>
    </div>
</div>
