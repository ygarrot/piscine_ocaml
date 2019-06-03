(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_print_comb.ml                                   :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/20 11:40:32 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/21 16:04:41 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let ft_print_comb () =
    let print_nb nb =
        if nb < 10 then print_string ("0" ^ (string_of_int nb)) else print_int nb  in
    let rec print_comb x y =
        if (x * 100  + y = 9899)
            then print_string "98 99\n"
        else
            begin
                if y <= 99
                then
                    begin
                        print_nb x;
                        print_char ' ';
                        print_nb y;
                        print_string ", ";
                       print_comb x (y + 1)
                    end
        else
            if x <= 99
                then print_comb (x + 1) (x + 2)
                    end
    in
        print_comb 0 1


let main () =
    ft_print_comb ()

let () = main ()
