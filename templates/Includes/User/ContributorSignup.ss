<section class="page-section sectionUserSideNav col-lg-4 pl-lg-7 pt-lg-9" style="background-color: #65AF8E;">
    <div class="userSideNav-container pl-lg-1">
        <ul class="user-sidenav--links list-unstyled">
            <li class="user-sidenav--step"><a href="become-a-contributor-form" class="text-white"><div class="user-sidenav--btn-progress active"></div><span class="halyard-display fontsize15 font-weight-medium letterspacing-5px text-uppercase">Contributor Sign Up</span></a></li>
            <li class="user-sidenav--step"><a class="text-white text-decoration-none"><div class="user-sidenav--btn-progress"></div><span class="halyard-display fontsize15 font-weight-medium letterspacing-5px text-uppercase">Confirmation</span></a></li>
        </ul>
    </div>
</section>
<section class="page-section sectionContributorSignup col-lg-8 pt-lg-9 pb-lg-9 pr-lg-6">
    <div class="registrationForm-container">
        <div class="form-container pl-lg-8 position-relative">
            <div class="row m-0">
                <div class="col-lg-12"><p class="form-header"><span>Join the community!</span></p></div>
                <div class="col-lg-12 pt-lg-5 pb-lg-4"><p class="form-subheader"><span>Sign up to become a contributor and create What’s On, Creative Directory and Find a space listings.</span></p></div>
                <div class="col-lg-6 pt-5 d-lg-block d-none"><p>&nbsp;</p></div>
                <div class="col-lg-6 pt-lg-5 pt-4 pb-lg-0 pb-5"><a href="sign-up" id="RegistrationForm_RegistrationForm_action_next" class="action theme-button-long-yellow-arrow text-left"><span class="fontsize-16 font-weight-medium">Join Te Wāhi Toi</span></a></div>
                <% if not $CurrentMember %>
                    <div class="col-lg-12 pt-5 pb-5"><p class="text-footer-gray">Already a portal member? <a href="become-a-contributor-form" class="text-cod-gray text-underline">Login to your account</a> and select "Become a contributor’’ button at the top of your profile page.</p></div>
                <% end_if %>
            </div>
        </div>
    </div>
</section>
