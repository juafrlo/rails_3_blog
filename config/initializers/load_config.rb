#APP_CONFIG = YAML.load_file("#{RAILS_ROOT}/config/config.yml")[RAILS_ENV]
APP_CONFIG = []
#AppConfiguration.find_by_environment(ENV["RAILS_ENV"]).hashify