port = 54259
use_osc "localhost", port

live_loop :ping do
  use_real_time
  a, b, c = sync "/osc*/ping"
  ##| synth :prophet, note: a, cutoff: b, sustain: c
  play 60
  osc "/pong"
end

live_loop :pong do
  use_real_time
  a, b, c = sync "/osc*/pong"
  play 65
end
