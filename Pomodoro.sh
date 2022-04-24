#!/bin/bash

  while true
  do
      echo "How long do you plan on being productive in a number of hours?"
      read hours
      if [[ hours -gt 0 && hours -lt 24 ]]
      then
        break
      else
         echo "please enter valid time for break" 
      fi
  done
   
wseconds=${1:-hours}*60*60;

  # Check os and behave accordingly
  if [ "$(uname)" == "Darwin" ]; then
      date1=$((`date +%s` + $wseconds));
      while [ "$date1" -ge `date +%s` ]; do
        echo -ne "$(date -u -j -f %s $(($date1 - `date +%s`)) +%H:%M:%S)\r";
      done
      osascript -e 'display notification "Time to walk and rest!" with title "Break"';
      # getting minutes and validating you can use the $minutes later 
    
  while true
    do
      echo "How long do you need to take a break for in minutes"
      read minutes
      if [[ minutes -gt 0 && minutes -lt 60 ]]
      then
      break
      else
       echo "Please enter a valid time to take a break" 
      fi
    done
    
  pseconds=${1:-minutes}*60;
    date2=$((`date +%s` + $pseconds));
    while [ "$date2" -gt `date +%s` ]; do
      echo -ne "$(date -u -j -f %s $(($date2 - `date +%s`)) +%H:%M:%S)\r";
    done
    
  osascript -e 'display notification "Time to get back to work" with title "Work"';
  elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
     date1=$((`date +%s` +$wseconds));
     while [ "$date1" -ge `date +%s` ]; do
      echo -ne "$(date -u --date @$(($date1 - `date +%s` )) +%H:%M:%S)\r";
     done
   
notify-send "Break" "Time to walk and rest";
   # getting minutes and validating you can use the $minutes later 
    
  while true
    do
      echo "How long do you need to take a break for in minutes"
      read minutes
      if [[ minutes -gt 0 && minutes -lt 60 ]]
      then
      break
      else
       echo "please enter valid time for break" 
      fi
    done
  
  pseconds=${1:-minutes}*60;
  date2=$((`date +%s` + $pseconds));
  while [ "$date2" -ge `date +%s` ]; do
    echo -ne "$(date -u --date @$(($date2 - `date +%s` )) +%H:%M:%S)\r";
  done
   
  notify-send "Work" "Time to get back to work";
  else
  echo -ne "Your OS is currently not supported\n";
fiv
