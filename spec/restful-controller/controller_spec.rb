require 'spec_helper'
require 'fixtures/application'
require 'fixtures/controllers'
require 'fixtures/models'
require 'rspec/rails'

describe PostsController, type: :controller do
  before do
    @post = Post.new 1
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
    before do
      Post.stub(:find).with(@post.id.to_s).and_return(@post)
      @post.stub(:update_attributes).and_return(true)
    end

    it 'has @post' do
      put :update, id: @post.id, post: @post_params

      assigns(:post).should eq(@post)
    end

    it 'updates @post' do
      @post.should_receive(:update_attributes).with(@post_params)

      put :update, id: @post.id, post: @post_params
    end

    context 'when update is great success' do
      it 'redirects to model_url' do
        @post.stub(:update_attributes).and_return(true)

        put :update, id: @post.id, post: @post_params

        response.should redirect_to("/posts/#{@post.id}")
      end
    end

    context 'when update fails' do
      it 'renders :edit' do
        @post.stub(:update_attributes).and_return(false)
        PostsController.any_instance.stub(:render)

        PostsController.any_instance.should_receive(:render).with({action: 'edit'})

        put :update, id: @post.id, post: @post_params
      end
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
    before do
      Post.stub(:find).with(@post.id.to_s).and_return(@post)
      @post.stub(:destroy)
    end

    it 'has @post' do
      delete :destroy, id: @post.id

      assigns(:post).should eq(@post)
    end

    it 'destroys @post' do
      @post.should_receive(:destroy)

      delete :destroy, id: @post.id
    end

    it 'redirects to models_url' do
      delete :destroy, id: @post.id

      response.should redirect_to('/posts')
    end
  end

  describe '#create' do
    before do
      Post.stub(:build).and_return(@post)
      @post.stub(:save).and_return(true)
    end

    it 'has @post' do
      post :create, {id: @post.id, post: @post_params }

      assigns(:post).should eq(@post)
    end

    it 'builds @post' do
      Post.should_receive(:build).with(@post_params).and_return(@post)

      post :create, {id: @post.id, post: @post_params }
    end

    it 'saves @post' do
      @post.should_receive(:save).once

      post :create, {id: @post.id, post: @post_params }
    end

    context 'when save is great success' do
      it 'redirects to model_url' do
        post :create, {id: @post.id, post: @post_params }

        response.should redirect_to("/posts/#{@post.id}")
      end
    end

    context 'when save fails' do
      it 'renders :new' do
        @post.stub(:save).and_return(false)
        PostsController.any_instance.stub(:render)

        PostsController.any_instance.should_receive(:render).with({action: 'new'})

        post :create, {id: @post.id, post: @post_params }
      end
    end
  end

  describe '#new' do
    before do
      Post.stub(:build).and_return(@post)
    end

    it 'has @post' do
      get :new, id: @post.id

      assigns(:post).should eq(@post)
    end

    it 'builds @post' do
      Post.should_receive(:build).and_return(@post)

      get :new, id: @post.id
    end
  end
end