require 'rails_helper'

describe "Edit Idea", :type => :feature, :js => true do
  it "can edit an idea" do
    Idea.delete_all

    idea = Idea.create(title: "something", body: "new")

    visit '/'

    within(".idea") do
      find("#idea-title").click
      fill_in "title", :with => "new idea"

      find("#idea-body").click
      fill_in 'body', :with => "new body"
    end

    find(".container").click

    within(".idea") do
      expect(page).to have_content("new idea")
      expect(page).to have_content("new body")
    end
  end
end
