require "rspec"
require "pg"
require "city"
require 'train'
require 'pry'


DB = PG.connect({dbname: "raptor_railways_test"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM cities *;")
    DB.exec("DELETE FROM trains *;")
    DB.exec("DELETE FROM routes *;")
  end
end
