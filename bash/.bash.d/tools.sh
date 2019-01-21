#!/bin/bash

wa-rebase-tags () {
	local START
	local BRANCHES
	local BASE
	local BASE_MATCH
	local MATCH
	local SOMETHING_MATCHED

	START=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
	if [ ! $? -eq 0 ]; then
		echo "Please run this command in a git enabled repository."
		return
	fi
	BRANCHES=$(git br -a | egrep '[0-9]+\.[0-9]+\.[0-9]+' | sed -e 's/remotes\/origin\///' | sort | uniq)

	if [ "$#" -eq 2 ]; then
		BASE="${1}"
		BASE_MATCH="${2}"
	else
		if [ "$#" -eq 1 ]; then
			BASE="${1}"
		else
			BASE="${START}"
		fi
		BASE_MATCH="^$(echo "${BASE}" | sed -e 's/\.x.*$/\./')"
	fi

	echo "Rebasing onto: ${BASE}"
	echo "Rebasing branches that match: ${BASE_MATCH}"

	SOMETHING_MATCHED=0
	for b in ${BRANCHES}
	do
		MATCH=$(echo "${b}" | egrep "${BASE_MATCH}")
		if [ -n "${MATCH}" ]; then
			if [ "${SOMETHING_MATCHED}" -eq 0 ]; then
				echo "Rebasing the following branches:"
				SOMETHING_MATCHED=1
			fi
			echo ${b}
		fi
	done

	if [ "${SOMETHING_MATCHED}" -eq 0 ]; then
		echo "No branches matched the pattern ${BASE_MATCH}"
		echo "Aborting."
		return 1
	fi

	echo "Is this correct and what you expected?"
	echo "Press enter to continue or CTRL+C to abort."
	read -r

	for b in ${BRANCHES}
	do
		MATCH=$(echo "${b}" | egrep "${BASE_MATCH}")
		if [ -n "${MATCH}" ]; then
			git co "${b}"
			git rebase ${BASE}
		fi
	done
	git co "${START}"
	git log --graph --all --oneline --decorate
	echo "Done. Please review graph above before pushing."
}
