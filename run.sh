#!/bin/bash

#Initiate Redis Server
service redis-server start
echo "Started Redis Server!"

# Start bitcoind in daemon mode
bitcoind -daemon

# Sleep for 20 seconds
echo "Started Daemon | Taking 10s nap!"
sleep 10

echo "Verifing Block Count:"
bitcoin-cli getblockcount

bitcoin-cli stop
echo "Stopped Daemon!"

# Sleep for 10 seconds
echo "Taking 10s nap!"
sleep 5

mv bitcoin.conf ~/.bitcoin/bitcoin.conf
echo "Transfered Conf File!"

# Function to check if bitcoind is running
check_bitcoind_running() {
  if pgrep -x "bitcoind" > /dev/null
  then
    return 0  # Bitcoind is running
  else
    return 1  # Bitcoind is not running
  fi
}

# Check if bitcoind is running
if check_bitcoind_running
then
  echo "Bitcoind is running."
else
  echo "Bitcoind is not running. Trying to start it..."

  # Use a while loop to keep trying to start bitcoind
  while true
  do
    bitcoind -daemon
    sleep 5

    if check_bitcoind_running
    then
      echo "Bitcoind has been successfully started."
      break  # Exit the loop once it's running
    fi
  done
fi

echo "Verifing Block Count:"
bitcoin-cli getblockcount

echo "BitCore Logs!"
tail ~/.bitcoin/debug.log


npm start
