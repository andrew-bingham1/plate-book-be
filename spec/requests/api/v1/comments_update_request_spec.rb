require 'rails_helper'

RSpec.describe "edit comment" do
  before do 
    test_data_hot
  end
  it "edits comment" do
    expect(@comment_6.body).to eq("Comment 6")
    put "/api/v1/posts/#{@post_18.id}/comments/#{@comment_6.id}", params: {comment_id: @comment_6.id, body: "I have a million Ducks"}
    @comment_6.reload
    expect(@comment_6.body).to eq("I have a million Ducks")
  end
end