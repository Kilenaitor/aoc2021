# Hack

This directory has all the Hack solutions.

Included is a simple docker compose to set up a bind mount for the current directory.

Make sure you have docker installed, then run:
```
docker compose up -d
```

You may need to pull the HHVM image first, in which case run:
```
docker pull hhvm/hhvm:latest
```

Then, you can shell into the container with
```
docker exec -it aoc-2021-hhvm-1 /bin/bash
```

And to then run one of the days, go to the directory
```
cd /var/advent_of_code/day1
```

and then just run via hhvm
```
hhvm day1.hack
```
