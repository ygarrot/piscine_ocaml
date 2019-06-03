(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/29 10:57:51 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/29 13:50:28 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let () =
    let jackie = new People.people "Jackie Tyler"
    in let the_doctor = new Doctor.doctor "The Doctor" 300 jackie
    in let dalek = new Dalek.dalek
    in jackie#talk;
    the_doctor#talk;
    the_doctor#set_hp 50;
    print_endline the_doctor#to_string;
    the_doctor#travel_in_time 1 2;
    the_doctor#regenerate;
    print_endline the_doctor#to_string;
    dalek#talk;
    jackie#talk;
    the_doctor#talk;
    print_endline dalek#to_string;
    dalek#exterminate jackie;
    the_doctor#use_sonic_screwdriver;
    print_endline dalek#to_string;
    dalek#die
