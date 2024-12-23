#### 1. Cachyos - Animations

animations {
    enabled = yes
	bezier = linear, 0.0, 0.0, 1.0, 1.0
    bezier = myBezier, 0.05, 0.9, 0.1, 1.05
    bezier = overshot, 0.05, 0.9, 0.1, 1.1
	bezier = cubic, 0.54, 0.22, 0.07, 0.74
    bezier = overshotCircle, 0.175, 0.885, 0.32, 1.275
	bezier = md3_standard, 0.2, 0.0, 0, 1.0
    bezier= bounce, 1, 1.6, 0.1, 0.85
    bezier = decel, 0.05, 0.7, 0.1, 1
    animation = windowsIn, 1, 3, bounce, popin 23%
    animation = windowsOut, 1, 7, bounce, slide
    animation = windows, 1, 2, md3_standard, slide
    animation = border, 1, 10, overshot
    animation = borderangle, 1, 100, linear, loop
    animation = fade, 1, 0.0000001, default
	animation = workspaces, 1, 4, decel, slidefadevert
  }
