# encoding: utf-8

class AutosuggestedValidator < ActiveModel::EachValidator

  def validate_each(object, attribute, value, params={})
    return if value.blank?

    chunks = attribute.to_s.split '_'

    association_attribute = chunks.pop
    association = chunks.join '_'
    association_class = association.classify.constantize
    association_object = association_class.find_by_id object.send("#{association}_id")

    if association_object.try(association_attribute) != value
      object.errors[attribute] << "должно быть выбрано из выпадающего списка"
    end
  end
end
