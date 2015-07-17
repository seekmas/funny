//= require jquery
//= require jquery_ujs
//= require cocoon
//= require plugins/box_helper.js
//= require plugins/box_selectable.js
//= require plugins/jquery.datetimepicker.js


$(function(){

	$('.box-datetimepicker').datetimepicker({
		 	lang:'ch',
		 	timepicker:false,
 		 	format:'Y.m.d',
 		 	closeOnDateSelect: true
	});

	$(document).on('click', '.cancel', function(e){

		e.preventDefault();
		$('.box-tl-dropdown').remove();

	});

	$(document).on('click','input[type="submit"]', function(event){
		event.preventDefault();
		var $button = $(this);
		var $form = $(this).closest('form');
		var action = $form.attr('action');
		var method = $form.attr('method');
		var form_params = {}

		$form.find('input[type=text],textarea').each(function(index,ele){
			form_params[$(ele).attr('name')] = $(ele).val();
		});

		$.ajax({
			url: action,
			method: method,
			data: form_params,
			success: function(data){
				console.log(data)
				$('.box-success').remove();
				$button.closest('td').find('.box-tl-cell').append($('<p class="box-success">更新成功</p>'));
				$button.closest('.box-tl-dropdown').remove();
			}
		});
	});



});
