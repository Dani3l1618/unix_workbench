#! usr/bin/env bash
# Guessing Game !!

function check_proximity() {
  #$1 user_input
  #$2 total_items
  local too_low_factor=$(echo "0.5" | bc -l) 
  local too_hight_factor=$(echo "1.5" | bc -l) 
  local low_factor=$(echo "0.99" | bc -l) 
  local hight_factor=$(echo "1.01" | bc -l) 
  local factors=($too_low_factor $low_factor $too_hight_factor $hight_factor )
  local msg=("Too low!" "Low but close" "Too high!" "High but close" )
  local user_fact=0

  for ix in {0..3}
  do
    user_fact=$(echo "scale=0; ${factors[$ix]}*$2/1" | bc )
    if [[ $ix -le 1 && $1 -le $user_fact ]]
    then
      echo ${msg[$ix]}
      break
    fi
    
    if [[ $ix -ge 2 && $1 -ge $user_fact ]]
    then
      echo ${msg[$ix]}
      break
    fi

  done  
}

files=$(ls -p | grep -v / | wc -l)
has_won=0

echo "--- Guess how many files are in the current folder --- "
while [[ $has_won -eq 0 ]]; do
  read user_intent
  if [[ $user_intent -eq $files ]]; then
    has_won=1
    echo "You have won!!"
  else
    check_proximity $user_intent $files
    echo "Try again"
  fi
done
