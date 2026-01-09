# big dirty stinky bass recreation

use_synth :square
use_bpm 136
live_loop :dirty_base do
  with_fx :distortion, distort: 0.9 do
    note =  30
    play note, release: 0.5
    sleep 2
    play note + 4, release: 0.5
    sleep 2
    play note - 4, release: 4
    sleep 4
  end
end

live_loop :drums do
  sample :bd_ada, amp: 2
  sleep 1
  sample :drum_cymbal_closed, start: 0.1, finish: 0.2, amp: 3
  sleep 1
end