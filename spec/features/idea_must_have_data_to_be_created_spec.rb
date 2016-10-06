require 'rails_helper'

describe "Idea creation", type: :feature, :js => true do
  it "idea does nothing without a title" do
    Idea.delete_all

    visit '/'

    fill_in 'idea-title', with: ""
    fill_in 'idea-body', with: "something"

    click_on 'Create Idea'

    expect(page).to_not have_css(".idea")
  end

  it "idea does nothing without a body" do
    Idea.delete_all

    visit '/'

    fill_in 'idea-title', with: "nothing"
    fill_in 'idea-body', with: ""

    click_on 'Create Idea'

    expect(page).to_not have_css(".idea")
  end
  
  it "idea does nothing without title and body" do
    Idea.delete_all

    visit '/'

    fill_in 'idea-title', with: ""
    fill_in 'idea-body', with: ""

    click_on 'Create Idea'

    expect(page).to_not have_css(".idea")
  end
end
