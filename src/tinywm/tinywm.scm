(define (main)
  (let ((dpy (X/open-display 0))
	(out (current-output-port)))
    (let ((window (X/default-root-window dpy))
	  (mask (bitwise-ior X/button-press-mask (bitwise-ior X/button-release-mask X/pointer-motion-mask)))
	  (keycode-f1 (X/keysym-to-keycode dpy (X/string-to-keysym "F1"))))

      (X/grab-key dpy keycode-f1 X/mod1-mask window #t X/grab-mode-async X/grab-mode-async)
      (X/grab-button dpy 1 X/mod1-mask window #t mask X/grab-mode-async X/grab-mode-async 0 0)
      (X/grab-button dpy 3 X/mod1-mask window #t mask X/grab-mode-async X/grab-mode-async 0 0)

      (do ((evt (X/next-event dpy (null-pointer)) (X/next-event dpy evt)))
	  ((= 1 0) evt)
	(cond
	 ((= (X/event-type evt) X/key-press) (write-string "to go here: XRaiseWindow\n" out))
	 ((= (X/event-type evt) X/button-press) (write-string "Cache window position" out))
	 ((= (X/event-type evt) X/button-release) (write-string "Release window" out))
	 ((= (X/event-type evt) X/motion-notify) (write-string "to go here: XMoveResizeWindow" out))
	 (else (write-string "No Event\n" out)))
	)))
  0)

