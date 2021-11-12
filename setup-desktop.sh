#!/bin/bash 



echo "========================= Dear $USER ===================================="
echo " this setup script will replace your current config without any "
echo " confirmation!"
echo " please press Ctrl+c to cancel or wait to continue"
echo ""
echo "========================================================================="

sleep 10s

# run script dir
run_script_dir=~/arco_my_config/scripts


# run the installation script
sh $run_script_dir/setup_desktop.sh



