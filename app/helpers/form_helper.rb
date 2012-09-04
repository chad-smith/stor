include ActionView::Helpers::FormOptionsHelper

module FormHelper
  class CustomFormBuilder < ActionView::Helpers::FormBuilder
    def relation_select(property)
      #raise @object.class.inspect
      @template.collection_select(@object.class.name.underscore, property, List.all, :id, :name)
    end
  end
end