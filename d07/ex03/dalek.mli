val set_random_name : int -> string
class dalek :
  object
    val mutable _hp : int
    val _name : string
    val mutable _shield : bool
    method die : unit
    method exterminate : People.people -> unit
    method set_hp : int -> unit
    method talk : unit
    method to_string : string
  end
