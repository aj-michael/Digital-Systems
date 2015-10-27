gui_open_window Wave
gui_sg_create Clock70HMz_group
gui_list_add_group -id Wave.1 {Clock70HMz_group}
gui_sg_addsignal -group Clock70HMz_group {Clock70HMz_tb.test_phase}
gui_set_radix -radix {ascii} -signals {Clock70HMz_tb.test_phase}
gui_sg_addsignal -group Clock70HMz_group {{Input_clocks}} -divider
gui_sg_addsignal -group Clock70HMz_group {Clock70HMz_tb.CLK_IN1}
gui_sg_addsignal -group Clock70HMz_group {{Output_clocks}} -divider
gui_sg_addsignal -group Clock70HMz_group {Clock70HMz_tb.dut.clk}
gui_list_expand -id Wave.1 Clock70HMz_tb.dut.clk
gui_sg_addsignal -group Clock70HMz_group {{Status_control}} -divider
gui_sg_addsignal -group Clock70HMz_group {Clock70HMz_tb.RESET}
gui_sg_addsignal -group Clock70HMz_group {Clock70HMz_tb.LOCKED}
gui_sg_addsignal -group Clock70HMz_group {{Counters}} -divider
gui_sg_addsignal -group Clock70HMz_group {Clock70HMz_tb.COUNT}
gui_sg_addsignal -group Clock70HMz_group {Clock70HMz_tb.dut.counter}
gui_list_expand -id Wave.1 Clock70HMz_tb.dut.counter
gui_zoom -window Wave.1 -full
