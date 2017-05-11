--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--  Löve the Sea
lo   = love

la   = lo .audio
le   = lo .event
lf   = lo .filesystem
lfo  = lo .font
lg   = lo .graphics
li   = lo .image
lj   = lo .joystick
lk   = lo .keyboard
lm   = lo .math
lmo  = lo .mouse
lp   = lo .physics
ls   = lo .sound
lsy  = lo .system
lth  = lo .thread
lt   = lo .timer
lto  = lo .touch
lv   = lo .video
lw   = lo .window

HEIGHT = lg .getHeight()
WIDTH  = lg .getWidth()

denver  = require 'libs/denver'  -- waveform gen
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function lo .load()
  print('Löve App begin')
  v = 0.001
  la .setVolume(.1)

  lg .setBackgroundColor( 0, 10, 50 )
  lm .randomseed(os .time())
  dots = 2000
end

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function lo .update(dt)
--volume fade
  vol = la .getVolume()
  vol = vol + v

  if vol > 1 then
    v = lm .random(-0.005, 0)
  elseif vol < 0.1 then
    v = -v
  end

  la .setVolume( vol )
end

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function lo .draw()

-- dots
  local wid = 10

  for i = 1,  vol * 300 do
    local x = lm .random(wid,  WIDTH -wid)
    local y = lm .random(wid,  HEIGHT -wid)

    if y < HEIGHT * .9 then
      if lm .random(0,  4) == 0 then
        r = lm .random(0,  y-100)
        g = r + 25
        b = g + 25
      else
        r = lm .random(0,  20)
        g = lm .random(0,  60)
        b = lm .random(0,  y)
      end
    else
      if lm .random(0,  4) == 0 then
        r = lm .random(0,  20)
        g = r + 25
        b = g + 25
      else
        r = lm .random(0,  y-100)
        g = r + 25
        b = g + 25
      end
    end

    lg .setColor( r, g, b )
    lg .setPointSize( y / 10 )
    lg .points(x, y)
  end

-- border
  lg .setLineWidth( wid * 2 )
  lg .setColor( 0,  vol * 100,  vol * 200 )
          -- topL,            topR,           bottomR,           bottomL,         topL again
  lg .line(wid, wid,  WIDTH-wid, wid,  WIDTH-wid, HEIGHT-wid,  wid, HEIGHT-wid,  wid, wid)

-- sound
  local w = 1
  local i = lm .random(0, 100)
  if i > 40 then  -- 40% pinknoise
    w = 2
  end
  local len = lm .random(0.1, 1)
  wave = {'pinknoise', 'brownnoise'}
  local noise  = denver .get({ waveform = wave[w],  length = len })
  la .play(noise)
end

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function lo .quit()
  print('Löve App exit')
end

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

