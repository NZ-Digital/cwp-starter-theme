<% if $ListingForm %>
    <section class="page-section sectionUserSideNav col-lg-4 pl-lg-7 pt-lg-9 pb-lg-9" style="background-color: #EB6543;">
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
                    <div class="modal fade show position-absolute" id="modal-success" tabindex="-1" role="dialog" aria-labelledby="modal-success" aria-hidden="true" style="display: block;">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body text-center">
                                    <p class="mb-3"><span class="fontsize60 font-weight-light">Success!</span></p>
                                    <p class="mb-6"><span class="fontsize35 lineheight-40px font-weight-light">Thanks for submitting a local event!<br> We’ve sent you an email on what will next.</span></p>
                                    <p class="mb-3"><a href="home"><span class="theme-button-long font-weight-medium fontsize-18">Go back to Home</span></a></p>
                                    <p class="mb-3"><a href="my-favourites"><span class="theme-button-long font-weight-medium fontsize-18">Go back to My Favourites</span></a></p>
                                    <p class="mb-3"><a href="whats-on"><span class="theme-button-long font-weight-medium fontsize-18">Go back to What’s on</span></a></p>
                                </div>
                            </div>
                        </div>
                    </div>
                <% end_if %>
            </div>
        </div>
    </section>
<% end_if %>

