class Application

def call(env)

  resp = Rack::Response.new
  req = Rack::Request.new(env)

  if req.path.match("/items/")
    item = req.path.split("/items/").last
    the_item = Item.all.find {|x| x.name == item}
        if the_item.nil?
        resp.write "Item not found"
        resp.status = 400
      else
        binding.pry
        resp.write the_item.price
      end
  else
    resp.write "Route not found"
    resp.status = 404
  end
  resp.finish
end

end
