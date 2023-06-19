use_bpm 112

live_loop :chop2 do
  sample (ring, :bd_haus, :sn_zome).choose
  sleep 1
end

live_loop :perc do
  sample [:perc_door, :elec_mid_snare, :glitch_perc3, :glitch_perc4].choose, amp: 0.5
  sleep 1
end

live_loop :amb do
  sample :ambi_soft_buzz, rate: 12
  sleep [1, 0.5, 0.5].tick
end

live_loop :rp do
  sample :elec_blip, rpitch: [1,5,2,8,9,7,4].tick
  sleep [0.75, 0.25, 0.5, 0.5].look
end

use_synth :dtri
live_loop :melody do
  use_random_seed 7575
  8.times do
    play scale(64, :minor, num_octaves: 2).choose, amp: 0.5
    sleep 0.5
  end
end

use_synth :chipbass
live_loop :bass do
  play (knit 40, 4, 47, 4).tick
  sleep [1.5, 0.5].look
end


