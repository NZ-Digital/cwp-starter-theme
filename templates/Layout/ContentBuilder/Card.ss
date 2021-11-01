<div class="card-container">
    <% if $VisibleCardItems %>
    <div class="row no-gutters">
        <% loop $VisibleCardItems %>
            <div class="{$CardWidth}<% loop $ReadableCardPaddings %> $Name<% end_loop %>">
              $Content
            </div>
        <% end_loop %>
    </div>
    <% end_if %>
</div>
