# Script to check if any Flop's D Pin is tied to HI or LO :

redirect flop_isTied.csv {
	foreach flop [get_object_name [all_registers -flops]] {
		set flop_dpin "$flop/D"
		
		if {[get_property [get_pins $flop_dpin] driver_ref_lib_cell_name] == "TIELBWP20P90CPDLVT"} {
			puts "$flop_dpin,TIELO"
		}
		
		if {[get_property [get_pins $flop_dpin] driver_ref_lib_cell_name] == "TIEHBWP20P90CPDLVT"} {
			puts "$flop_dpin,TIEHI"
		}
	}
}
