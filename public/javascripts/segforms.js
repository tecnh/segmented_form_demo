function form2form(formA, formB) {$(':input[name]', formA).each(function() { $('[name=' + $(this).attr('name') +']', formB).val($(this).val())})};
function first_focus() { ($('input:text:visible:first').length == 0) ? $('textarea:visible:first').focus() : $('input:text:visible:first').focus(); };
function back_form(src, back) {	src.hide();	back.show(); };	
function copy_form(src, next) {	var form = v2.Form.get( src.attr('id') );	if ( form.test("validate") ) { form2form( src, $('#master_form') );	if ( next == "last" ) { $('#master_form').submit();	} else { src.hide(); next.show(); first_focus(); }; };	return false;	};
$('.master_form').hide();
first_focus();
$(function() {	
	$('form input').keypress(function (e) {	 
		if ((e.which && e.which == 13) || (e.keyCode && e.keyCode == 13)) {	 
			$('input:visible.default:first').click();	
			return true;
		} else {	
			return true;	
		}	 
	});	 
});