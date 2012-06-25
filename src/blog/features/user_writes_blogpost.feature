Feature: User writes blog post

  In order for other people to read brilliant thoughts
  A user can post a blog post

  Scenario: Creates blog post

    Given I am on the new blog post page
    When I write a blog post with title "My great Idea" and body "Body body body"
    And I press "Create Blog post"
    Then I should see "My great Idea"

  Scenario: Create without title

    Given I am on the new blog post page
    When I write a blog post without a title
    And I press "Create Blog post"
    Then I should see "can't be blank"
