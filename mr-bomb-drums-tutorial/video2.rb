##|  use_bpm 98

##| live_loop :met1 do
##|   sleep 1
##| end

##| define :pattern do |pattern, marker|
##|   if pattern.length != 16 then
##|     raise "pattern size should be 16"
##|   end
##|   print

##|   return pattern.ring.tick("#{marker}") == marker
##| end

##| live_loop :drums, sync: :met1 do
##|   sample :bd_haus if pattern [1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0], 1
##|   sample :sn_zome if pattern [0,0,0,0,2,0,0,0,0,0,0,0,2,0,0,0], 2
##|   sleep 0.25
##| end

patterns = [
  [1, 0, 0, 0, 2, 0, 0, 0, 1, 0, 0, 0, 2, 0, 0, 0],
  [1, 0, 1, 0, 2, 0, 0, 0, 1, 0, 1, 0, 2, 0, 0, 0],
  [1, 1, 0, 1, 2, 0, 0, 0, 1, 0, 1, 0, 2, 1, 0, 0],
  [1, 0, 0, 1, 2, 0, 1, 0, 1, 1, 0, 1, 2, 0, 1, 0]
]

live_loop :drums do
  ##| patterns.each do |pattern|
  pattern = choose(patterns)
  pattern.each do |hit|
    sample :bd_haus if hit == 1
    sample :sn_zome if hit == 2
    sleep 0.25
  end
  ##| end
end




