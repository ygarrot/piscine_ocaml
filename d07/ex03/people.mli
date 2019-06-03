class people :
  string ->
  object
    val _hp : int
    val _name : string
    method die : unit
    method talk : unit
    method to_string : string
  end
