(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_print_comb.ml                                   :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/20 11:40:32 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/20 16:51:15 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let ft_print_comb () =
    let max_value = 789 in
    let rec print_comb x y z =
        let current = (x * 100) + (y * 10) + z in
        if (current = max_value)
            then print_string "789\n"
        else
            begin
                if z <= 9
                then
                    begin
                        print_int x;
                        print_int y;
                        print_int z;
                        print_string ", ";
                       print_comb x y (z + 1)
                    end
                else
                    if y <= 8
                then print_comb x (y + 1) (y + 2)
                else 
                    if x <= 9
                        then print_comb (x + 1) (x + 1) z
            end
        in
        print_comb 0 1 2 


let main () =
    ft_print_comb ()

let () = main ()
