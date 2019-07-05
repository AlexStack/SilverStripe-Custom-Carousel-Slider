# SilverStripe Custom Carousel Slider

- Add a Custom Carousel Slider to any page for SilverStripe. Multiple built-in slider template ready to use. Very easily to custom your own slider .ss template.

# How to install

```php
composer require alexstack/silverstripe-custom-carousel-slider
```

# How to enable the Custom Carousel Slider
!['image'](docs/images/enable-slider.png)

# How to add slider images
- You should upload slider images with the same height & width for better visual effect
- You may want to set up some special css style to make your slider looks better

!['image'](docs/images/add-slider-images.png)

# How to change built-in slider template or disable slider(Not display)
!['image'](docs/images/built-in-slider-template.png)


# <a name="your-own-slider-ss"></a>Use your own .ss template for the slider
- Example: Copy vendor/alexstack/silverstripe-custom-carousel-slider/templates/SSCustomCarouselSlider/BootstrapSlider001.ss to your-theme/Includes/my-bootstrap-slider.ss , change the slider codes inside to what you want. Just keep the variable name the same.
!['image'](docs/images/use-your-own-ss.png)

# <a name="custom-style-for-your-slider"></a>How to custom the style of the built-in slider
- Follow above step to copy one of the built-in slider templates and rename to your-own-slider.ss
- Go to below slider document page for more custom style options:
    - [BootstrapSlider001.ss dev document for options](https://getbootstrap.com/docs/4.1/components/carousel)
    - [BxSlider001.ss dev document for options](https://github.com/stevenwanderski/bxslider-4/blob/master/readme.md)
    - [FlexSlider001.ss dev document for options](https://github.com/woocommerce/FlexSlider/blob/master/README.md)
    - [SlickSlider001.ss dev document for options](https://github.com/kenwheeler/slick/blob/master/README.markdown)
    - [LightSlider001.ss dev document for options](http://sachinchoolur.github.io/lightslider/index.html)
    - [OwlCarousel001.ss dev document for options](https://owlcarousel2.github.io/OwlCarousel2/demos/demos.html)
- Also, you are free to use any other carousel slider code you want in your own template  

# Where to display the slider?
- You can choose to display the slider before or after the main content. It will append the slider to the $Content variable
- You can also manually insert a variable $showCustomerSlider to any page template. eg. Page.ss, ProductPage.ss, ContactUsPage.ss
- Example below: we want the slider show under the Header.ss but above the $Title of the Layout/Page.ss
!['image'](docs/images/add-slider-to-any-place.png)

# Example of display before content (at the top of main content)
!['image'](docs/images/display-slider-before-content.png)

# Example of display after content (at the bottom of main content)
!['image'](docs/images/display-slider-after-content.png)


# Thanks
- Inspired by I-lateral's carousel

# License
- BSD-3-Clause