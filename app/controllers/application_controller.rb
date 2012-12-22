class ApplicationController < ActionController::API

  after_filter :allow_cross_domain

  def allow_cross_domain
    #headers["Access-Control-Allow-Origin"] = request.env['HTTP_ORIGIN']
    #headers["Access-Control-Request-Method"] = "*"
    #headers["Access-Control-Allow-Methods"] = "PUT, OPTIONS, GET, DELETE, POST"
    #headers['Access-Control-Allow-Headers'] = '*,x-requested-with,Content-Type'
    #headers["Access-Control-Max-Age"] = 1728000
  end
end
