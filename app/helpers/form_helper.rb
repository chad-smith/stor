include ActionView::Helpers::FormOptionsHelper

module FormHelper
  class CustomFormBuilder < ActionView::Helpers::FormBuilder
    def relation_select(property)
      relation_field = @object.class.list.schema_fields.to_a
        .select {|field| ('Field' + field.id.to_s == property.to_s) }
      relation_field = relation_field[0]

      related_list = List.find_by(id: relation_field.relation)
      
      item_class = Item.get_schema_enhanced_class(related_list)

      @template.collection_select(@object.class.name.underscore, 
        property, 
        item_class.all,
        :id, 
        :id)
    end
  end
end