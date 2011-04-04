!SLIDE code

    @@@ Cucumber

    Scenario: Create without title

      Given I am on the new blog post page
      When I write a blog post without a title
      And I press "Create Blog post"
      Then I should see "can't be blank"

!SLIDE commandline

    $ rake

     Then I should see "Required"              # features/step_definitions/web_steps.rb:105
      expected #has_content?("Required") to return true, got false (RSpec::Expectations::ExpectationNotMetError)

!SLIDE code

    @@@ Ruby

    require 'spec_helper'

    describe BlogPost do

      it {should validate_presence_of :title}
    end

!SLIDE code

    @@@ Ruby

    group :test, :development do
      gem 'rspec-rails'
    end

    group :test do
      gem 'cucumber-rails'
      gem 'capybara'
      gem 'database_cleaner'
      gem 'shoulda-matchers'
    end

!SLIDE commandline

    $ rake

    1) BlogPost 
     Failure/Error: it {should validate_presence_of :title}
       Expected errors to include "can't be blank" when title is set to nil, got no errors

!SLIDE code

    @@@ Ruby

    class BlogPost < ActiveRecord::Base
      validates_presence_of :title
    end
  
!SLIDE commandline

    $ rake

    .

    Finished in 0.02658 seconds
    1 example, 0 failures

    2 scenarios (2 passed)
    8 steps (8 passed)
    0m1.084s



