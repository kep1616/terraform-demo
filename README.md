# Terraform Demo Script
This script is intended to run an interactive demo on terraform.

## Introduction
This presentation is meant to be run by a presenter demonstrating Terraform and
a set of participants who get hands on experience with Terraform. The presenter
gives a presentation on Terraform and runs the configuration in the host-computer
folder. The configuration sets up a series of demo ec2 units.

## Before Presentation Requirements
In order for the demo units to be setup, the host will need to manually setup a
host unit OR be able to run terraform from a local laptop. The host computer
will need the files present in the "host-computer" directory in order to run.
An included script labeled "host_script.sh" can be used to prepare an EC2
instance as a host.