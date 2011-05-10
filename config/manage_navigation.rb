# encoding: utf-8
SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.item :faculties, 'Факультеты', faculties_path,
                    :highlights_on => /faculties/

    primary.item :dictionary_disciplines, 'Список дисциплин', dictionary_disciplines_path,
                    :highlights_on => /disciplines/

    primary.item :people , 'Пользователи',  people_path,
                    :highlights_on => /people/

    primary.item :chairs , 'Кафедры',  chairs_path,
                    :highlights_on => /chairs/

    primary.item :specialities , 'Специальности',  specialities_path,
                    :highlights_on => /specialties/

    primary.dom_id = 'navigation'
  end
end

