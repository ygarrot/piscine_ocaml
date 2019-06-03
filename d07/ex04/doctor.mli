class doctor :
  string ->
  int ->
  People.people ->
  object
    val mutable _age : int
    val mutable _hp : int
    val _name : string
    val _sidekick : People.people
    method regenerate : unit
    method set_hp : int -> unit
    method talk : unit
    method to_string : string
    method travel_in_time : int -> int -> unit
    method use_sonic_screwdriver : unit
  end
