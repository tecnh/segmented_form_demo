class SegmentedFormBuilder < Formtastic::SemanticFormBuilder
  def pseudo_buttons(current_form, last_form, next_form)
    button_strip self, current_form, last_form, next_form
  end
  
  protected
  def button_strip(form, current_form, last_form, next_form)
	  if next_form == "last"
	    button_label = "finish"
	    button_function = "copy_form( $('##{current_form}'), 'last')"
	  else
	    button_label = "next"
	    button_function = "copy_form( $('##{current_form}'), $('##{next_form}'))"
	  end
		
	  o = "<br />"
	  o += form.submit "Submit", :disabled => true, :style => 'display:none;'
	  o += @template.button_to_function 'back', "back_form( $('##{current_form}'), $('##{last_form}'))", :style => "display:#{last_form.nil? ? 'none' : 'inline'};"
	  o += @template.button_to_function button_label, button_function, :class => "default"
	  o
	end
end