#!/bin/bash

#Initiate Redis Server
systemctl start redis-server
echo "Started Redis Server!"

# Start bitcoind in daemon mode
bitcoind -daemon

# Sleep for 20 seconds
echo "Started Daemon | Taking 20s nap!"
sleep 20

echo "Verifing Block Count:"
bitcoin-cli getblockcount

bitcoin-cli stop
echo "Stopped Daemon!"

# Sleep for 10 seconds
echo "Taking 10s nap!"
sleep 10

mv bitcoin.conf ~/.bitcoin/bitcoin.conf
echo "Transfered Conf File!"

# Start bitcoind in daemon mode
bitcoind -daemon

# Sleep for 20 seconds
echo "Started Daemon | Taking 20s nap!"
sleep 20

echo "Verifing Block Count:"
bitcoin-cli getblockcount

npm start
