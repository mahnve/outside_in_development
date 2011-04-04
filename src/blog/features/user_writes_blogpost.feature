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
