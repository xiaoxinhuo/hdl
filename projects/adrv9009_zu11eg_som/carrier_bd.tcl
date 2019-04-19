
add_files -fileset constrs_1 -norecurse ./carrier_constr.xdc

create_bd_port -dir I axi_fan_tacho_i
create_bd_port -dir O axi_fan_pwm_o

ad_ip_instance axi_fan_control axi_fan_control_0
ad_ip_parameter axi_fan_control_0 CONFIG.ID 1

ad_connect axi_fan_tacho_i axi_fan_control_0/tacho
ad_connect axi_fan_pwm_o axi_fan_control_0/pwm

ad_cpu_interrupt ps-14 mb-14 axi_fan_control_0/irq
ad_cpu_interconnect 0x80000000 axi_fan_control_0
