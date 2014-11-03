RSpec.configure do |config|
  config.filter_run_including :focus => true
  config.filter_run_excluding :slow => true
  config.run_all_when_everything_filtered = true
end