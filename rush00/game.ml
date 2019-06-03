(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   tic-tac-tic-tac-toe.ml                             :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/25 11:32:36 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/26 22:15:15 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

        module Player = 
            struct
                type t = Circle | Cross | None
                let toString player = match player with
            | Circle -> "O"
            | Cross -> "X"
            | None -> "-"
                let toStringVerbose player = match player with
            | Circle -> "Circle"
            | Cross -> "Cross"
            | None -> "None"

            end
            module Grid = 
                struct
type 'a column = 'a list
type 'a row = 'a column list
type 'a grid = {index:int;rows: 'a grid row ;owner: 'a;size:int;child_size:int;cell_taken:int;isowned:bool}


let rec concat_tab lst_base str lst total is_first index = match lst with
 | [] when is_first -> concat_tab lst_base (str ^ "\n") lst_base total false (index + 1)
 | [] -> concat_tab lst_base (str ^ " | ") lst_base total false (index + 1)
 | head::tail -> if index >= List.length head then str ^ "\n"
    else concat_tab lst_base (str ^ " " ^ List.nth head index) tail total is_first (index)

let rec concat_board lst = match lst with
| [] -> []
| head::tail -> let rec concat_cell lst = match lst with
| [] -> print_string "]";""
| head::tail -> print_endline head;head ^ (concat_cell tail)
in (concat_cell head::[])::(concat_board tail)

let rec toString grid count = match grid.size with
(*| 0 -> Player.toString grid.owner ^ ""*)
| 0 -> string_of_int grid.index ^ ""
| _ -> let rec columnToString column = match column with
        (*| head::tail when grid.child_size = 0 -> columnToString tail ^ " " ^ toString head (count -1)*)
        | head::tail -> (toString head (count -1))::(columnToString tail)
        | _ -> []

        in let rec rowToString row tab = match row with 
        | head::tail -> rowToString tail ((columnToString head)::tab)
        | [] -> if grid.child_size = 0 then let tmp = concat_board tab in
concat_tab tmp "" tmp (grid.size -1) (count = 2) 0
        else concat_tab tab "" tab (grid.size -1) (count = 2) 0

        in rowToString grid.rows []

let rec newGrid sizes index count current_count =
    if index >= List.length sizes
    then {
        index = current_count;
    rows = [];
    owner = Player.None;
    size = 0;
    cell_taken = 0;
    isowned = false;
    child_size = 0
}
    else begin 
    let rec new_columns size_list index current_size col_count = match current_size with
    | size when size > 0 ->
            (newGrid size_list (index + 1) (count) col_count)::(new_columns size_list index (current_size -1) (col_count +1 ))
    | _ -> []

    in let rec new_rows size_list index current_size row_count = match current_size with
    | size when size > 0 ->
        (new_columns size_list index (List.nth size_list index) (row_count))::(new_rows size_list index (current_size - 1) (row_count + current_size + 1))
    | _ -> []
    in let grid = new_rows sizes index (List.nth sizes index) count
    in let child_size grid = match grid with
        | head::_ -> begin match head with
                        | [] -> 0
                        | head::size -> head.size
                        end
        | _ ->0
    in {
        index = count;
        rows = grid;
        owner = Player.None;
        size = List.nth sizes index;
        cell_taken = 0;
        isowned = false;
        child_size = child_size grid
    }
    end
(*print_endline (string_of_int List.nth grid.size)*)

let rec setColumn column player index_tab x = match column with 
| head::tail when x = 0 && head.owner = Player.None ->
                 begin let iter_cell rows = match rows with
                | [] -> {head with owner = player}::tail
                | _ -> {head with rows = setCell head.rows head player index_tab (List.hd index_tab) 0}::tail
                in iter_cell head.rows end
| head::tail -> print_endline (string_of_int x);head::(setColumn tail player index_tab (x - 1))
| _ -> raise (Failure "This column is not free")

and setCell cells grid player index_tab current_index current_size = match cells with
| head::tail when current_index < current_size + grid.size -> 
        (setColumn head player index_tab (current_index - current_size))::tail
| head::tail -> head::(setCell tail grid player index_tab current_index (grid.size + current_size))
| [] -> raise (Failure "This Cell is not free")

let line_as_point line =
    List.map (fun x -> int_of_string x) (String.split_on_char ' ' line)

let rec setEndGrid grid player =
    let () = print_endline "enter a row and a column"
    in let tab = line_as_point (read_line ())
    (*in if 2 != grid.size then raise (Failure "you didnt pas enough point")*)
    in let tmp = {grid with rows = setCell grid.rows grid player tab (List.hd tab) 0} in setEndGrid tmp player

let setOwned grid = match (grid.size, grid.cell_taken, grid.child_size, grid.owner) with 
| (size, cell_taken, child_size, owner) when owner <> None -> {grid with isowned = true}
| (size, cell_taken, child_size, None) when size = cell_taken -> {grid with isowned = true}
| _ -> {grid with isowned = false}

(*
let rec setGrid grid =
    (*print_endline (string_of_int grid.child_size ^ string_of_int grid.size);*)
    print_endline (toString grid 2);
     if grid.size = 0 then grid 
    else
    let rec set_col_grid col = match col with
    | []->[]
    | head::tail -> (setGrid head)::(set_col_grid tail)
    in let rec set_row_grid rows = match rows with
    | [] -> []
    | head::tail -> (set_col_grid head)::(set_row_grid tail)
    in let set_grid grid = match (grid.isowned, grid.child_size) with
    | (false, 0) -> let row = (setEndGrid grid Player.Circle) in setGrid {grid with rows=row}
    | (false, _) -> setGrid {grid with rows=(set_row_grid grid.rows)}
    | _-> grid
    in set_grid grid
*)

let rec check_horizontal column = match column with
    | head::node::tail when head = node -> check_horizontal tail
    | head::[] -> getOwner head
    | _ -> Player.None

and  check_vertical row length = match row with
    | head::node::tail when List.nth head length = List.nth node length -> check_vertical tail length 
    | head::[] -> let row = List.nth head length in getOwner row
    | _ -> Player.None

and  check_diagonal row length incr = match row with
    | head::node::tail when List.nth head length
         = List.nth node length -> check_diagonal tail (length + incr)incr
    | head::[] -> let row = List.nth head length in getOwner row
    | _ -> Player.None

and  check_all_horizontal row = match row with
    | head::tail ->
            let player = check_horizontal head
            in if player <> Player.None then player 
    else check_all_horizontal tail
    | [] -> Player.None

and  check_all_vertical row length = match length with
    | length when length < row.size ->
            let player = check_vertical row.rows length
            in if player <> Player.None then player
            else check_all_vertical row (length + 1)
    | _ -> Player.None

and check_all_diagonal row size =
    let right = check_diagonal row.rows 0 1
        in let left = check_diagonal row.rows row.size (-1)
    in if left <> Player.None then right else left

and check_all grid =
    let horizontal = check_all_horizontal grid.rows
        in let vertical = check_all_vertical grid 0
    in let diagonal = check_all_diagonal grid grid.size
        in if horizontal <> Player.None then horizontal
    else if vertical <> Player.None then vertical else diagonal

and getOwner grid = match (grid.owner, grid.size) with
    | (_, 1) -> grid.owner
    | (player, _) when player <> Player.None -> grid.owner
    | _ -> check_all grid

    end

