live_loop :bass_test do
  sample :bass_drop_c
  for a in 1..4 do
    sample :bass_dnb_f
    sleep 0.5
  end  
end
