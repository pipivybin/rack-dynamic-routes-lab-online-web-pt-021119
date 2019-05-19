class Application

def call(env)

  resp = Rack::Response.new
  req = Rack::Request.new(env)

  if req.path.match("/items/")

  else
    resp.write "error" 
    resp.status = 404

end

end
