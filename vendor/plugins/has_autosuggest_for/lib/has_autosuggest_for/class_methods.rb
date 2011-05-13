module HasAutosuggestFor::ClassMethods
  def has_autosuggest_for(*associations)
    associations.each do | association |

      attr_writer "#{association}_term"

      before_validation :"reset_#{association}_id", :unless => :"#{association}_term?"

      validates :"#{association}_term", :autosuggested => true

      define_method "#{association}_term" do
        self.send(association) ? self.send(association).term : self.instance_variable_get("@#{association}_term")
      end

      define_method "#{association}_term?" do
        self.instance_variable_get("@#{association}_term").present?
      end

      define_method "reset_#{association}_id" do
        self.send "#{association}_id=", nil
      end
    end
  end
end
