class ApplicationController < ActionController::Metal
  abstract!
 
  include ActionController::MimeResponds     # enables serving different content types like :xml or :json
  include AbstractController::Callbacks      # callbacks for your authentication logic
  include ActionController::StrongParameters
 
  private
 
  def render(options={})
    self.status = options[:status] || 200
    self.content_type = 'application/json'
    body = Oj.dump(options[:json], mode: :compat)
    self.headers['Content-Length'] = body.bytesize.to_s
    self.response_body = body
  end
 
  ActiveSupport.run_load_hooks(:action_controller, self)
end