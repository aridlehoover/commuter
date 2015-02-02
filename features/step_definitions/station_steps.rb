When(/^I request a list of stations$/) do
  visit '/stations'
end

Then(/^I see a list of stations$/) do
  list_items = page.all(:xpath, '//li')
  expect(list_items.length).to eq(45)
end
