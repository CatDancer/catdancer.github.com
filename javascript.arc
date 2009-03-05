(lib "http://catdancer.github.com/json.arc")

(def js= (var expr)
  (string var " = " tojson.expr ";\n"))
