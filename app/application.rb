class Application

def call(env)

  resp = Rack::Response.new
  req = Rack::Request.new(env)

  if req.path.match("/items/")
    item = req.path.split("/items/").last
    if the_item = Item.all.find {|x| x.name == item}.nil?
        resp.write "The item is not here"
        resp.status = 404
        resp.write the_item.price
  else
    resp.write "Route not found"
    resp.status = 404
  end
  resp.finish
end

end
