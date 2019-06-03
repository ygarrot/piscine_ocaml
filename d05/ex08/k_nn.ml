(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   one_nn.ml                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/28 20:26:52 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/28 23:17:02 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

type radar = float array * string

let eu_dist a b = 
    let sum = ref 0.0
    in let size = min (Array.length a) (Array.length b)
    in for i = 0 to size - 1 do
        let tmp = a.(i) -. b.(i)
        in  sum := !sum +. (tmp *. tmp)
    done;
    sqrt !sum

let choose lst =
    let current_group = ref (0,0.0, "")
    in let nearest = Array.of_list lst
    in for i = 0 to (Array.length nearest) -1;do
        let current = nearest.(i)
        in let (current_count, current_min, current_str) = current 
        in let (count, min, str) = !current_group
        in let choose_nearest count min = match (count,min) with
            | (count, min) when count = current_count && min < min -> current_group := current
            | (count, _) when count < current_count -> current_group := current
            | _ -> ()
        in choose_nearest count min
    done; !current_group

let string_sort x y = 
    let (_, a) = x
    in let (_, b) = y
    in if a = b then 0 else 1
(* current group = ( count, value_min, class)*)

let sort greater=
    let current_group = ref (0,max_float, "")
    in let ret = ref []
    in Array.sort string_sort greater; for i = 0 to (Array.length greater) - 1;do
        let current = greater.(i)
        in let (current_min, current_str) = current
        in let (count, min_v, str) = !current_group
        in let new_min = min min_v current_min
        in if current_str = "" then ()
        else if str = current_str
        then current_group := (count + 1, new_min, current_str)
        else begin ret := (!current_group::!ret); current_group := (0, current_min, current_str) end

    done; ret := (!current_group::!ret); !ret



let sort_fun x y = 
    let (a,_) = x
    in let (b, _) = y
    in if a > b then 1 else 0

let keep_nearest lst k radar =
    let filled = ref 0 
    in let nearest = Array.make k (0.0, "")
    in let (base_a, _) = radar
    in let radar_list = Array.of_list lst
    in for i = 0 to (Array.length radar_list - 1); do
        let (dist, str) = radar_list.(i)
        in let tmp = eu_dist dist base_a
        in let new_calc = (tmp, str)
        in if !filled <> k then begin
            nearest.(!filled) <- new_calc;
            Array.sort sort_fun nearest;
             ignore (incr filled);
             ()
             end 
        else
            begin 
            let (worst, _) = nearest.(k - 1)
            in if (worst > tmp) then ignore(nearest.(k - 1) <- new_calc)
            end
    done; nearest

let k_nn (radar_list:radar list) k (radar:radar) = 
    let nearest = keep_nearest radar_list k radar
    in let (_,_,ret) = choose (sort nearest)
    in ret

let main () = 
    let radar_list = [([|3.2;3.2;3.2|], "u"); ([|4.2;4.2;4.2|], "b"); ([|2.2;2.2;2.2|], "g");([|3.2;3.2;3.2|], "u"); ([|4.2;4.2;4.2|], "b"); ([|2.2;2.2;2.2|], "g")]
in let radar = ([|2.2;2.2;2.2|], "g")
in print_endline (k_nn radar_list 5 radar);
()


let () =
    main()
