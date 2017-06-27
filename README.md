#Description

Docker version of the Atrides/eth-proxy Ethereum Stratum Proxy.

This is Stratum Proxy for Ethereum miner agents.

Originally developed for DwarfPool http://dwarfpool.com/eth

**NOTE:** This fork simply the Atrides fork in a SUSE-based docker container


# Usage

## Install

```
mkdir /var/log/eth-proxy
vi /etc/eth-proxy.conf
docker pull waveclaw/eth-proxy
```

## Run

```
docker run -d --name eth-proxy --restart unless-stopped \
   -v /etc/eth-proxy.conf:/eth-proxy.conf \
   -v /var/log/eth-proxy:/log \
   -p 8333:8080 eth-proxy
```

This assumes you
* wrote a complete, working eth-proxy.conf file in /etc/eth-proxy.conf
* expect to collect proxy.log from /var/log/eth-proxy/
* want the internal service to listen on port 8080 but the actual service to be at port 8333

You can use docker-compose to write a file to run this command.  You can also force this to use a virtual IP and private networking.  All three modes are supported.

## Verify running

```
docker ps 
lsof -i -P |grep LISTEN | grep 8333
```

#Configuration

* all configs in file  eth-proxy.conf
* mount this as a volume to over-write


#Command line to miner start, recommended farm-recheck to use with stratum-proxy is 200

* ./ethminer --farm-recheck 200 -G -F http://127.0.0.1:8080/my_rig_identifier


# Proxy working check

1. Open your web browser of choice.
2. Connect to port 8080 or your custom port on your docker host (e.g. http://127.0.0.1:8080).
3. Expect to see "Ethereum stratum proxy" and some info about connections.

If not, check your docker instance:

```
docker run -it eth-proxy /bin/sh
```

You should quickly find errors in the logs or on standard out.

#Donations

* Original Atridies ETH:  0xea7263feb7d8a8ab0a11eedd8f1ce04412ab0820
* waveclaw ETH:  0xcc769b87ff3d9adf4951867fc367072042b34a80


#Requirements

eth-proxy is built in python. I have been testing it with 2.7.3, but it should work with other versions. The requirements for running the software are below.

* Python 2.7+
* python-twisted



#Credits

* Original version by Slush0 (original stratum code)
* Adiditonal work by Atrides
* More Features added by GeneralFault, Wadee Womersley and Moopless

#License

* This software is provides AS-IS without any warranties of any kind. Please use at your own risk.
