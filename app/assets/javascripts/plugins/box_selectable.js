$(document).ready(function() {
	$('select').each(function(index,select){
		var $select = $(select);

		if($select){
			$select.hide();
		}
		var target_id = $select.attr('id');
		var select_container = '';
		select_container += ('<ul class="box-selectable" data-target="'+target_id+'">');
		$select.find('option').each(function(index,option){
			if(index > 0){
				select_container += ('<li id="'+index+'">'+$(option).text()+'</li>');
			}
		});
		select_container += ('</ul>');

		if(is_null_string($select.find('option:selected').text()) == false)
		{	
			console.log($(select_container).find("li:contains('"+$select.find('option:selected').text()+"')"));
		}

		$(select_container).insertAfter($select);
	});

	$(document).on('click', '.box-selectable > li' , function(){
		$(this).parent().find('li').removeClass('active');
		$(this).addClass('active');
		var value = $(this).text();
		var obj_id = $(this).parent().attr('data-target');
		$('#'+obj_id).val(value);

		$('select').each(function(index,ele){
			console.log($(ele).val());
		});
	});
});