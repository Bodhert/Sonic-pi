# minimal tecnho
use_bpm 120


with_fx :compressor do
  live_loop :kick do
    stop
    sample :bd_haus, rpitch: 2, compress: 1, amp: 0.9
    sleep 1
  end
end

with_fx :reverb, room: 0.8  do
  with_fx :distortion, distort: 0.4 do
    live_loop :toms do
      sample :drum_tom_mid_hard,
        rate: 1.8,
        pitch: 1,
        amp: (range 0.1, 1, step: 0.1).mirror.tick
      sleep 4
    end
  end
end


with_fx :band_eq, freq: 10, res: 0.1, mix: 1 do
  with_fx :distortion, distort: 0.7 do
    with_fx :reverb, room: 1, pre_amp: 0.5 do
      live_loop :fast_drum_roll do
        sample :drum_snare_soft, amp: 0.1, pitch: (range 1, 12, step: 0.1).mirror.tick, finish: 0.5
        sleep 0.5 / 2
      end
    end
  end
end

live_loop :techno_bass do
  use_synth :tb303  # Classic bass synth sound for techno
  with_fx :distortion, distort: 0.3 do
    with_fx :reverb, room: 0.6, mix: 0.4 do
      8.times do
        play :e1, release: 0.25, cutoff: rrand(70, 90), amp: 1, sustain: 1, env_curve: 2  # Low bass note
        sleep 0.5  # Quarter note rhythm
      end
    end
  end
end

live_loop :techno_synth do
  use_synth :prophet  # Rich, bright, and versatile synth sound
  with_fx :echo, phase: 0.25, decay: 3 do
    with_fx :reverb, room: 0.7, mix: 0.5 do
      play_pattern_timed [:g4, :b4, :d5, :e5], [0.5, 0.5, 1, 1], release: 0.2, cutoff: 100, amp: 0.5
    end
  end
  sleep 4
end



# bajo algo pedorro, jugar con el pitch y el windows size
##| live_loop :kick do
##|   sample :bd_haus, window_size: 0.09, pitch: 23
##|   sleep 1
##| end

# it sounds like when we turn of the oven with "sparkles"
##| live_loop :kick do
##|   16.times do
##|     sample :bd_haus, sustain: 0.001
##|     sleep [0.1, 0.15, 0.2].choose
##|   end
##|   sleep 1
##| end