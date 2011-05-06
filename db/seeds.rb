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
                        :user_attributes =>{
                                            :email => 'demo@demo.de',
             :password => '123456',
             :password_confirmation => '123456',} 
                       )
Person.create!(:lname => 'Никешкин',
                        :fname => 'Лев',
                        :mname => 'Евгеньевич',
                        :eng_lname => 'User',
                        :eng_fname => 'Puser',
                        :eng_mname => 'Superpuser',
                        :user_attributes =>{
                                            :email => 'arnikev@mail.ru',
             :password => 'qwerty',
             :password_confirmation => 'qwerty',} 
                       )
