for (( ; ; ))
do
	clear
	cd $(dirname $0)
	java -jar ../SourceBin/Prerequisites/KickAssembler/KickAss.jar ../SourceBin/main.src -showmem
	if [ $? -eq 0 ]
		then
			x64 -VICIIborders 2 +confirmexit ../SourceBin/main.prg
		else
			echo "****************************************"
			echo "*** error(s) found during assembling ***"
			echo "****************************************"
			read -n 1
	fi
done



