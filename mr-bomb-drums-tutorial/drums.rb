use_bpm 98



live_loop :met1 do
  sleep 1
end

define :pattern do |pattern|
  if pattern.length != 16 then
    raise "pattern size should be 16"
  end
  
  return pattern.ring.tick == "❎"
end

live_loop :kick, sync: :met1 do
  sample :bd_haus  if pattern "❎⬜❎⬜⬜⬜⬜⬜❎⬜⬜⬜⬜❎⬜⬜"
  sleep 0.25
end

live_loop :clap, sync: :met1 do
  sample :sn_zome if pattern "⬜⬜⬜⬜❎⬜⬜⬜⬜⬜⬜⬜❎⬜⬜⬜"
  sleep 0.25
end

live_loop :close_hat, sync: :met1 do
  sample :drum_cymbal_closed if pattern "❎❎❎⬜❎⬜❎⬜❎⬜❎❎⬜❎⬜❎"
  sleep 0.25
end

live_loop :open_hat, sync: :met1 do
  sample :drum_cymbal_pedal if pattern "⬜⬜⬜❎⬜⬜⬜⬜⬜⬜⬜⬜❎⬜⬜⬜"
  sleep 0.25
end
