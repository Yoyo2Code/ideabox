require 'spec_helper'

describe "Update Idea", :type => :feature, :js => true do
  xit "can update an idea" do
    item = Idea.create(title: "something", body: "new")

    visit '/'

    find(:xpath, '//*[@id="idea-title"]').click_on
    fill_in "title", :with => "new idea"

    find(:xpath, '//*[@id="idea-body"]').click_on
    fill_in 'body', :with => "new body"

    within("#ideas") do
      expect(page).to have_content("new idea")
      expect(page).to have_content("new body")
    end

    visit '/'

    within("#ideas") do
      expect(page).to have_content("new idea")
      expect(page).to have_content("new body")
    end
  end
end
