(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_rot_n.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/20 15:03:11 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/21 16:48:36 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let ft_rot_n n str = 
    let islower c = c >= 'a' && c <= 'z' in
    let isupper c = c >= 'A' && c <= 'Z' in
    let is_alpha c = islower c || isupper c in
    let swap_char c =
        let new_c = char_of_int ((n + (int_of_char c)) mod ((int_of_char 'z') + 3)) in
        if is_alpha c && is_alpha new_c
        then new_c
        else if is_alpha c then char_of_int ((int_of_char 'a' - 1) + ((int_of_char c + n) mod (int_of_char 'z')))
        else c
    in
    String.map swap_char str

let main () =
    print_string (ft_rot_n 1 "abcdefghijklmnopqrstuvwxyz");
    print_char '\n';
    print_string (ft_rot_n 13 "abcdefghijklmnopqrstuvwxyz");
    print_char '\n';
    print_string (ft_rot_n 42 "0123456789");
    print_char '\n';
    print_string (ft_rot_n 2 "OI2EAS67B9");
    print_char '\n';
    print_string (ft_rot_n 0 "Damned !");
    print_char '\n';
    print_string (ft_rot_n 1 "NBzlk qnbjr !");
    print_char '\n';
    print_string (ft_rot_n 1 "");
    print_char '\n'

let () = main ()
