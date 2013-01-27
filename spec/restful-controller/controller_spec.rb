require 'spec_helper'
require 'fixtures/application'
require 'fixtures/controllers'
require 'fixtures/models'
require 'rspec/rails'

describe PostsController, type: :controller do
  before do
    @post = Post.new
    @post_params = { title: "Title" }
    PostsController.any_instance.stub(:post_params).and_return(@post_params)
  end

  describe '#show' do
    it "has @post" do
      Post.stub(:find).with(@post.id.to_s).and_return(@post)
      get :show, id: @post.id
      assigns(:post).should eq(@post)
    end
  end

  describe '#edit' do
    it "has @post" do
      Post.stub(:find).with(@post.id.to_s).and_return(@post)
      get :edit, id: @post.id
      assigns(:post).should eq(@post)
    end
  end

  describe '#update' do
    it 'updates @post' do
      Post.stub(:find).with(@post.id.to_s).and_return(@post)

      @post.should_receive(:update_attributes).with(@post_params)

      put :update, {id: @post.id, post: @post_params }
    end
  end

  describe '#index' do
    it 'has @posts' do
      Post.stub(:all).and_return([@post])

      get :index, {id: @post.id}

      assigns(:posts).should eq([@post])
    end
  end

  describe '#destroy' do
    it 'destroys @post' do
      Post.stub(:find).with(@post.id.to_s).and_return(@post)

      @post.should_receive(:destroy)

      delete :destroy, {id: @post.id}
    end
  end

  describe '#create' do
    it 'builds and saves @post' do
      Post.should_receive(:build).with(@post_params).and_return(@post)
      @post.should_receive(:save)
      post :create, {id: @post.id, post: @post_params }
      assigns(:post).should eq(@post)
    end
  end

  describe '#new' do
    it 'builds @post' do
      Post.should_receive(:build).and_return(@post)
      get :new, {id: @post.id}
      assigns(:post).should eq(@post)
    end
  end
end