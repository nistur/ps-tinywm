(define-structure test-module (export test-fun)
  (open prescheme)
  (files test/test-interface))

(define-structure hello (export main)
  (open prescheme)
  (open test-module)
  (files hello/hello-main))
