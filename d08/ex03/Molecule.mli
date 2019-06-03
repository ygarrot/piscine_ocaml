val sort_list : < symbol : string; .. > -> < symbol : string; .. > -> int
type formula_type = string
class virtual molecule :
  string ->
  Atom.atom list ->
  object ('a)
    method equals : 'a -> bool
    method formula : formula_type
    method name : string
    method to_string : string
  end
class water :
  object ('a)
    method equals : 'a -> bool
    method formula : formula_type
    method name : string
    method to_string : string
  end
class carbon_dioxyde :
  object ('a)
    method equals : 'a -> bool
    method formula : formula_type
    method name : string
    method to_string : string
  end
class carbon_monoxyde :
  object ('a)
    method equals : 'a -> bool
    method formula : formula_type
    method name : string
    method to_string : string
  end
class diamond :
  object ('a)
    method equals : 'a -> bool
    method formula : formula_type
    method name : string
    method to_string : string
  end
class ruby :
  object ('a)
    method equals : 'a -> bool
    method formula : formula_type
    method name : string
    method to_string : string
  end
