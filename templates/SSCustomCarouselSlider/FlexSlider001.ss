<% require css("https://cdnjs.cloudflare.com/ajax/libs/flexslider/2.7.2/flexslider.min.css") %>


<% require javascript("https://code.jquery.com/jquery-3.2.1.slim.min.js") %>
<% require javascript("https://cdnjs.cloudflare.com/ajax/libs/flexslider/2.7.2/jquery.flexslider.min.js") %>
 
<%-- You can remove above CSS or Javascript if you already imported it somewhere --%>

<!-- FlexSlider template from SSCustomCarouselSlider -->

<div id="CustomSlider-$ID">
<ul class="slides">
    <% loop $CustomSliderImages %>
        <li>
            <img
                class="d-block w-100"
                src="$Image.URL"
                alt="$Image.Title"
            ><div class="p-2 flex-caption">
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
        </li>
    <% end_loop %>
</ul>
</div>


<script>
$(document).ready(function(){
    $('#CustomSlider-$ID').flexslider({
    animation: "slide"
  });
});
</script>