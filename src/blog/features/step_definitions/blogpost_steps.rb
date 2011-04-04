When /^I write a blog post with title "([^"]*)" and body "([^"]*)"$/ do |title, body|
  fill_in 'Title', :with => title
  fill_in 'Body', :with => body
end

