# Welcome to Sonic Pi

# quick simplified sketch of Davay - Tri Poloski

use_bpm 160
with_fx :lpf, cutoff: 100, cutoff_slide: 0.5 do | lpf |
  define :donk do | n, a = 2 |
    use_synth :square
    use_synth_defaults release: 0.25
    if n != :r
      play n, amp: a
      play n + 19, amp: a * 0.4
      control lpf, cutoff: 10
    end
  end
end

live_loop :donk_bass do
  pat = [:r, :ef2] * 3 + [:ff2, :af2] + [:r, :af2] * 3 + [:ff2, :ef2]
  donk(pat.tick)
  sleep 0.5
end

##| with_fx :krush, mix: 0.3 do
##|   live_loop :drums, amp: 0.2 do
##|     tick
##|     sample :bd_fat if spread(1, 8).look
##|     sample :sn_zome, rate: 1.2, finish: 0.3 if spread(1, 8).look(offset: 4)
##|     sample :hat_cats, amp: 0.7, finish: 0.2 if spread(1, 4).look()
##|     sample :hat_tap, amp: 0.7

##|     sleep 0.25
##|   end
##| end