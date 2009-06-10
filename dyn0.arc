(mac declare-dynamic (name (o init))
  `(do (= ,name (mz.make-parameter ,init))
       (autocall ,name)))

(mac underlying-param-procedure (name)
  (let global-name (mz.ac-global-name name)
    `(mz ,global-name)))

(mac dynamic (param-name value . body)
  (w/uniq (param-procedure v f)
    `(with (,param-procedure (underlying-param-procedure ,param-name)
            ,v ,value
            ,f (fn () ,@body))
       (mz (parameterize ((,param-procedure ,v)) (,f))))))
