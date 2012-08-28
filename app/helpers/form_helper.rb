include ActionView::Helpers::FormOptionsHelper

module FormHelper
  class CustomFormBuilder < ActionView::Helpers::FormBuilder
    def relation_select(property)
      #@template.collection_select(@object, property, ['temp','temp'], nil, nil)
    end
  end
end