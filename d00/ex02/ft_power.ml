(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_power.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/20 10:43:58 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/21 15:04:54 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec ft_power n pow =
    if pow <= 0
    then if pow = 0 then 1 else 0
    else (n * (ft_power n (pow - 1)))

let main () =
    print_int (ft_power 2 4);
    print_char '\n';
    print_int (ft_power 0 0);
    print_char '\n';
    print_int (ft_power 2 (-1));
    print_char '\n'

let () = main ()
