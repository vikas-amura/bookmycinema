RSpec.configure do |config|

  DatabaseCleaner.orm = "mongoid"
  config.before(:suite) do
    DatabaseCleaner[:mongoid].clean_with(:truncation)
  end
  config.before(:each) do
    DatabaseCleaner[:mongoid].strategy = :truncation
  end

  config.before(:each, :js => true) do
    DatabaseCleaner[:mongoid].strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner[:mongoid].start
  end

  config.after(:each) do
    DatabaseCleaner[:mongoid].clean
  end

end
