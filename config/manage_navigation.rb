# encoding: utf-8
SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.item :faculties, "Факультеты", faculties_path,
                    :highlights_on => /faculties/
    primary.item :disciplines, "Список дисциплин", disciplines_path,
                    :highlights_on => /disciplines/
    primary.item :people , "Пользователи",  people_path,
                    :highlights_on => /people/
    primary.dom_id = "navigation"
  end
end

