class Role < ActiveRecord::Base
  belongs_to :person
  belongs_to :faculty
  belongs_to :chair

  scope :type, lambda { |type|
      where :type => type.to_s.classify
  }

  def to_s
    self.class.model_name.human
  end

end

