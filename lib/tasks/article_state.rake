namespace :article_state do
  desc '公開待ちの中で、公開日時が過去になっているものがあれば、ステータスを「公開」に変更する。'
  task change_to_be_published: :environment do
    Article.publish_wait.past_published.find_each(&:published!)
  end
end
