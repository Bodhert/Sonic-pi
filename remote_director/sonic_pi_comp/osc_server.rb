define :get_port do |address|
  v= get_event(address).to_s.split(",")[6]
  if v != nil
    return v[3..-2].split("/")[0].split(":")[2].to_i
  else
    return ["error"]
  end
end

live_loop :ping do
  use_real_time
  name, answer , harcoded_number = sync "/osc*/ping"
  puts a
  
  port= get_port("/osc*/ping")
  puts "sending to port #{port}"
  play 60
  osc_send "127.0.0.1",port, "/pong"
end

live_loop :pong do
  use_real_time
  a, b, c = sync "/osc*/pong"
  puts "Received #{a},#{b},#{c}"
  play 65
end# Welcome to Sonic Pi

