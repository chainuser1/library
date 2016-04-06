/**
 * Created by e2ps on 2/12/2016.
 */

jQuery.noConflict();
(function($) {
    $(function() {

       $(".model-books").click(function(){
            $("#library-modal").modal()
            $("#library-modal").show(1000).text("Loading...")

        });
        $(".cart-sling").click(function(){
            if(!$(this).hasClass('disabled')){
                $(this).addClass("disabled")
            }
        });
        $('[data-toggle="popover"]').popover();

    });
})(jQuery);
