class Application

def call(env)

  resp = Rack::Response.new
  req = Rack::Request.new(env)

  if req.path.match("/items/")
    item = req.path.split("/items/").last
    Item.find.each {|x| x.name == item}
    resp.write Item.price
  else
    resp.write "Route not found"
    resp.status = 404
  end
  resp.finish
end

end
