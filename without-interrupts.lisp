;;;; without-interrupts.lisp

(in-package #:without-interrupts)

(defmacro without-interrupts (&BODY BODY)
  #+sbcl
  `(sb-sys:without-interrupts ,@body)
  #+ccl
  `(ccl:without-interrupts ,@body)
  #+clisp
  `(clisp:with-deferred-interrupts ,@body)
  #+ecl
  `(mp:without-interrupts ,@body)
  #+allegro
  `(with-delayed-interrupts ,@body)
  #+lispworks
  `(mp:with-interrupts-blocked ,@body)
  #+abcl
  (error "'without-interrupts' is not supported in ABCL"))
