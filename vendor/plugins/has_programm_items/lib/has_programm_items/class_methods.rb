module HasProgrammItems::ClassMethods
  def has_programm_items
    has_many :courses,                  :dependent => :destroy, :as => :context, :order => 'position, created_at'
    has_many :papers,                   :dependent => :destroy, :as => :context, :order => 'position, created_at'
    has_many :practices,                :dependent => :destroy, :as => :context, :order => 'position, created_at'
    has_many :programm_items,           :dependent => :destroy, :as => :context, :order => 'position, created_at'
    has_many :final_state_examinations, :dependent => :destroy, :as => :context, :order => 'position, created_at'

    include HasProgrammItems::InstanceMethods
  end
end

