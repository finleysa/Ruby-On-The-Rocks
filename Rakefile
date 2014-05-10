require 'rspec/core/rake_task'
$LOAD_PATH << "lib"

RSpec::Core::RakeTask.new(:spec)

task :default => [:test_prepare, :spec]

desc 'prepare the test database'
task :test_prepare do
  require 'environment'
  test_database = "db/drinklist_test.sqlite3"
  Environment.environment = "test"
  database = Environment.database_connection
end