require 'spec_helper'

describe "Increase Idea Rating", :type => :feature, :js => true do
  xit "can thumbs up a rating" do
    item = Item.create(title: "hi", body: "a greeting")

    visit '/'

    within(".idea") do
      expect(page).to have_content("swill")
    end

    within(".idea") do
      click_link_or_button 'like'
    end

    within(".idea") do
      expect(page).to have_content("plausible")
    end

    within(".idea") do
      click_link_or_button 'like'
    end

    within(".idea") do
      expect(page).to have_content("genius")
    end
  end
end
