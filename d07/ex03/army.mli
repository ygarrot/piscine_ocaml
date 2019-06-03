class ['a] army :
  'a ->
  object
    constraint 'a = < to_string : string; .. >
    val mutable _member : 'a list
    method add : 'a -> unit
    method delete : unit
    method print_head : unit
  end
