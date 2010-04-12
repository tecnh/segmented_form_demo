module PeopleHelper
  def header_strip(sub_forms)
    master_form = "master_form"
    o = ""
    o += render :partial => "people/master", :locals => {:object => @person, :master_form => master_form}

    sub_forms.each_with_index do |sf, idx|
    	o += render :partial => sf, :locals => {:current_form => sf, :next_form => sub_forms[idx+1].nil? ? 'last' : sub_forms[idx+1], :last_form => (idx-1 < 0) ? nil : sub_forms[idx-1]}
    	o += javascript_tag "$('##{sf}').hide();"
    end
    # This tag shows the first sub-form with errors. TODO: Skip downstream sub-forms that are not in validation error. TODO: Go straight to SUBMIT if no other sub-forms are in failure.
    o += javascript_tag "if ( $('.inline-errors').length == 0 ) { $('##{sub_forms.first}').show(); } else { arr = new Array('#{sub_forms.join('\',\'')}'); i=f=0; do { c = $('#' + arr[i] + ' .inline-errors').length; if (c > 0) { f = arr[i]; }; i++; } while (c == 0 && i <= arr.length); if (f) { $('#' + f).show(); } else { $('##{sub_forms.first}').show();	};	};"		
    o += javascript_include_tag "segforms.js"
    o
  end
    
  def button_strip(current_form, last_form, next_form)
	  o = button_to_function "back", "back_form( $('##{current_form}'), $('##{last_form}'))", :style => "display:#{last_form.nil? ? 'none' : 'inline'};"
	  o += (next_form == 'last') ? (button_to_function "finish", "copy_form( $('##{current_form}'), 'last')") : (button_to_function "next", "copy_form( $('##{current_form}'), $('##{next_form}'))")
	  o
	end
end
