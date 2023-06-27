require File.expand_path(File.dirname(__FILE__) + '/environment')

# cronを実行する環境変数
rails_env = ENV['RAILS_ENV'] || :development

# cronを実行する環境変数をセット
set :environment, rails_env

# cronのログの吐き出し場所
set :output, "#{Rails.root}/log/cron.log"

#1時間ごとに（:hour）実行する先程設定したrakeタスクを記入
every :hour do
  rake 'article_state:change_to_be_published'
end