desc "Run the tests"
task :monitor => :environment do
  Test.find(:all).each {|test| test.run }
end
