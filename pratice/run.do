vlib work
vlog *.sv
vsim -c +access+r work.tb
run -all
acdb save
acdb report -db fcover.acdb -txt -o cov.txt
exec cat cov.txt
exit