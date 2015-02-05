When(/^I request a list of stations$/) do
  visit '/stations'
end

Then(/^I see a list of stations$/) do
  list_items = page.all(:xpath, '//li')
  expect(list_items.length).to eq(45)
end

When(/^I request station information for "(.*?)"$/) do |station_abbr|
  visit "/stations/#{station_abbr}"
end

Then(/^I see station information for "(.*?)"$/) do |station_abbr|
  expect(page).to have_content(station_abbr)
  expect(page).to have_no_content('12TH')
end
