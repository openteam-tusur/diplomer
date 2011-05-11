# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

User.destroy_all
Person.destroy_all
Person.create!(:lname => 'Администратор',
               :fname => 'Рут',
               :mname => 'Сеперьзверович',
               :eng_lname => 'Admin',
               :eng_fname => 'Root',
               :eng_mname => 'Superanimal',
               :user_attributes =>{ :email => 'demo@demo.de',
                                    :password => '123456',
                                    :password_confirmation => '123456'}
              )
Person.create!(:lname => 'Никешкин',
               :fname => 'Лев',
               :mname => 'Евгеньевич',
               :eng_lname => 'User',
               :eng_fname => 'Puser',
               :eng_mname => 'Superpuser',
               :user_attributes =>{ :email => 'arnikev@mail.ru',
                                    :password => 'qwerty',
                                    :password_confirmation => 'qwerty'}
              )

Faculty.create!(:title => 'Факультет систем управления',
                :abbr => 'ФСУ',
                :eng_title => 'Faculty of system control',
                :eng_abbr => 'FSC')

Faculty.create!(:title => 'Факультет Электрониники',
                :abbr => 'ФЭ',
                :eng_title => 'Faculty of electronics',
                :eng_abbr => 'FE')

Chair.create!(  :title => 'Автоматизированной обработки информации',
                :abbr => 'АОИ',
                :eng_title => 'Automated data processing',
                :eng_abbr => 'ADP')

Chair.create!(  :title => 'Автоматизированных систем управления',
                :abbr => 'АСУ',
                :eng_title => 'Automated control system',
                :eng_abbr => 'ACS')

Discipline.create!(:eng_title => 'math',
                   :kind => 'course',
                   :title => 'Математика')

Discipline.create!(:eng_title => 'music',
                   :kind => 'course',
                   :title => 'Музыка')

Discipline.create!(:eng_title => 'learning',
                   :kind => 'practice',
                   :title => 'Практика')

Discipline.create!(:eng_title => 'programing',
                   :kind => 'papers',
                   :title => 'Программирование')

Speciality.create!(:code => '123123',
                   :eng_title => 'Programmirovanie',
                   :qualification => 'Инженер',
                   :title => 'Программирование')
