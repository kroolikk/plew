# -*- encoding: utf-8 -*-
module ApplicationHelper

  def set_selected_class(controller, action=nil)
    if action.present?
      if action.class == Array
        if params[:controller] == controller && action.include?(params[:action])
          return 'selected'
        else
          return ''
        end
      else
        if params[:controller] == controller && params[:action] == action
          return 'selected'
        else
          return ''
        end
      end
    else
      if params[:controller] == controller
        return 'selected'
      else
        return ''
      end
    end
  end

  
  def display_user(user)
    case user
    when SECTION[0] then "Wojciech Plewiński"
    when SECTION[1] then "Maciej Plewiński"
    when SECTION[2] then "Filip Plewiński"
    else "Brak etykiety"
    end
  end
  

  def pages_label(label)
    case label
    when "contact" then "Kontakt"
    when "review" then "Recenzje"
    else "Brak etykiety"
    end
  end


  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end
  
  
  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  end
end
