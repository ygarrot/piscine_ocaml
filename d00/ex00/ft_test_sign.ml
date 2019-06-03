(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_test_sign.ml                                    :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/20 10:08:43 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/20 10:14:18 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let ft_test_sign number =
    if number >= 0
        then print_endline "positive"
        else print_endline "negative"

let main () =
    ft_test_sign 42;
    ft_test_sign ( -1 );
    ft_test_sign 0 

let () = main () 
