(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_print_alphabet.ml                               :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/20 11:04:44 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/21 15:05:15 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let ft_print_alphabet () =
    let a = int_of_char 'a' in
    let z = int_of_char 'z' in
    let rec loop current_char =
        if current_char <= z
        then begin
            print_char (char_of_int current_char);
            loop (current_char + 1)
            end
     in
     loop a;
     print_char '\n'



let main () =
    ft_print_alphabet ()


let () = main ()
