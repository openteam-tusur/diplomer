# encoding: utf-8
SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.item :claims, "Анкеты участников", '#',
                    :highlights_on => /claims|^\/manage$/
    primary.item :disciplines, "Список дисциплин", disciplines_path,
                    :highlights_on => /disciplines/
    primary.item :person , "Профиль",  edit_person_path(6)
     
    primary.dom_id = "navigation"
  end
end

