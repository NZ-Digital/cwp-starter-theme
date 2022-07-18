<div class="contactForm-container">
    <div class="row no-gutters">
        <% if $Content %>
            <div class="col-lg-5">
                $Content
            </div>
        <% end_if %>
        <div class="col-lg-7 pt-5">
            <% if  $ExtraContent %>
                <div class="extra-content">$ExtraContent</div>
            <% end_if %>
            <% if $Success %>
                <div class="alert alert-success" role="alert">
                   Your message has been sent successfully.
                </div>
            <% end_if %>
           $ContactForm
        </div>
    </div>
</div>
