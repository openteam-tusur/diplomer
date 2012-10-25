# encoding: utf-8
SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.item :faculties,    'Факультеты', faculties_path,
                 :highlights_on => /faculties/

    primary.item :chairs ,      'Кафедры',  chairs_path,
                 :highlights_on => /chairs/

    primary.item :specialities, 'Специальности',  specialities_path,
                 :highlights_on => /specialities/

    primary.item :disciplines,  'Дисциплины', disciplines_path,
                 :highlights_on => /disciplines/

    primary.item :diplomas,     'Дипломы', diplomas_path,
                 :highlights_on => /diplomas/

    primary.item :academic_records, 'Академические справки', academic_records_path,
                 :highlights_on => /academic_records/

    primary.item :people ,      'Пользователи',  people_path,
                 :highlights_on => /people/

    primary.dom_id = 'navigation'
  end
end

