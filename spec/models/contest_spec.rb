# encoding: utf-8

require 'spec_helper'

describe Contest do
  describe "должен правильно обрабатывать возможность создания заявок" do

    it "если дата меньше дата начала" do
      contest = Factory.create(:contest, :start_date => Date.today + 1.day)
      contest.open?.should be false
    end

    it "если больше даты окончания" do
      contest = Factory.create(:contest, :finish_date => Date.today - 1.day)
      contest.open?.should be false
    end

    it "если дата в равна дате начала" do
      contest = Factory.create(:contest, :start_date => Date.today)
      contest.open?.should be true
    end

    it "если дата в равна дате окончания" do
      contest = Factory.create(:contest, :finish_date => Date.today)
      contest.open?.should be true
    end

    it "если дата посередина" do
      contest = Factory.create(:contest, :start_date => Date.today - 10.days, :finish_date => Date.today + 10.days)
      contest.open?.should be true
    end

  end
end

# == Schema Information
#
# Table name: contests
#
#  id          :integer         not null, primary key
#  year        :integer
#  start_date  :date
#  finish_date :date
#  created_at  :datetime
#  updated_at  :datetime
#

