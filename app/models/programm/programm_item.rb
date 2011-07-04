# encoding: utf-8

class ProgrammItem < ActiveRecord::Base
  belongs_to :context, :polymorphic => true
  belongs_to :discipline
  acts_as_list :scope => [:context_id, :context_type, :type]

  has_enum :grade, %w[satisfactorily good excellent passed], :scopes => true

  def to_s
    title
  end

  alias :diploma :context

  protected
    def create_discipline_if_necessury
      self.discipline = Discipline.find_or_create_by_title(self.discipline_term)
    end
end










# == Schema Information
#
# Table name: programm_items
#
#  id            :integer         not null, primary key
#  created_at    :datetime
#  updated_at    :datetime
#  grade         :string(255)
#  credits       :float
#  hours         :integer
#  weeks         :integer
#  type          :string(255)
#  discipline_id :integer
#  context_id    :integer
#  title         :text
#  eng_title     :text
#  position      :integer
#  context_type  :string(255)
#

