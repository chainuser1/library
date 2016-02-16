/**
 * Created by e2ps on 2/12/2016.
 */
jQuery.noConflict();
(function($) {
    $(function() {
        // by passing the $ you can code using the $ alias for jQuery
        //alert('Page: ' + $('title').html() + ' dom loaded!');
        $(".model-books").click(function(){
            $("#library-modal").modal()
        });
        //alert("Hello");
    });
})(jQuery);
