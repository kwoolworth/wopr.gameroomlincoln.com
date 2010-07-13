(function($) {
	
	$.fn.tabinate = function(selector) {
		
		var tab_pages = $(selector);
		
		$(tab_pages).find('.page').hide();
		$(tab_pages).find('.page').first().show();
		
		this.each(function() {
			
		});
		
		return this;
		
	};
	
})(jQuery);