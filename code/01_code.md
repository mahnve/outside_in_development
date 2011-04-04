!SLIDE commandline

    $ rails new blog -T

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
      gem 'capybara'
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

!SLIDE commandline

    $ rails generate rspec:install                                                     ──master(Mon,Apr04)─┘

    create  .rspec
    create  spec
    create  spec/spec_helper.rb

!SLIDE code

    @@@ Cucumber

    Feature: User writes blog post

      In order for other people to read brilliant thoughts
      A user can post a blog post

      Scenario: 

        Given I am on the new blog post page
        When I write a blog post
        And it has the title "My great Idea"
        And it has the body "Body body body"
        And I press "Save"
        Then I should see "My great Idea"

!SLIDE commandline

    $ rake

    1 scenario (1 failed)
    6 steps (1 failed, 2 skipped, 3 undefined)
    0m1.103s

    You can implement step definitions for undefined steps with these snippets:

!SLIDE code

    @@@ Ruby

    When /^I write a blog post$/ do
      pending # express the regexp above with the code you wish you had
    end

    When /^it has the title "([^"]*)"$/ do |arg1|
      pending # express the regexp above with the code you wish you had
    end

    When /^it has the body "([^"]*)"$/ do |arg1|
      pending # express the regexp above with the code you wish you had
    end

!SLIDE command

    $ rake

    Given I am on the new blog post page # features/step_definitions/web_steps.rb:44
    Can't find mapping from "the new blog post page" to a path.
    Now, go and add a mapping in /home/mahnve/src/presentations/cucumber/src/blog/features/support/paths.rb (RuntimeError)

!SLIDE code

    @@@ Ruby

    module NavigationHelpers
      def path_to(page_name)
        case page_name
        when /the home\s?page/
          '/'
        when /the new blog post page/
          '/blog_posts/new'

!SLIDE commandline

    $ rake

    Scenario:  # features/user_writes_blogpost.feature:6
      Given I am on the new blog post page # features/step_definitions/web_steps.rb:44
        No route matches "/blogpost/new" (ActionController::RoutingError)

!SLIDE commandline

    $ rails generate resource BlogPost title:string body:string

    invoke  active_record
    create    db/migrate/20110404155134_create_blog_posts.rb
    create    app/models/blog_post.rb
    invoke    test_unit
    create      test/unit/blog_post_test.rb
    create      test/fixtures/blog_posts.yml
    invoke  controller
    create    app/controllers/blog_posts_controller.rb
    invoke    erb
    create      app/views/blog_posts
    invoke    test_unit
    create      test/functional/blog_posts_controller_test.rb
    invoke    helper
    create      app/helpers/blog_posts_helper.rb
    invoke      test_unit
    create        test/unit/helpers/blog_posts_helper_test.rb
     route  resources :blog_posts

!SLIDE commandline

    $ rake

    (in /home/mahnve/src/presentations/cucumber/src/blog)
    You have 1 pending migrations:
      20110404155134 CreateBlogPosts

!SLIDE code

    @@@ Ruby

    class CreateBlogPosts < ActiveRecord::Migration
      def self.up
        create_table :blog_posts do |t|
          t.string :title
          t.string :body

          t.timestamps
        end
      end

      def self.down
        drop_table :blog_posts
      end
    end

!SLIDE commandline

    $ rake db:migrate

    (in /home/mahnve/src/presentations/cucumber/src/blog)
    ==  CreateBlogPosts: migrating ================================================
    -- create_table(:blog_posts)
      -> 0.0010s
    ==  CreateBlogPosts: migrated (0.0010s) =======================================

!SLIDE commandline

    $ rake

    Given I am on the new blog post page # features/step_definitions/web_steps.rb:44
    The action 'new' could not be found for BlogPostsController (AbstractController::ActionNotFound)

!SLIDE code

    @@@ Ruby

    gem 'inherited_resources'

!SLIDE code
    
    @@@ Ruby

    class BlogPostsController < InheritedResources::Base
    end

!SLIDE commandline

    $ rake

    Missing template blog_posts/new with ...

!SLIDE code

    @@@ Ruby

    gem 'formtastic'
    gem 'haml'

!SLIDE code

    @@@ Haml

    - semantic_form_for @blog_post do |form|
      = form.inputs
      = form.buttons

!SLIDE commandline

    $ rake 

    Given I am on the new blog post page # features/step_definitions/web_steps.rb:44
    When I write a blog post             # features/step_definitions/blogpost_steps.rb:1
      TODO (Cucumber::Pending)
      ./features/step_definitions/blogpost_steps.rb:2:in `/^I write a blog post$/'

!SLIDE bullets

# Oops

* Steps where not really optimal

!SLIDE code

    @@@ Ruby 

    When /^I write a blog post with title "([^"]*)" and the body "([^"]*)"$/ do |title, body|
      fill_in 'Title', :with => title
      fill_in 'Body', :with => body
    end

!SLIDE code

    @@@ Cucumber

    Given I am on the new blog post page
    When I write a blog post with title "My great Idea" and body "Body body body"
    And I press "Create Blog post"
    Then I should see "My great Idea"


