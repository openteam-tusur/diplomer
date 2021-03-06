# encoding: utf-8

class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :remember_me

  belongs_to :person

  validates :email, :presence => true, :uniqueness => true

  delegate :surname, :firstname, :patrynomic, :to => :person

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

# == Schema Information
#
# Table name: users
#
#  id                   :integer          not null, primary key
#  email                :string(255)      default(""), not null
#  encrypted_password   :string(128)      default(""), not null
#  reset_password_token :string(255)
#  remember_created_at  :datetime
#  sign_in_count        :integer          default(0)
#  current_sign_in_at   :datetime
#  last_sign_in_at      :datetime
#  current_sign_in_ip   :string(255)
#  last_sign_in_ip      :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#  person_id            :integer
#

