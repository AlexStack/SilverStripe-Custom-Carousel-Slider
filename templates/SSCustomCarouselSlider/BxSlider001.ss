<% require css("https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.css") %>

<% require javascript("https://code.jquery.com/jquery-3.2.1.slim.min.js") %>
<% require javascript("https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.js") %>
 
<%-- You can remove above CSS or Javascript if you already imported it somewhere --%>


<!-- BxSlider template from SSCustomCarouselSlider -->

<div id="CustomSlider-$ID">
    <% loop $CustomSliderImages %>
        <div class="BxSlider-item <% if $First %>active<% end_if %>">
            <img
                class="d-block w-100"
                src="$Image.URL"
                alt="$Image.Title"
            />
            <% if Title %>
                <div class="carousel-caption">
                    <% if $LinkTo %>
                        <h3><a href="$LinkTo">$Title.RAW</a></h3>
                    <% else %>
                        <h3>$Title.RAW</h3>
                    <% end_if %>
                    <div class="mb-3 caption-content">$Content.RAW</div>
                </div>
            <% end_if %>
        </div>
    <% end_loop %>
</div>


<script>
$(document).ready(function(){
    $('#CustomSlider-$ID').bxSlider({
    captions: true,
    //slideWidth: 600
  });
});
</script>

<!-- End of the SSCustomCarouselSlider -->
