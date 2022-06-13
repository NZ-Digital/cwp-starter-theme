<% if $ListingForm %>
    <section class="page-section sectionUserSideNav col-lg-4 pl-lg-7 pt-lg-9 pb-lg-9<% if $GroupIDFromParam == "1" %> group-wo<% end_if %><% if $GroupIDFromParam == "2" %> group-cd<% end_if %><% if $GroupIDFromParam == "3" %> group-cs<% end_if %>" <% if $GroupIDFromParam == "1" %>style="background-color: #F8CC46;"<% end_if %><% if $GroupIDFromParam == "2" %>style="background-color: #696163;"<% end_if %><% if $GroupIDFromParam == "3" %>style="background-color: #141414;"<% end_if %>>
        <div class="userSideNav-container<% if $Success %> success-form<% end_if %> pl-lg-1">
            <% with $ListingForm %>
                <% include MultiFormProgressList %>
            <% end_with %>

            <ul class="user-sidenav--links list-unstyled">
                <%--            <li class="user-sidenav--step"><a href="#" class="text-white"><div class="user-sidenav--btn-progress active"></div><span class="halyard-display fontsize15font-weight-medium letterspacing-5px text-uppercase">Sign Up</span></a></li>--%>
                <%--            <li class="user-sidenav--step"><a href="#" class="text-white"><div class="user-sidenav--btn-progress"></div><span class="halyard-display fontsize15 font-weight-medium letterspacing-5px text-uppercase">Favourites</span></a></li>--%>
                <li class="user-sidenav--step"><a class="text-white text-decoration-none"><div class="user-sidenav--btn-progress"></div><span class="halyard-display fontsize15 font-weight-medium letterspacing-5px text-uppercase">Review and Submit</span></a></li>
            </ul>
        </div>
    </section>
    <section class="page-section sectionCreateListForm col-lg-8 pt-lg-9 pb-lg-9 inner-padding--right">
        <div class="sectionCreateList-container">
            <div class="form-container pl-lg-8 position-relative">
                $ListingForm
                <% if $Success %>
                    <div class="modal fade show" id="modal-success" tabindex="-1" role="dialog" aria-labelledby="modal-success" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <% if $GroupIDFromParam == "1" %>
                                        $SiteConfig.CreateListingMessageSuccess
                                    <% end_if %>
                                    <% if $GroupIDFromParam == "2" %>
                                        $SiteConfig.CreateListingCreativeMessageSuccess
                                    <% end_if %>
                                    <% if $GroupIDFromParam == "3" %>
                                        $SiteConfig.CreateListingSpaceMessageSuccess
                                    <% end_if %>
                                </div>
                            </div>
                        </div>
                    </div>
                <% end_if %>
                <% if $ListActivate %>
                    <div class="modal fade show create-listing--modal" id="modal-success" tabindex="-1" role="dialog" aria-labelledby="modal-success" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <% if $GroupIDFromParam == "1" %>
                                        $SiteConfig.WhatsOnListingActivateMessage
                                    <% end_if %>
                                    <% if $GroupIDFromParam == "2" %>
                                        $SiteConfig.CreativeListingActivateMessage
                                    <% end_if %>
                                    <% if $GroupIDFromParam == "3" %>
                                        $SiteConfig.FindSpaceListingActivateMessage
                                    <% end_if %>
                                </div>
                            </div>
                        </div>
                    </div>
                <% end_if %>
                <% if $ListDraft %>
                    <div class="modal fade show create-listing--modal" id="modal-success" tabindex="-1" role="dialog" aria-labelledby="modal-success" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <% if $GroupIDFromParam == "1" %>
                                        $SiteConfig.WhatsOnListingDraftMessage
                                    <% end_if %>
                                    <% if $GroupIDFromParam == "2" %>
                                        $SiteConfig.CreativeListingDraftMessage
                                    <% end_if %>
                                    <% if $GroupIDFromParam == "3" %>
                                        $SiteConfig.FindSpaceListingDraftMessage
                                    <% end_if %>
                                </div>
                            </div>
                        </div>
                    </div>
                <% end_if %>
            </div>
        </div>
    </section>
<% end_if %>

