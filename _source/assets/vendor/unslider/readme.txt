http://unslider.com/


How to use Unslider
Include jQuery and Unslider
To use Unslider, you’ll need to make sure both the Unslider and jQuery scripts are included. If you’ve already got jQuery (you can test by opening your JavaScript console and typing !!window.jQuery — if it says true, you have jQuery), you don’t need to add the first line.
<script src="//code.jquery.com/jquery-latest.min.js"></script>
<script src="//unslider.com/unslider.min.js"></script>
Ready your HTML
Unslider doesn’t need any really awkward markup. In fact, all you need is a div and an unordered list. An example of some Unslider-friendly HTML is on the right.
You can add as many slides as you want: the example on the right just has three for the sake of brevity, but Unslider won’t work properly with one slide (but then it’s just a box).
<div class="banner">
    <ul>
        <li>This is a slide.</li>
        <li>This is another slide.</li>
        <li>This is a final slide.</li>
    </ul>
</div>
Make it pretty
You can change, add, and remove as much CSS per slide as you want, but there is a barebones style required by Unslider. It’s on the right (change the class name where .banner is the name of your slider).
.banner { position: relative; overflow: auto; }
    .banner li { list-style: none; }
        .banner ul li { float: left; }
Plug it all together
We’ve been through so much together, and I’m pleased to say the finish line is near. Our journey is almost over, just one more thing left to do. The JavaScript is on the right (make sure to put it in a script tag, and change .banner to whatever your slider’s element is).
$(function() {
    $('.banner').unslider();
});
Options
Although it’s lightweight, Unslider comes with a range of options to customise your slider. Here’s the default options provided. You can add, remove, or completely skip out the options object. It’s up to you.
$('.banner').unslider({
	speed: 500,               //  The speed to animate each slide (in milliseconds)
	delay: 3000,              //  The delay between slide animations (in milliseconds)
	complete: function() {},  //  A function that gets called after every slide animation
	keys: true,               //  Enable keyboard (left, right) arrow shortcuts
	dots: true,               //  Display dot navigation
	fluid: false              //  Support responsive design. May break non-responsive designs
});



Touch support
If you want to add mobile/touch/swipe/whatever support to Unslider, you’ll need to include the jQuery.event.swipe plugin, then it’ll work out the box. Easy!



Adding previous/next links
A feature that’s often requested in Unslider, but isn’t included in-the-box, is previous/next links. Luckily, they’re easy enough to add with a little script, which utilises Unslider’s methods.
<!-- The HTML -->
<a href="#" class="unslider-arrow prev">Previous slide</a>
<a href="#" class="unslider-arrow next">Next slide</a>

<!-- And the JavaScript -->
<script>
    var unslider = $('.banner').unslider();
    
    $('.unslider-arrow').click(function() {
        var fn = this.className.split(' ')[1];
        
        //  Either do unslider.data('unslider').next() or .prev() depending on the className
        unslider.data('unslider')[fn]();
    });
</script>



Accessing Unslider properties
Using jQuery’s wonderful data method, you can access and manually override any methods. Here’s a list of what you can do:
var slidey = $('.banner').unslider(),
    data = slidey.data('unslider');
    
//  Start Unslider
data.start();

//  Pause Unslider
data.stop();

//  Move to a slide index, with optional callback
data.move(2, function() {});
//  data.move(0);

//  Manually enable keyboard shortcuts
data.keys();

//  Move to the next slide (or the first slide if there isn't one)
data.next();

//  Move to the previous slide (or the last slide if there isn't one)
data.prev();

//  Append the navigation dots manually
data.dots();