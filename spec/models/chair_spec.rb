# encoding: utf-8

require 'spec_helper'

describe Chair do
  it 'метод :translated? должен возвращать true если есть пустые поля с префиксом eng_' do
    chair = Factory.create(:chair, :eng_abbr => nil)
    chair.translated?.should be false
  end

  it 'метод :translated? должен возвращать true если нет пустых полей с префиксом eng_' do
    chair = Factory.create(:chair)
    chair.translated?.should be true
  end
end

