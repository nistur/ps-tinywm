(define-structure xlib (export X/Display
			       X/Screen
			       X/Event
			       
			       X/open-display
			       X/string-to-keysym
			       X/keysym-to-keycode
			       X/default-root-window
			       X/grab-key
			       X/grab-button
			       X/next-event
			       
			       X/mod1-mask

			       X/button-press-mask
			       X/button-release-mask
			       X/pointer-motion-mask
			       
			       X/grab-mode-async
			       )
  (open prescheme)
  (open ps-record-types)
  (files xlib/interface))

(define-structure tinywm (export main)
  (open prescheme)
  (open ps-record-types)
  (open xlib)
  (files tinywm/tinywm))
