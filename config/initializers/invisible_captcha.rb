InvisibleCaptcha.setup do |config|
  config.sentence_for_humans     = 'We do not need you to fill this'
  config.error_message           = 'You are a robot!'
  config.honeypots              += 'fake_resource_title'
  config.visual_honeypots        = false
  config.timestamp_threshold     = 4.seconds
  config.timestamp_error_message = 'Sorry, that was too quick! Please resubmit.'
end
