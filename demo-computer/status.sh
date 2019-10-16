#!/bin/bash
TERRAFORM=false
CONFIGURATION=false

if terraform --version | grep v0.12.10; then
		TERRAFORM=true
fi

if test -f "$configuration.tf"; then
    CONFIGURATION=true
fi

if [ "$TERRAFORM" == true ] && [ "$CONFIGURATION" == true ]; then
	echo You are ready to try terraform!
else
	echo Something went wrong...
fi