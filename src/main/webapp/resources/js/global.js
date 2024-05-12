

(function($) {
	'use strict';
	/*==================================================================
		[ Daterangepicker ]*/
	try {
		$('.js-datepicker').daterangepicker({
			"singleDatePicker": true,
			"showDropdowns": true,
			"autoUpdateInput": false,
			locale: {
				format: 'DD/MM/YYYY'
			},
		});

		var myCalendar = $('.js-datepicker');
		var isClick = 0;

		$(window).on('click', function() {
			isClick = 0;
		});

		$(myCalendar).on('apply.daterangepicker', function(ev, picker) {
			isClick = 0;
			$(this).val(picker.startDate.format('DD/MM/YYYY'));

		});

		$('.js-btn-calendar').on('click', function(e) {
			e.stopPropagation();

			if (isClick === 1) isClick = 0;
			else if (isClick === 0) isClick = 1;

			if (isClick === 1) {
				myCalendar.focus();
			}
		});

		$(myCalendar).on('click', function(e) {
			e.stopPropagation();
			isClick = 1;
		});

		$('.daterangepicker').on('click', function(e) {
			e.stopPropagation();
		});


	} catch (er) { console.log(er); }
	/*[ Select 2 Config ]
		===========================================================*/

	try {
		var selectSimple = $('.js-select-simple');

		selectSimple.each(function() {
			var that = $(this);
			var selectBox = that.find('select');
			var selectDropdown = that.find('.select-dropdown');
			selectBox.select2({
				dropdownParent: selectDropdown
			});
		});

	} catch (err) {
		console.log(err);
	}


})(jQuery);


/*[ TextArea ]
		===========================================================*/

$('textarea').keyup(function() {

	var characterCount = $(this).val().length,
		current = $('#current'),
		maximum = $('#maximum'),
		theCount = $('#the-count');

	current.text(characterCount);


	/*This isn't entirely necessary, just playin around*/
	if (characterCount < 70) {
		current.css('color', '#666');
	}
	if (characterCount > 70 && characterCount < 90) {
		current.css('color', '#6d5555');
	}
	if (characterCount > 90 && characterCount < 100) {
		current.css('color', '#793535');
	}
	if (characterCount > 100 && characterCount < 120) {
		current.css('color', '#841c1c');
	}
	if (characterCount > 120 && characterCount < 139) {
		current.css('color', '#8f0001');
	}

	if (characterCount >= 140) {
		maximum.css('color', '#8f0001');
		current.css('color', '#8f0001');
		theCount.css('font-weight', 'bold');
	} else {
		maximum.css('color', '#666');
		theCount.css('font-weight', 'normal');
	}


});

/*[ File Upload ]
		===========================================================*/

function readURL(input) {
	if (input.files && input.files[0]) {

		var reader = new FileReader();

		reader.onload = function(e) {
			$('.image-upload-wrap').hide();

			$('.file-upload-image').attr('src', e.target.result);
			$('.file-upload-content').show();

			$('.image-title').html(input.files[0].name);
		};

		reader.readAsDataURL(input.files[0]);

	} else {
		removeUpload();
	}
}

function removeUpload() {
	$('.file-upload-input').replaceWith($('.file-upload-input').clone());
	$('.file-upload-content').hide();
	$('.image-upload-wrap').show();
}
$('.image-upload-wrap').bind('dragover', function() {
	$('.image-upload-wrap').addClass('image-dropping');
});
$('.image-upload-wrap').bind('dragleave', function() {
	$('.image-upload-wrap').removeClass('image-dropping');
});