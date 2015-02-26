Given(/^I request a list of stations$/) do
  visit '/'
end

Then(/^I see a list of stations$/) do
  within('#commuter ul') do
    list_items = page.all('li')
    expect(list_items.length).to eq(45)
  end
end

Then(/^I see station information for "(.*?)"$/) do |station_abbr|
  expect(page).to have_content(station_abbr)
  expect(page).to have_no_content('12TH')
end

When(/^I request a list of departures for "(.*?)"$/) do |station_abbr|
  page.find("a[href='/stations/#{station_abbr}']").click
end

Then(/^I should see the list of departures$/) do
  expect(page).to have_content('Pittsburg/Bay Point')
  expect(page).to have_content('Dublin/Pleasanton')
  expect(page).to have_content('Daly City')
end
