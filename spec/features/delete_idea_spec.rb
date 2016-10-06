require 'rails_helper'

describe "Delete Idea", :type => :feature, :js => true do
  it "can delete an idea" do
    Idea.delete_all
    idea = Idea.create(title: "something", body: "new")

    visit '/'

    within(".idea") do
      expect(page).to have_content(idea.title)
      expect(page).to have_content(idea.body)

      click_link_or_button "Delete"
    end

    expect(page).to_not have_css(".idea")
    expect(page).to_not have_content(idea.title)
    expect(page).to_not have_content(idea.body)
  end
end
