#!/bin/bash

if [ $1 == "ls" ];
then ls ~/.cheat/
exit 1;
fi;

glow ~/.cheat/$1.md
