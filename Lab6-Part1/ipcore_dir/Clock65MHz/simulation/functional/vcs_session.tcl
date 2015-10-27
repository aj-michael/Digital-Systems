gui_open_window Wave
gui_sg_create Clock65MHz_group
gui_list_add_group -id Wave.1 {Clock65MHz_group}
gui_sg_addsignal -group Clock65MHz_group {Clock65MHz_tb.test_phase}
gui_set_radix -radix {ascii} -signals {Clock65MHz_tb.test_phase}
gui_sg_addsignal -group Clock65MHz_group {{Input_clocks}} -divider
gui_sg_addsignal -group Clock65MHz_group {Clock65MHz_tb.CLK_IN1}
gui_sg_addsignal -group Clock65MHz_group {{Output_clocks}} -divider
gui_sg_addsignal -group Clock65MHz_group {Clock65MHz_tb.dut.clk}
gui_list_expand -id Wave.1 Clock65MHz_tb.dut.clk
gui_sg_addsignal -group Clock65MHz_group {{Status_control}} -divider
gui_sg_addsignal -group Clock65MHz_group {Clock65MHz_tb.LOCKED}
gui_sg_addsignal -group Clock65MHz_group {{Counters}} -divider
gui_sg_addsignal -group Clock65MHz_group {Clock65MHz_tb.COUNT}
gui_sg_addsignal -group Clock65MHz_group {Clock65MHz_tb.dut.counter}
gui_list_expand -id Wave.1 Clock65MHz_tb.dut.counter
gui_zoom -window Wave.1 -full
