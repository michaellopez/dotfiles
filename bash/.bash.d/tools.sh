#!/bin/bash

wa-rebase-tags () {
	START=$(git rev-parse --abbrev-ref HEAD)
	for b in $(git br | egrep '[0-9]+\.[0-9]+\.[0-9]+')
	do
		git co "${b}"
		git rebase ${1}
	done
	git co "${START}"
	git glog
}


