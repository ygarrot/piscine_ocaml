class type reaction =
  object
    method balance : reaction
    method get_end : (Molecule.molecule * int) list
    method get_start : (Molecule.molecule * int) list
    method is_balanced : bool
  end
