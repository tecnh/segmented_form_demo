# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def segmented_form_for(*args, &block)
    options = args.extract_options!
    options = options.merge(:builder => SegmentedFormBuilder)
    options = options.merge(:html => {:id=> options[:id], :class=>'validate'})
    semantic_form_for(*(args + [options]), &block)
  end
  
  def master_form(object, sub_forms)
    master_form = "master_form"
    o = render :partial => "shared/master", :locals => {:object => @person, :master_form => master_form}

    sub_forms.each_with_index do |sf, idx|
    	o += render :partial => sf, :locals => {:current_form => sf, :next_form => sub_forms[idx+1].nil? ? 'last' : sub_forms[idx+1], :last_form => (idx-1 < 0) ? nil : sub_forms[idx-1]}
    	o += javascript_tag "$('##{sf}').hide();"
    end
    # This tag shows the first sub-form with errors. TODO: Skip downstream sub-forms that are not in validation error. TODO: Go straight to SUBMIT if no other sub-forms are in failure.
    o += javascript_tag "if ( $('.inline-errors').length == 0 ) { $('##{sub_forms.first}').show(); } else { arr = new Array('#{sub_forms.join('\',\'')}'); i=f=0; do { c = $('#' + arr[i] + ' .inline-errors').length; if (c > 0) { f = arr[i]; }; i++; } while (c == 0 && i <= arr.length); if (f) { $('#' + f).show(); } else { $('##{sub_forms.first}').show();	};	};"		
    o += javascript_include_tag "segforms.js"
    o
  end
end
