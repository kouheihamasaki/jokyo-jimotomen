# frozen_string_literal: true

require 'rails_helper'

describe '投稿のテスト' do
  describe 'トップ画面(root_path)のテスト' do
    before do
      user = create(:user)
      post = create(:post, user: user)
      @user = create(:user)
      sign_in @user
      visit root_path
    end
    context '表示の確認' do
      it 'root_pathが"/"であるか' do
        expect(current_path).to eq('/')
      end
    end
  end

  describe "投稿画面(new_post_path)のテスト" do
    before do
      user = create(:user)
      post = create(:post, user: user)
      @user = create(:user)
      sign_in @user
      visit new_post_path
    end
    context '表示の確認' do
      it 'new_post_pathが"/posts/new"であるか' do
        expect(current_path).to eq('/posts/new')
      end
      it '投稿ボタンが表示されているか' do
        expect(page).to have_button '投稿'
      end
    end
  end

  describe "投稿一覧のテスト" do
    before do
      user = create(:user)
      post = create(:post, user: user)
      @user = create(:user)
      sign_in @user
      visit posts_path
    end
  end

  describe "詳細画面のテスト" do
    before do
      user = create(:user)
      post = create(:post, user: user)
      @user = create(:user)
      sign_in @user
      visit post_path(post)
    end
    context '表示の確認' do
      it '編集リンクが存在しているか' do
        expect(page).to have_link '編集'
      end
    end
  end

end