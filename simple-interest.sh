#!/bin/bash

# Simple Interest Calculator

echo "Simple Interest Calculator"

echo "Enter the Principal Amount:"
read principal

echo "Enter the Rate of Interest:"
read rate

echo "Enter the Time Period:"
read time

simple_interest=$(( principal * rate * time / 100 ))

echo "Simple Interest = $simple_interest"
