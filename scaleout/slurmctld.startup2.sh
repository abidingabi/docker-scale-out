#!/bin/bash
#wait for primary mgt node to be done starting up
while [[ "$(scontrol --json ping | jq -r '.pings[0].pinged')" != "UP" ]]
do
	sleep 0.25
done

scontrol token username=slurm lifespan=9999999 | sed 's#SLURM_JWT=##g' > /auth/slurm
chmod 0755 -R /auth

exit 0
