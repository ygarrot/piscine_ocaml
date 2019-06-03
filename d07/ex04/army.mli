class ['a] army :
  'a ->
  object
    constraint 'a = < to_string : string; .. >
    val mutable _member : 'a list
    method add : 'a -> unit
    method choose_random : 'a
    method delete : unit
    method is_alive : bool
    method print_head : unit
    method talk : unit
  end
