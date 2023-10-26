#!/bin/bash

# Start bitcoind in daemon mode
bitcoind -daemon

# Sleep for 20 seconds
echo "Started Daemon | Taking 10s nap!"
sleep 10

echo "Verifing Block Count:"
bitcoin-cli getblockcount

echo "BitCore Logs!"
tail ~/.bitcoin/debug.log

while true; do
  echo "Task is Alive!"
  bitcoin-cli getaddressinfo
  sleep 600
done
