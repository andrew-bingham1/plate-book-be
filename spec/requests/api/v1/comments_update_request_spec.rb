require 'rails_helper'

RSpec.describe "edit comment" do
  before do 
    test_data_hot
  end
  it "edits comment" do
    expect(@comment_6.body).to eq("Comment 6")
    # put "/api/v1/posts/#{}"
  end
end