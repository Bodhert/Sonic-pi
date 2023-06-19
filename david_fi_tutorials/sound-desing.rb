att = 0
sus = 0.3
rel = 0.5
amp = 1

use_bpm 90


define :syn do |note|
  use_synth_defaults attack: att, sustain: sus, release: rel, amp: amp
  ##| synth :tri, note: note + 0.2, pan: 0
  ##| synth :saw, note: note
  synth :fm, note: note - 0.9, divisor: 3
  
end

##| play :ab4

with_fx :compressor do
  live_loop :tarkus do
    puts :eb4
    syn (ring :f3, :bb3, :eb4, :bb3, :gs4, :eb4, :bb3, :e4, :b3, :gb3).tick
    ##| syn (ring 53, 58, 63, 58, 68, 63, 58, 64, 59,54).tick
    sleep 0.25
  end
end

