module ApplicationHelper
  def render_menu
    render 'shared/menu', :lists => List.where(:show_on_menu => true).to_a
  end
end

ActionView::Base.default_form_builder = FormHelper::CustomFormBuilder