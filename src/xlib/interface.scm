(external-record-type X/Display "Display"
		      (X/Display))

(external-record-type X/Screen "Screen"
		      (X/Screen))


(external-record-type X/Event "XEvent"
		      (X/Event type)
		      (type integer type))

(define X/open-display
  (external "XOpenDisplay" (=> (integer) X/Display)))

(define X/string-to-keysym
  (external "XStringToKeysym" (=> ((^ char)) integer)))
(define X/keysym-to-keycode
  (external "XKeysymToKeycode" (=> (X/Display integer) char)))

(define X/default-root-window
  (external "DefaultRootWindow" (=> (X/Display) X/Screen)))

(define X/grab-key
  (external "XGrabKey" (=> (X/Display char integer X/Screen boolean integer integer) integer)))

(define X/grab-button
  (external "XGrabButton" (=> (X/Display integer integer X/Screen boolean integer integer integer integer integer) integer)))

(define next-event
  (external "XNextEvent" (=> (X/Display X/Event) integer)))
(define (X/next-event dpy evt)
  (if (not (null-pointer? evt))
      (deallocate evt))
  (let ((evt (X/Event 0)))
    (next-event dpy evt)
    evt))

(define X/mod1-mask (shift-left 1 3))

(define X/button-press-mask (shift-left 1 2))
(define X/button-release-mask (shift-left 1 3))
(define X/pointer-motion-mask (shift-left 1 6))

(define X/grab-mode-async 1)
