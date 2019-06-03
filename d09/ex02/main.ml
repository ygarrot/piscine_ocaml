(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/31 13:56:41 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/06/01 19:32:26 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

module type MONOID =
    sig
        type element
        val zero1 : element
        val zero2 : element
        val mul : element -> element -> element
        val add : element -> element -> element
        val div : element -> element -> element
        val sub : element -> element -> element
    end

module type CALC =
    functor (M : MONOID) ->
        sig
            val add : M.element -> M.element -> M.element
            val sub : M.element -> M.element -> M.element
            val mul : M.element -> M.element -> M.element
            val div : M.element -> M.element -> M.element
            val power : M.element -> int -> M.element
            val fact : M.element -> M.element
        end


module Calc : CALC =
    functor (M: MONOID) ->
        struct
            let add = M.add
            let sub = M.sub
            let mul = M.mul
            let div = M.div
            let rec power (x:M.element) n = match n with
                | 0 -> M.zero2
                | n when n < 0 -> M.zero1
                | n when n > 0 -> M.mul x (power x (n - 1))
            let fact elem_1 = elem_1
        end

module INT : MONOID with type element = int =
    struct
        type element = int
        let zero1 = 0
        let zero2 = 1
        let add = ( + )
        let sub = ( - )
        let mul = ( * )
        let div = ( / )
    end

module FLOAT : MONOID with type element = float =
    struct
        type element = float
        let zero1 = 0.0
        let zero2 = 1.0
        let add = ( +. )
        let sub = ( -. )
        let mul = ( *. )
        let div = ( /. )
    end

module Calc_int = Calc(INT)
module Calc_float = Calc(FLOAT)

let () =
    print_endline (string_of_int (Calc_int.power 3 3));
            print_endline (string_of_float (Calc_float.power 3.0 3));
            print_endline (string_of_int (Calc_int.mul (Calc_int.add 20 1) 2));
            print_endline (string_of_float (Calc_float.mul (Calc_float.add 20.0 1.0) 2.0));
            print_endline (string_of_float (Calc_float.add (Calc_float.div 20.0 1.0) 2.0));
            print_endline (string_of_float (Calc_float.mul (Calc_float.power 20.0 2) 2.0));

    print_endline (string_of_int (Calc_int.power 3 3));
            print_endline (string_of_int (Calc_int.power 3 3));
            print_endline (string_of_int (Calc_int.mul (Calc_int.add 20 1) 2));
            print_endline (string_of_int (Calc_int.mul (Calc_int.add 20 1) 2));
            print_endline (string_of_int (Calc_int.add (Calc_int.div 20 1) 2));
            print_endline (string_of_int (Calc_int.mul (Calc_int.power 20 2) 2))



