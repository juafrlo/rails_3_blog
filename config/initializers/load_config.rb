#APP_CONFIG = YAML.load_file("#{RAILS_ROOT}/config/config.yml")[RAILS_ENV]
begin
  APP_CONFIG = AppConfiguration.find_by_environment(ENV["RAILS_ENV"]).hashify
rescue
  puts 'No configuration loaded'
end