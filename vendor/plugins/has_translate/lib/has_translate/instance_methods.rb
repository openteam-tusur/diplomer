module HasTranslate::InstanceMethods
  def is_translated?
    attributes_to_be_translated = attributes.delete_if { |attr| attr =~ /(id|created_at|updated_at|number)/ }.
                                             delete_if { |attr| attr !~ /eng_/ }
    attributes_to_be_translated.values.each { |value| return false if value.blank? }
    true
  end
end
