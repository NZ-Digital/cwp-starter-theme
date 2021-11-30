<% if $RegistrationForm %>
<section class="page-section sectionUserSideNav col-lg-4 pl-lg-7 pt-lg-9" style="background-color: #3E519F;">
    <div class="userSideNav-container<% if $Success %> success-form<% end_if %> pl-lg-1">
        <% with $RegistrationForm %>
            <% include MultiFormProgressList %>
        <% end_with %>

        <ul class="user-sidenav--links list-unstyled">
<%--            <li class="user-sidenav--step"><a href="#" class="text-white"><div class="user-sidenav--btn-progress active"></div><span class="halyard-display fontsize15font-weight-medium letterspacing-5px text-uppercase">Sign Up</span></a></li>--%>
<%--            <li class="user-sidenav--step"><a href="#" class="text-white"><div class="user-sidenav--btn-progress"></div><span class="halyard-display fontsize15 font-weight-medium letterspacing-5px text-uppercase">Favourites</span></a></li>--%>
            <li class="user-sidenav--step"><a class="text-white text-decoration-none"><div class="user-sidenav--btn-progress"></div><span class="halyard-display fontsize15 font-weight-medium letterspacing-5px text-uppercase">Confirmation</span></a></li>
        </ul>
    </div>
</section>

<section class="page-section sectionRegistrationForm col-lg-8 pt-lg-9 pb-lg-9 inner-padding--right">
    <div class="registrationForm-container">
        <div class="form-container pl-lg-8 position-relative">
            $RegistrationForm
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
                                $SiteConfig.UserRegistrationMessageSuccess
                            </div>
                        </div>
                    </div>
                </div>
            <% end_if %>
        </div>
    </div>
</section>
<% end_if %>

