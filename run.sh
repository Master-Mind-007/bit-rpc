#!/bin/bash

# Start bitcoind in daemon mode
bitcoind -daemon

# Sleep for 10 seconds
sleep 10
echo "Taking 10s nap!"

# Stop the bitcoind server
bitcoin-cli stop

# Sleep for another 10 seconds
sleep 10
echo "Taking 10s nap!"

# Start bitcoind again
bitcoind -daemon

# Sleep for another 10 seconds
sleep 10
echo "Taking 10s nap!"

npm start
