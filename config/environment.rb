module Rails
  class Configuration
    def database_configuration
      conf = YAML::load(ERB.new(IO.read(database_configuration_file)).result)
      if defined?(TAR2RUBYSCRIPT)
        conf.each do |k, v|
          if v["adapter"] =~ /^sqlite/
            v["database"] = oldlocation(v["database"]) if v.include?("database")
            v["dbfile"]   = oldlocation(v["dbfile"])   if v.include?("dbfile")
          end
        end
      end
      conf
    end
  end
end

# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
