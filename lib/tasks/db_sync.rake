# lib/tasks/db_sync.rake
namespace :db do
  desc 'Pull production db to development'
  task :sync => [:backup, :dump, :restore]

  task :backup do
    Bundler.with_clean_env { 
      puts 'Backup started...'
      system "heroku pg:backups capture --app uxangels"
      puts 'Backup complete!'
    }
  end
  
  task :dump do
    dumpfile = "#{Rails.root}/tmp/latest.dump"
    puts 'Fetching url and file...'
    Bundler.with_clean_env { 
      url = `heroku pg:backups public-url --app uxangels | cat` 
      system "curl --output #{dumpfile} #{url}"
    }
    puts 'Fetching complete!'
  end

  task :restore do
    dev = Rails.application.config.database_configuration['development']
    dumpfile = "#{Rails.root}/tmp/latest.dump"
    puts 'PG_RESTORE on development database...'
    system "pg_restore --verbose --clean --no-acl --no-owner -h localhost -U #{dev['username']} -d #{dev['database']} #{dumpfile}"
    puts 'PG_RESTORE Complete!'
  end
end