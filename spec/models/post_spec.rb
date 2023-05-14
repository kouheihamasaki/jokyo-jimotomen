# frozen_string_literal: true

require 'rails_helper'
# require 'fixture_file_upload'　

describe 'モデルのテスト' do
  context "有効な投稿内容の場合は保存されるか" do
    example "データが保存されること" do
      user = create(:user)
      post = create(:post, user: user)
      expect(post).to be_present
    end
  end
end