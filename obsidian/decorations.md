#### 1. Material Blur

decoration {
  blur {
        enabled = true
        popups = true
        ignore_opacity = true
        # 8 is the max for 2 passes
        # size 7 pass 3 == backdrop-filter: blur(35px) == Figma background blur 70
        size = 6
        passes = 3
        # reset hyrpland defaults
        noise  = 0.0
        contrast = 1.0
        brightness = 1.0
        vibrancy = 0.0
        vibrancy_darkness = 0.0
    }
}