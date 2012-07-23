module ApplicationHelper

  def render_menu
    render 'shared/menu', :lists => List.where(:show_on_menu => true).to_a
  end

  def link_to_remove_field(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_field(this)")
  end

  def link_to_add_field(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    field = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render 'field', :f => builder
    end
    link_to_function(name, "add_field(this, \"#{association}\", \"#{escape_javascript(field)}\")")
  end
end
