<div class="card-container">
    <% if $VisibleCardItems %>
    <div class="row no-gutters">
        <% loop $VisibleCardItems %>
            <div class="{$CardWidth}">
                <div class="<% loop $ReadableCardPaddings %> $Name<% end_loop %>">$Content</div>
            </div>
        <% end_loop %>
    </div>
    <% end_if %>
</div>
