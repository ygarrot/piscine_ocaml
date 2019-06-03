(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: ygarrot <marvin@42.fr>                     +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2019/05/29 10:57:51 by ygarrot           #+#    #+#             *)
(*   Updated: 2019/05/29 14:20:34 by ygarrot          ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let () =
    let jackie = new People.people "Jackie Tyler"
    in let the_doctor_1 = new Doctor.doctor "The Doctor 1" 300 jackie
    in let the_doctor_2 = new Doctor.doctor "The Doctor 2" 300 jackie
    in let the_doctor_3 = new Doctor.doctor "The Doctor 3" 300 jackie
    in let dalek = new Dalek.dalek
    in let doctor_army = new Army.army the_doctor_1
    in let dalek_army = new Army.army dalek
    in let people_army = new Army.army jackie
    in jackie#talk;
    doctor_army#print_head;
    doctor_army#add the_doctor_2;
    doctor_army#print_head;
    doctor_army#add the_doctor_3;
    doctor_army#print_head;
    doctor_army#delete;
    doctor_army#print_head;
    doctor_army#delete;
    doctor_army#print_head;
    doctor_army#delete;
    doctor_army#print_head;
    doctor_army#delete;
    dalek_army#print_head;
    dalek_army#delete;
    dalek_army#print_head;
    people_army#print_head;
    people_army#delete;
    people_army#print_head;
