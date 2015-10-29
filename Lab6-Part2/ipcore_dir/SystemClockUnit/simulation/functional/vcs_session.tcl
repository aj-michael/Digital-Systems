gui_open_window Wave
gui_sg_create SystemClockUnit_group
gui_list_add_group -id Wave.1 {SystemClockUnit_group}
gui_sg_addsignal -group SystemClockUnit_group {SystemClockUnit_tb.test_phase}
gui_set_radix -radix {ascii} -signals {SystemClockUnit_tb.test_phase}
gui_sg_addsignal -group SystemClockUnit_group {{Input_clocks}} -divider
gui_sg_addsignal -group SystemClockUnit_group {SystemClockUnit_tb.CLK_IN1}
gui_sg_addsignal -group SystemClockUnit_group {{Output_clocks}} -divider
gui_sg_addsignal -group SystemClockUnit_group {SystemClockUnit_tb.dut.clk}
gui_list_expand -id Wave.1 SystemClockUnit_tb.dut.clk
gui_sg_addsignal -group SystemClockUnit_group {{Status_control}} -divider
gui_sg_addsignal -group SystemClockUnit_group {SystemClockUnit_tb.LOCKED}
gui_sg_addsignal -group SystemClockUnit_group {{Counters}} -divider
gui_sg_addsignal -group SystemClockUnit_group {SystemClockUnit_tb.COUNT}
gui_sg_addsignal -group SystemClockUnit_group {SystemClockUnit_tb.dut.counter}
gui_list_expand -id Wave.1 SystemClockUnit_tb.dut.counter
gui_zoom -window Wave.1 -full
