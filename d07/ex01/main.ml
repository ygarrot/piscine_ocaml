(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/29 10:57:51 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/29 12:06:05 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let () =
    let jackie = new People.people "Jackie Tyler"
    in let the_doctor = new Doctor.doctor "The Doctor" 300 jackie
    in jackie#talk;
    jackie#die;
    the_doctor#talk;
    the_doctor#set_hp 50;
    print_endline the_doctor#to_string;
    the_doctor#travel_in_time 1 2;
    the_doctor#regenerate;
    print_endline the_doctor#to_string;
    the_doctor#use_sonic_screwdriver
