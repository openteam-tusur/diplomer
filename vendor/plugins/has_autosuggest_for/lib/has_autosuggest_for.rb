module HasAutosuggestFor
  def self.included(base)
    base.extend ClassMethods
  end
end

