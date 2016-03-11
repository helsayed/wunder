require "rails_helper"

RSpec.feature "driver_application", :type => :feature do
  before do
    # ToDo implement market manager login steps 
    pending "implement market manager login steps"
    berlin = FactoryGirl.create(:city, name: 'Berlin')
    cairo = FactoryGirl.create(:city, name: 'Cairo')
    alex = FactoryGirl.create(:city, name: 'Alexandria')
    pending_driver_application =  FactoryGirl.create(:driver_application, city: berlin) 
    accpeted_driver_application =  FactoryGirl.create(:driver_application, status: 'accepted', city: cairo) 
    rejected_driver_application =  FactoryGirl.create(:driver_application, status: 'rejected', city: alex) 
    visit "/driver_applications"
  end

  scenario "list all driver applications names" do
    expect(page).to have_text("Driver applications list.")
    
    # check driver applications data    
    expect(page).to have_text(pending_driver_application.first_name)
    expect(page).to have_text(accepted_driver_application.first_name)
    expect(page).to have_text(rejected_driver_application.first_name)
  end

  scenario "list all driver applications email" do
    expect(page).to have_text("Driver applications list.")
    
    # check driver applications data    
    expect(page).to have_text(pending_driver_application.email)
    expect(page).to have_text(accepted_driver_application.email)
    expect(page).to have_text(rejected_driver_application.email)
  end

  scenario "list all driver applications city.name" do
    expect(page).to have_text("Driver applications list.")
    
    # check driver applications data    
    expect(page).to have_text(pending_driver_application.city.name)
    expect(page).to have_text(accepted_driver_application.city.name)
    expect(page).to have_text(rejected_driver_application.city.name)
  end

  scenario "list all driver applications status" do
    expect(page).to have_text("Driver applications list.")
    
    # check driver applications data    
    find('tr', text: pending_driver_application.first_name).should have_text('pending')
    find('tr', text: accepted_driver_application.first_name).should have_text('accepted')
    find('tr', text: rejected_driver_application.first_name).should have_text('rejected')
  end

  scenario "filter by status pending" do 
    select 'pending', from: "status_filter"
    click_button 'filter'
    expect(page).to have_text(pending_driver_application.city.name)
    expect(page).not_to have_text(accepted_driver_application.city.name)
    expect(page).not_to have_text(rejected_driver_application.city.name)
  end

  scenario "filter by status accepted" do 
    select 'pending', from: "status_filter"
    click_button 'filter'
    expect(page).not_to have_text(pending_driver_application.city.name)
    expect(page).to have_text(accepted_driver_application.city.name)
    expect(page).not_to have_text(rejected_driver_application.city.name)
  end

  scenario "filter by status rejected" do 
    select 'pending', from: "status_filter"
    click_button 'filter'
    expect(page).not_to have_text(pending_driver_application.city.name)
    expect(page).not_to have_text(accepted_driver_application.city.name)
    expect(page).to have_text(rejected_driver_application.city.name)
  end

  scenario "filter by city berlin" do 
    select 'Berlin', from: "city_filter"
    click_button 'filter'
    expect(page).to have_text(pending_driver_application.city.name)
    expect(page).not_to have_text(accepted_driver_application.city.name)
    expect(page).not_to have_text(rejected_driver_application.city.name)
  end

  scenario "filter by city cairo" do 
    select 'Cairo', from: "city_filter"
    click_button 'filter'
    expect(page).not_to have_text(pending_driver_application.city.name)
    expect(page).to have_text(accepted_driver_application.city.name)
    expect(page).not_to have_text(rejected_driver_application.city.name)
  end

  scenario "filter by city alex" do 
    select 'Alexandria', from: "city_filter"
    click_button 'filter'
    expect(page).not_to have_text(pending_driver_application.city.name)
    expect(page).not_to have_text(accepted_driver_application.city.name)
    expect(page).to have_text(rejected_driver_application.city.name)
  end

  scenario "accept pending application" do
    expect(page).to have_text("Driver applications list.")
    
    # check driver applications data    
    find('tr', text: pending_driver_application.first_name).should have_link('accept')
    find('tr', text: pending_driver_application.first_name).should have_link('reject')
    click_link 'accept'
    expect(page).to have_text("Driver application has been approved.")
    expect(pending_driver_application.status).to eq('accepted')
  end


  scenario "reject pending application" do
    expect(page).to have_text("Driver applications list.")
    
    # check driver applications data    
    find('tr', text: pending_driver_application.first_name).should have_link('accept')
    find('tr', text: pending_driver_application.first_name).should have_link('reject')
    click_link 'reject'
    expect(page).to have_text("Driver application has been rejected.")
    expect(pending_driver_application.status).to eq('rejected')
  end
end