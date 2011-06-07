configatron.configure_from_hash YAML.load_file(Rails.root.join('config', 'config.yml'))[Rails.env] rescue nil
