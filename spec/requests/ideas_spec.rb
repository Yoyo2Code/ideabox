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

  it "can delete an idea" do
    idea = Idea.create(
                       title: "small one",
                       body: "something small",
                       quality: "plausible"
                      )

    delete "/api/v1/ideas/#{idea.id}"

    expect(response).to be_success

    get '/api/v1/ideas'

    json = JSON.parse(response.body)

    expect(json).not_to include(idea.title)
    expect(json).not_to include(idea.body)
    expect(json).not_to include(idea.quality)
  end

  it "can update an idea" do
    idea = Idea.create(
                       title: "small one",
                       body: "something small",
                       quality: "plausible"
                      )

    put "/api/v1/ideas/#{idea.id}", { id: idea.id, idea: { title: "new title" } }

    updated_idea = Idea.find(idea.id)

    expect(updated_idea.title).to eq("new title")
  end
end
