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

Person.create!(:surname => 'Администратор',
               :firstname => 'Рут',
               :patrynomic => 'Сеперьзверович',
               :user_attributes =>{ :email => 'demo@demo.de',
                                    :password => '123456',
                                    :password_confirmation => '123456'})

f1 = Faculty.create!(:title => 'Факультет систем управления',
                :abbr => 'ФСУ',
                :eng_title => 'Faculty of system control',
                :eng_abbr => 'FSC')

f2 = Faculty.create!(:title => 'Факультет Электрониники',
                :abbr => 'ФЭ',
                :eng_title => 'Faculty of electronics',
                :eng_abbr => 'FE')

Chair.create!(:title => 'Автоматизированной обработки информации',
              :abbr => 'АОИ',
              :eng_title => 'Automated data processing',
              :eng_abbr => 'ADP',
              :faculty_id => f1.id)

Chair.create!(:title => 'Автоматизированных систем управления',
              :abbr => 'АСУ',
              :eng_title => 'Automated control system',
              :eng_abbr => 'ACS',
              :faculty_id => f2.id)

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

Speciality.create!(:code => '111111',
                   :eng_code => '222222',
                   :eng_title => 'Programmirovanie',
                   :qualification => 'Инженер',
                   :start_recruitment_year => '2000',
                   :end_recruitment_year => '2010',
                   :title => 'Программирование')
