if (typeof jQuery !== 'undefined') {
	$(function() {
		if (!$('.buttons').length) {
			$('.footerFill').show();
		}

		$('nav > ul > li > span').click(function(e) {
			var seleccionar = $(this).hasClass('selectedMenu');
			if ($('nav > ul > li > span').hasClass('selectedMenu')) {
				$('nav > ul > li > span').removeClass('selectedMenu');
				$('nav > div').hide();
			} 
			if (!seleccionar) {
				$(this).addClass('selectedMenu');
				var idSubMenu = '#' + $(this).attr("name");
				$(idSubMenu).slideToggle();
			}
		});
	});
}
