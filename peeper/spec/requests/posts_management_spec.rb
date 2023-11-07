require "rails_helper"

RSpec.describe "Post Management" do
  it "creates a post" do
    post "/posts", params: {
      post: {
        title: "What a great post",
        body: "Some very cool post is here, just come and read it!"
      }
    }
    expect(response).to redirect_to(post_url(Post.last.id))
  end
end
