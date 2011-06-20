module HasProgrammItems::ClassMethods

  def has_programm_items
    has_many :courses,        :dependent => :destroy, :as => :context
    has_many :papers,         :dependent => :destroy, :as => :context
    has_many :practices,      :dependent => :destroy, :as => :context
    has_many :programm_items, :dependent => :destroy, :as => :context

    has_one :final_state_examination,     :dependent => :destroy, :as => :context

    after_create :create_final_state_examination
    include HasProgrammItems::InstanceMethods
  end

end

