#!/bin/bash

# Prompt user for date and time
read -p "Enter the time to run the script (HH:MM): " run_time
read -p "Enter the date to run the script (DD MM YYYY): " run_day run_month run_year

# Convert input to cron format
minute=$(echo $run_time | cut -d: -f2)
hour=$(echo $run_time | cut -d: -f1)
day=$run_day
month=$run_month

# Ensure the cron job runs only once by creating a temporary script
script_path="/c/Users/saigo/Git repository/'system storage information.sh'"
log_path="/c/Users/saigo/Git repository/system_storage_info.log"

# Add cron job
(crontab -l 2>/dev/null; echo "$minute $hour $day $month * bash '$script_path' > '$log_path' 2>&1 && crontab -r") | crontab -

echo "Cron job scheduled to run on $run_day-$run_month-$run_year at $run_time."
