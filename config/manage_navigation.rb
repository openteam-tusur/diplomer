# encoding: utf-8
SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.item :claims, "Анкеты участников", '#',
                    :highlights_on => /claims|^\/manage$/
    primary.item :dictionaries, "Справочник учреждений", '#',
                    :highlights_on => /dictionaries/
    primary.item :edit, "Профиль",  edit_user_registration_path

    primary.dom_id = "navigation"
  end
end

