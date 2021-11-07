<div class="listings-content">
    <% loop $Groups %>
        $groupName <br>
        <% loop $Listings %>
           $Name <button class="tester" data-id="{$ListingID}">Delete</button><br>
        <% end_loop %>
        <hr>
    <% end_loop %>
</div>
