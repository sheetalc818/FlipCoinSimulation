#!/bin/bash -x
echo "===FlipCoin Simulation==="

#Variable
flipCount=0;
countHeads=0;
countTails=0;
percentHead=0;
percentTail=0;

#Dictionary
declare -A Combination

#Calculating Percentage for Head and Tail
function calPercentage()
{
	percentHead=$((($countHeads*100)/$flipCount))
	echo "PercentHead:" $percentHead

	percentTail=$((($countTails*100)/$flipCount))
	echo "PercentTails: " $percentTail
}

#To find Heads or Tails for single coin
function getFlip()
{
	#No. of coin
	local count=$1
	#Flip count
	local no=$2
   H=0
   T=0

	for (( i=0; i<$no; i++ ))
	do
	  coin=""
		for (( j=0; j<$count; j++ ))
		do
			if [ $((RANDOM%2)) -eq 1 ]
			then
				coin=$coin"H"
				((countHeads++))
			else
				coin=$coin"T"
				((countTails++))
			fi
		done
		echo $coin
		Combination[$coin]=$(( ${Combination[$coin]} + 1))
	done
	echo "================================================"

	#Printing value from dictionary
	for coin in ${!Combination[@]}
	do
		echo $coin ${Combination[$coin]}
	done

	#Calling calPercentage function
	calPercentage $countHeads $countTails $flipCount
}

#Function to flip single, double or Triple coin
function flipCoin()
{
	#Accepting input from user 
	function input()
	{
		read -p "How many coins you want flip:" coinCount
		read -p "How many times you want to flip coin:" flipCount
	}
	echo "==Select Operation from Menu=="
	read -p "1.Singlet  2.Doublet  3.Triplet : " choice

	#Case
	case $choice in
						1) input
							if [ $coinCount -eq 1 ]
							then
								getFlip $coinCount $flipCount
							else
								echo "Flipping one coin at a time!"
							fi
							;;
						2) input
							if [ $coinCount -eq 2 ]
							then
								getFlip $coinCount $flipCount
							else
								echo "Flipping Two coins at a time!"
							fi
							;;
						3) input
							if [ $coinCount -eq 3 ]
							then
								getFlip $coinCount $flipCount
							else
								echo "Flipping Three coins at a time!"
							fi
							;;
						*) echo "Select valid choice"
							exit
	esac
}

#Calling flipCoin function
flipCoin


