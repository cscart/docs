$(document).ready(function () {
	$('.mobile-menu').on('click', function () {
		$('.documentation-menu').toggleClass('opened-menu');
	});
	var deviceWidth = $(window).width();
	if (deviceWidth < 769) {
		if ($('iframe').length > 0) {
			$('iframe').width(deviceWidth-40);
		}
	}

	 $('.footer-menu h5').on('click', function(){
        $('.footer-menu h5').removeClass('visible-footer');
        if ($(this).next().hasClass('visible')) {
            $('.footer-menu .sidebox-body').removeClass('visible');
        } else {
            $('.footer-menu .sidebox-body').removeClass('visible');
            $(this).addClass('visible-footer');
            $(this).next().addClass('visible');
        }
        
    });
});