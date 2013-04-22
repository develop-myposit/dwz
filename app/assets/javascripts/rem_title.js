(function($){
  $.fn.hideTips = function(){
      return this.each(function(){
            var $elem = $(this)
            var savealt = $elem.attr('alt');
            var savetitle = $elem.attr('title');
            $elem.hover(function(){
                  $elem.removeAttr('title').removeAttr('alt');
            },function(){
                  $elem.attr({title:savetitle,alt:savealt});
            });
      });
  };
})(jQuery);
$(function(){
  $('a').hideTips();
});
