#!/bin/bash


BOLDFONT=$(tput bold)
NORMALFONT=$(tput sgr0)
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color


# Find root level of repo directories
if [[ $USER = *rdogg* ]]; then
	$REPOROOT=/home/$USER/Desktop/DerpRPRepos
elif [[ $USER = *vmsolus* ]]; then
	$REPOROOT=/home/$USER/Desktop/GitRepos
else
	echo "What is the root level structure for the git repos? (no trailing \"/\" please)"
	read REPOROOT
fi

# PULL command
if [[ "$1" = pul* ]]; then
	printf "${GREEN}${BOLDFONT}Switching to AddonsCore${NORMALFONT}${NC}\n"
	cd $REPOROOT/AddonsCore
	git checkout development
	git pull
	printf "${GREEN}${BOLDFONT}Switching to AddonsEconomy${NORMALFONT}${NC}\n"
	cd /home/rdogg/Desktop/DerpRPRepos/AddonsEconomy
	git checkout development
	git pull
	printf "${GREEN}${BOLDFONT}Switching to AddonsRP${NORMALFONT}${NC}\n"
	cd /home/rdogg/Desktop/DerpRPRepos/AddonsRP
	git checkout development
	git pull
	printf "${GREEN}${BOLDFONT}Switching to AddonsSweps${NORMALFONT}${NC}\n"
	cd /home/rdogg/Desktop/DerpRPRepos/AddonsSweps
	git checkout development
	git pull
	printf "${GREEN}${BOLDFONT}Switching to garrysmod${NORMALFONT}${NC}\n"
	cd /home/rdogg/Desktop/DerpRPRepos/garrysmod
	git checkout development
	git pull
	printf "${GREEN}${BOLDFONT}Switching to DerpRPMeta${NORMALFONT}${NC}\n"
	cd /home/rdogg/Desktop/DerpRPRepos/DerpRPMeta
	git pull
fi

# PUSH command
if [[ "$1" = pus* ]]; then
	printf "${GREEN}${BOLDFONT}Switching to AddonsCore${NORMALFONT}${NC}\n"
	cd /home/rdogg/Desktop/DerpRPRepos/AddonsCore
	git checkout development
	git add *
	git commit
	git push
	printf "${GREEN}${BOLDFONT}Switching to AddonsEconomy${NORMALFONT}${NC}\n"
	cd /home/rdogg/Desktop/DerpRPRepos/AddonsEconomy
	git checkout development
	git add *
	git commit
	git push
	printf "${GREEN}${BOLDFONT}Switching to AddonsRP${NORMALFONT}${NC}\n"
	cd /home/rdogg/Desktop/DerpRPRepos/AddonsRP
	git checkout development
	git add *
	git commit
	git push
	printf "${GREEN}${BOLDFONT}Switching to AddonsSWEPS${NORMALFONT}${NC}\n"
	cd /home/rdogg/Desktop/DerpRPRepos/AddonsSWEPS
	git checkout development
	git add *
	git commit
	git push
	printf "${GREEN}${BOLDFONT}Switching to garrysmod${NORMALFONT}${NC}\n"
	cd /home/rdogg/Desktop/DerpRPRepos/garrysmod
	git checkout development
	git add *
	git commit
	git push
	printf "${GREEN}${BOLDFONT}Switching to DerpRPMeta${NORMALFONT}${NC}\n"
	cd /home/rdogg/Desktop/DerpRPRepos/DerpRPMeta
	git add *
	git commit
	git push
fi

# MERGE command
if [[ "$1" = mer* ]]; then
	printf "${GREEN}${BOLDFONT}Switching to AddonsCore${NORMALFONT}${NC}\n"
	cd /home/rdogg/Desktop/DerpRPRepos/AddonsCore
	git checkout master
	git merge development
	git push
	git checkout development
	printf "${GREEN}${BOLDFONT}Switching to AddonsEconomy${NORMALFONT}${NC}\n"
	cd /home/rdogg/Desktop/DerpRPRepos/AddonsEconomy
	git checkout master
	git merge development
	git push
	git checkout development
	printf "${GREEN}${BOLDFONT}Switching to AddonsRP${NORMALFONT}${NC}\n"
	cd /home/rdogg/Desktop/DerpRPRepos/AddonsRP
	git checkout master
	git merge development
	git push
	git checkout development
	printf "${GREEN}${BOLDFONT}Switching to AddonsSweps${NORMALFONT}${NC}\n"
	cd /home/rdogg/Desktop/DerpRPRepos/AddonsSweps
	git checkout master
	git merge development
	git push
	git checkout development
	printf "${GREEN}${BOLDFONT}Switching to garrysmod${NORMALFONT}${NC}\n"
	cd /home/rdogg/Desktop/DerpRPRepos/garrysmod
	git checkout master
	git merge development
	git push
	git checkout development
	printf "${GREEN}${BOLDFONT}Switching to DerpRPMeta${NORMALFONT}${NC}\n"
	cd /home/rdogg/Desktop/DerpRPRepos/DerpRPMeta
	git pull
fi
