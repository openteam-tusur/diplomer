module HasTranslate::ClassMethods
  def has_translate
    include HasTranslate::InstanceMethods
  end
end

