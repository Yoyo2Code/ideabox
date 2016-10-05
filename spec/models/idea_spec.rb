require 'rails_helper'

RSpec.describe Idea, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it { should define_enum_for(:quality) }
end
