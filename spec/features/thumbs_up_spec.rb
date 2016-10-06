require 'rails_helper'

describe "Increase Idea Rating", :type => :feature, :js => true do
  it "can thumbs up a rating" do
    Idea.delete_all
    idea = Idea.create(title: "hi", body: "a greeting")

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
