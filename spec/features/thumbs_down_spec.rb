require 'rails_helper'

describe "Decrease Idea Rating", :type => :feature, :js => true do
  it "can thumbs down a rating" do
    Idea.delete_all
    idea = Idea.create(
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
