module Player :
  sig
    type t = Circle | Cross | None
    val toString : t -> string
    val toStringVerbose : t -> string
  end
module Grid :
  sig
    type 'a column = 'a list
    type 'a row = 'a column list
    type 'a grid = {
      index : int;
      rows : 'a grid row;
      owner : 'a;
      size : int;
      child_size : int;
      cell_taken : int;
      isowned : bool;
    }
    val concat_tab :
      string list list ->
      string -> string list list -> 'a -> bool -> int -> string
    val toString : 'a grid -> int -> string
    val newGrid : int list -> int -> int -> int -> Player.t grid
    val setColumn :
      Player.t grid list -> Player.t -> int list -> int -> Player.t grid list
    val setCell :
      Player.t grid row ->
      Player.t grid ->
      Player.t -> int list -> int -> int -> Player.t grid row
    val line_as_point : string -> int list
    val setEndGrid : Player.t grid -> Player.t -> 'a
    val setOwned : 'a option grid -> 'a option grid
    val check_horizontal : Player.t grid list -> Player.t
    val check_vertical : Player.t grid row -> int -> Player.t
    val check_diagonal : Player.t grid row -> int -> int -> Player.t
    val check_all_horizontal : Player.t grid row -> Player.t
    val check_all_vertical : Player.t grid -> int -> Player.t
    val check_all_diagonal : Player.t grid -> int -> Player.t
    val check_all : Player.t grid -> Player.t
    val getOwner : Player.t grid -> Player.t
  end
