# encoding: utf-8

class ProgrammItem < ActiveRecord::Base
  belongs_to :diploma
  belongs_to :discipline

  has_enum :grade, %w[satisfactorily good excellent passed], :scopes => true

  def to_s
    title
  end

  protected
    def create_discipline_if_necessury
      self.discipline = Discipline.create!(:title => self.discipline_term) if self.discipline_term.present? && !self.discipline
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
#  diploma_id    :integer
#  title         :text
#  eng_title     :text
#

