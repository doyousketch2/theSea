function love .conf(t)

  local w  = t .window
  local m  = t .modules

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  w .title  = 'Löve the Sea'
  w .icon   = 'icon.png'

  w .width  = 640
  w .height = 480

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  m .timer   = true       -- Provides high-resolution timing functionality,
                          -- Disabling it will result 0 delta time in love.update
  m .event   = true       -- Manages events, like keypresses.

  m .mouse     = true     -- Provides an interface to the user's mouse.
  m .keyboard  = true     -- Provides an interface to the user's keyboard.
  m .joystick  = false    -- Provides an interface to connected joysticks.
  m .touch     = true     -- Provides an interface to touch-screen presses.

  m .window    = true     -- Enable the window module (boolean)
  m .image     = true     -- Provides an interface to decode encoded image data.
  m .graphics  = true     -- The primary responsibility for the love.graphics module is the drawing of
                          -- lines, shapes, text, Images and other Drawable objects onto the screen.
                          -- Its secondary responsibilities include loading external files (including Images and Fonts) into memory,
                          -- creating specialized objects (such as ParticleSystems or Canvases) and managing screen geometry.

  m .sound   = true       -- This module is responsible for decoding sound files. It can't play the sounds, see love.audio for that.
  m .audio   = true       -- Provides an interface to output sound to the user's speakers.
  m .video   = false      -- This module is responsible for decoding, controlling, and streaming video files.

  m .math     = true      -- Provides system-independent mathematical functions.
  m .physics  = false     -- Can simulate 2D rigid body physics in a realistic manner. This module is based on Box2D

  m .system   = true      -- Provides access to information about the user's system.
  m .thread   = true      -- Allows you to work with threads.

--  filesystem            ** Provides an interface to the user's filesystem.
--  font                  ** Allows you to work with fonts.

end
