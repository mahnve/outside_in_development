When /^I write a blog post with title "([^"]*)" and body "([^"]*)"$/ do |title, body|
  fill_in 'Title', :with => title
  fill_in 'Body', :with => body
end

When /^I write a blog post without a title$/ do
  fill_in 'Body', :with => "something"
end

