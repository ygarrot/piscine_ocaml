(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_sum.ml                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/21 13:34:28 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/21 17:01:33 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let ft_sum f min max =
    if max < min then nan
    else begin let rec sum_aux n =
        if n < min then 0.0
        else (f n) +. (sum_aux ( n - 1 ))
    in sum_aux max end

let main () =
    print_float ( ft_sum ( fun i -> float_of_int ( i * i ) ) 20 10 );
    print_char '\n';
    print_float ( ft_sum ( fun i -> float_of_int ( i * i ) ) 1 10 );
    print_char '\n'

let () = main ()
