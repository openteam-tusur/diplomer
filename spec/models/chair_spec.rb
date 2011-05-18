# encoding: utf-8

require 'spec_helper'

describe Chair do
  it 'метод :is_translated? должен возвращать true если есть пустые поля с префиксом eng_' do
    chair = Factory.create(:chair, :eng_abbr => nil)
    chair.is_translated?.should be false
  end

  it 'метод :is_translated? должен возвращать true если нет пустых полей с префиксом eng_' do
    chair = Factory.create(:chair)
    chair.is_translated?.should be true
  end
end

