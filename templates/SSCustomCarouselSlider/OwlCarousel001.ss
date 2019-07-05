<% require css("https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css") %>
<% require css("https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css") %>


<% require javascript("https://code.jquery.com/jquery-3.2.1.min.js") %>
<% require javascript("https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js") %>
 
<%-- You can remove above CSS or Javascript if you already imported it somewhere --%>


<!-- OwlCarousel2 template from SSCustomCarouselSlider -->

<div id="CustomSlider-$ID" class="owl-carousel owl-theme">
    <% loop $CustomSliderImages %>
        <div class="item <% if $First %>active<% end_if %>">
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
    $('#CustomSlider-$ID').owlCarousel({
        loop:true,
        center: true,
        margin:10,
        nav:true,
        autoWidth:true,
        autoplay:true,
        autoplayTimeout:5000,
        autoplayHoverPause:true,   
        // animateOut: 'slideOutDown',
        // animateIn: 'flipInX',
        items:1,
        margin:5,
        stagePadding:30,
        smartSpeed:450
    });
});
</script>

<!-- End of the SSCustomCarouselSlider -->
