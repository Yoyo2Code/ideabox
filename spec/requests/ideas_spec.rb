require 'rails_helper'

describe "Ideas enpoint" do
  fixtures :ideas
  it "sends all companies" do

    get '/api/v1/ideas'

    expect(response).to be_success

    json = JSON.parse(response.body)

    idea = json.first

    expect(idea).to include("title")
    expect(idea).to include("body")
    expect(idea).to include("quality")
  end
end
