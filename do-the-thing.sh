#!/bin/bash

ENDPOINTS=("constants/" "expenses/")

for endpoint in ${ENDPOINTS[@]}; do
    echo "Requesting https://www.consumerfinance.gov/paying-for-college2/understanding-your-financial-aid-offer/api/$endpoint"
    curl https://www.consumerfinance.gov/paying-for-college2/understanding-your-financial-aid-offer/api/$endpoint | jq > "$endpoint$(date +%F).json"
    # Compare with current file
    # If there is any diff, rename existing current to yesterday's date, copy today's file to current
done
