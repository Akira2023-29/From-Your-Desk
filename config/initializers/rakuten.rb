RakutenWebService.configure do |c|
  # アプリケーションID
  c.application_id = ENV['RWS_APPLICATION_ID']

  # リクエストのリトライ回数
  c.max_retries = 3 # default: 5
end
