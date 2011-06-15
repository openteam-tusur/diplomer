# encoding: utf-8

User.destroy_all
Person.destroy_all
Chair.destroy_all
Discipline.destroy_all
Speciality.destroy_all

Person.create!(:surname => 'Иванов',
               :firstname => 'Иван',
               :patrynomic => 'Иванович',
               :user_attributes =>{ :email => 'demo@demo.de',
                                    :password => '123123',
                                    :password_confirmation => '123123'})

f1 = Faculty.create!(:title => 'Факультет систем управления',
                     :abbr => 'ФСУ',
                     :eng_title => 'Faculty of system control',
                     :eng_abbr => 'FSC')

f2 = Faculty.create!(:title => 'Факультет электрониники',
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
                   :title => 'Математика')

Discipline.create!(:eng_title => 'physics',
                   :title => 'Физика')

Discipline.create!(:eng_title => 'programing',
                   :title => 'Программирование')

Speciality.create!(:code => '230105',
                   :qualification => 'Инженер',
                   :title => 'Программное обсепечение вычислительной техники и автоматизированных систем')
