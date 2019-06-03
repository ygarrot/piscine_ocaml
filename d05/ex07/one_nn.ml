(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   one_nn.ml                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/28 20:26:52 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/28 22:03:09 by ygarrot          ###   ########.fr       *)
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

let one_nn (lst:radar list) radar =
    let ret = ref ""
    in let radar_list = Array.of_list lst
    in let min = ref 0.0
    in let (base_a, _) = radar
    in for i = 0 to (Array.length radar_list - 1); do
        let (dist, str) = radar_list.(i)
        in let tmp = eu_dist dist base_a
        in if !min < tmp
        then min := tmp; ret := str;()
    done; !ret

let main () = 
    let radar_list = [ ([|3.2;3.2;3.2|], "u"); ([|4.2;4.2;4.2|], "b"); ([|2.2;2.2;2.2|], "g")]
in let radar = ([|2.2;2.2;2.2|], "g")
in print_endline (one_nn radar_list radar);
()


let () =
    main()
