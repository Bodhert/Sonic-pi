live_loop :random_riff do
  use_random_seed (ring 1,2,3).tick
  8.times do
    play rrand_i(50, 95), release: 0.1
    sleep 0.125
  end
end
