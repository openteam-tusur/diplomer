# encoding: utf-8

class AcademicRecord < ActiveRecord::Base
  belongs_to :faculty

  has_one :student, :dependent => :destroy, :as => :studentable

  accepts_nested_attributes_for :student, :update_only => true

  def to_s
    "Академическая справка №#{number}"
  end
end
