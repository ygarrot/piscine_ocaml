(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   Try.ml                                             :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/31 16:01:10 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/06/01 20:21:01 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

module Try =
    struct
        type 'a elem = {
            mutable x: 'a
        }

        type 'a t = Success of 'a | Failure of exn

        let return (elem:'a) = Success elem

        let bind elem f = match elem with
            | Failure x -> Failure x
            | Success x -> Success (f x)

        let recover elem f = match elem with
        | Failure x -> f x
        | x -> x

        let filter elem f = match elem with
        | Success x when f x -> Failure x
        | Failure x -> Failure x
        | Success x -> Success x

        let flatten elem = match elem with
        | Success x -> x
        | Failure x -> x

    end

        let () =
            let n = Try.return (ref 1)
            in Try.bind n (fun x -> x := 2);
            print_endline (string_of_int !n)
