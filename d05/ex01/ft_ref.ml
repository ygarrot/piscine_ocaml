(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_ref.ml                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/27 12:52:34 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/28 22:13:26 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

type 'a ref_str = {
    mutable x:'a;
}

type 'a ft_ref = Null | Pointer of 'a ref_str

let return x = Pointer {x = x}

let get elem = match elem with
| Null -> invalid_arg "Attempt to dereference the null pointer"
| Pointer x -> x.x

let set ref new_x = match ref with
| Null -> invalid_arg "Attempt to dereference the null pointer"
| Pointer x -> x.x <- new_x

let bind ref f = match ref with
| Null -> invalid_arg "Attempt to dereference the null pointer"
| Pointer x -> let tmp = (f x.x)in set ref (get tmp); tmp

let add x = return (x + 1)

let main () =
    let t = (return 1)
    in let new_t = bind t add
    in print_int (get t);
    print_char '\n';
    set t 3;
    print_int (get t);
    print_char '\n';
    print_int (get new_t);
    print_char '\n';

    ()

let () = main ()
