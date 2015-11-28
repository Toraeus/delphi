require_relative 'config/db'

namespace :db do
  desc "update"
  task :update do
    DataMapper.auto_upgrade!
  end

  desc "reset"
  task :reset do
    DataMapper.auto_migrate!
  end

  desc "fixtures"
  task :fixtures do
    Fixtures.load
  end

  desc "initialize"
  task :initialize => [:reset, :fixtures] do
  end

end
