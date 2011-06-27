# encoding: utf-8

namespace :regenerate do

  desc "Перегенерация номеров дипломов"
  task :numbers => [:environment] do
    Diploma.unscoped.where(:serial_number => 1).each do |diploma|
      Diploma.unscoped.where(:graduation_date => (diploma.graduation_date.at_beginning_of_year..diploma.graduation_date.at_end_of_year),
                                  :chair_id => diploma.chair.id).order(:created_at).each_with_index do |next_d, index|
        number = index+1
        formatted_number = sprintf("%05i",number)

        next_d.serial_number = number
        next_d.eng_number = "#{diploma.chair.eng_abbr.upcase}#{I18n.l next_d.graduation_date, :format => '%y'}-#{formatted_number}"
        next_d.number = "#{diploma.chair.abbr.upcase}#{I18n.l next_d.graduation_date, :format => '%y'}-#{formatted_number}"
        next_d.save(false)
      end
    end
  end
end

