live_loop :microbit do
  use_real_time
  x, = sync "/osc/fromP5"
  if(x!=nil)
    synth :beep, note: x
  end
end
