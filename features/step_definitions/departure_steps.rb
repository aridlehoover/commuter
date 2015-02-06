Given(/^I request a list of departures for "(.*?)"$/) do |station_abbr|
  page.find("##{station_abbr}").click
end

Then(/^I should see the list of departures$/) do
  expect(page).to have_content('Pittsburg/Bay Point')
  expect(page).to have_content('Fremont')
  expect(page).to have_content('Richmond')
  expect(page).to have_content('Dublin/Pleasanton')
  expect(page).to have_content('Daly City')
end
