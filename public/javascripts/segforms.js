$('.master_form').hide();
function form2form(formA, formB) {$(':input[name]', formA).each(function() { $('[name=' + $(this).attr('name') +']', formB).val($(this).val())})};
function back_form(src, back) {	src.hide();	back.show(); };	
function copy_form(src, next) {	var form = v2.Form.get( src.attr('id') );	if ( form.test("validate") ) { form2form( src, $('#master_form') );	if ( next == "last" ) { $('#master_form').submit();	} else { src.hide(); next.show();	}; };	return false;	};
