require 'rails_helper'

describe "Ideas enpoint" do
  fixtures :ideas
  it "sends all idea" do

    get '/api/v1/ideas'

    expect(response).to be_success

    json = JSON.parse(response.body)

    idea = json.first

    expect(idea).to include("title")
    expect(idea).to include("body")
    expect(idea).to include("quality")
  end

  it "creates an idea" do
    idea_params = {
      title: "bomb",
      body: "blows things up",
      quality: "swill"
    }

    idea = Idea.new(idea_params)

    post '/api/v1/ideas', { idea: idea_params }

    expect(response).to be_success

    json = JSON.parse(response.body)

    expect(json["title"]).to eq(idea.title)
    expect(json["body"]).to eq(idea.body)
    expect(json["quality"]).to eq(idea.quality)
  end
end
