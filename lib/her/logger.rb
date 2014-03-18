ActiveSupport::Notifications.subscribe('request.faraday') do |name, starts, ends, _, env|
  Rails.logger.info "#{env[:method].upcase} #{env[:url]}"
  Rails.logger.info "==> %s %s (%0.2f ms)" % [env[:status], Rack::Utils::HTTP_STATUS_CODES[env[:status]], (ends.to_f - starts.to_f) * 1000.0]
end