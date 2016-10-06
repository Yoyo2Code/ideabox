require 'rails_helper'

describe "Delete Idea", :type => :feature, :js => true do
  xit "can delete an idea" do
    item = Idea.create(title: "something", body: "new")

    visit '/'
    save_and_open_page
    within(".idea") do
      expect(page).to have_content(item.title)
      expect(page).to have_content(item.body)

      click_link_or_button "Delete"
    end

    expect(page).to_not have_css(".idea")
    expect(page).to_not have_content(idea.title)
    expect(page).to_not have_content(idea.body)
  end
end
