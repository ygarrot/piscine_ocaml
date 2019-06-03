val generate : int -> Atom.carbon list
class alkane :
  string ->
  int ->
  object ('a)
    method equals : 'a -> bool
    method formula : Molecule.formula_type
    method name : string
    method to_string : string
  end
class methane :
  object ('a)
    method equals : 'a -> bool
    method formula : Molecule.formula_type
    method name : string
    method to_string : string
  end
class ethane :
  object ('a)
    method equals : 'a -> bool
    method formula : Molecule.formula_type
    method name : string
    method to_string : string
  end
class octane :
  object ('a)
    method equals : 'a -> bool
    method formula : Molecule.formula_type
    method name : string
    method to_string : string
  end
