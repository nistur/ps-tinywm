(define (main)
  (let ((dpy (X/open-display 0)))
    (let ((window (X/default-root-window dpy))
	  (mask (bitwise-ior X/button-press-mask (bitwise-ior X/button-release-mask X/pointer-motion-mask)))
	  (keycode-f1 (X/keysym-to-keycode dpy (X/string-to-keysym "F1"))))
      
      (X/grab-key dpy keycode-f1 X/mod1-mask window #t X/grab-mode-async X/grab-mode-async)
      (X/grab-button dpy 1 X/mod1-mask window #t mask X/grab-mode-async X/grab-mode-async 0 0)
      (X/grab-button dpy 3 X/mod1-mask window #t mask X/grab-mode-async X/grab-mode-async 0 0)
  0)

