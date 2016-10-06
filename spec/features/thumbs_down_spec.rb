require 'spec_helper'

describe "Decrease Idea Rating", :type => :feature, :js => true do
  xit "can thumbs down a rating" do
    item = Item.create(
                       title: "hi",
                       body: "a greeting",
                       quality: "genius"
                      )

    visit '/'

    within(".idea") do
      expect(page).to have_content("genius")
    end

    within(".idea") do
      click_link_or_button 'dislike'
    end

    within(".idea") do
      expect(page).to have_content("plausible")
    end

    within(".idea") do
      click_link_or_button 'dislike'
    end

    within(".idea") do
      expect(page).to have_content("swill")
    end
  end
end
