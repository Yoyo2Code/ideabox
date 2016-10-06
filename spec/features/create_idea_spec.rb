require 'rails_helper'

describe "Create Idea", type: :feature, :js => true do
  it "can create an idea" do
    Idea.delete_all
    
    visit '/'

    fill_in 'idea-title', with: "new idea"
    fill_in 'idea-body', with: "there is something"

    click_on 'Create Idea'

    within(".idea") do
      expect(page).to have_content("new idea")
      expect(page).to have_content("there is something")
    end
  end
end
