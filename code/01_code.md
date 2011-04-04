!SLIDE commandline

    $ rails new blog

      create  
      create  README
      create  Rakefile
      create  config.ru
      create  .gitignore
      create  Gemfile
      create  app
      create  app/controllers/application_controller.rb
      ...
      create  vendor/plugins/.gitkeep

!SLIDE code

    @@@ Ruby

    source 'http://rubygems.org'

    gem 'rails', '3.0.0'
    gem 'sqlite3-ruby', :require => 'sqlite3'

    group :test do
      gem 'rspec-rails'
      gem 'cucumber-rails'
    end

!SLIDE commandline

    $ bundle install                                                                   ──master(Mon,Apr04)─┘

    Fetching source index for http://rubygems.org/
    Using rake (0.8.7) 
    ...
    Installing rack (1.2.2) 
    Installing rack-mount (0.6.14) 
    ...
    Installing gherkin (2.3.5) with native extensions 
    Installing term-ansicolor (1.0.5) 
    Installing cucumber (0.10.2) 
    Installing cucumber-rails (0.4.0) 
    ...
    Installing rspec (2.5.0) 
    Installing rspec-rails (2.5.0) 
    Using sqlite3 (1.3.3) 
    Using sqlite3-ruby (1.3.3) 

!SLIDE commandline

    $ rake db:migrate

!SLIDE commandline

    $ rails generate cucumber:install

    create  config/cucumber.yml
    create  script/cucumber
     chmod  script/cucumber
    create  features/step_definitions
    create  features/step_definitions/web_steps.rb
    create  features/support
    create  features/support/paths.rb
    create  features/support/selectors.rb
    create  features/support/env.rb
     exist  lib/tasks
    create  lib/tasks/cucumber.rake
      gsub  config/database.yml
      gsub  config/database.yml
     force  config/database.yml

