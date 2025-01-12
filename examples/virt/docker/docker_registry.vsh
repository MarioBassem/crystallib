#!/usr/bin/env -S v -n -w -enable-globals run

import freeflowuniverse.crystallib.virt.docker

mut engine := docker.new()!

// engine.reset_all()!

dockerhub_datapath := '/Volumes/FAST/DOCKERHUB'

engine.registry_add(datapath: dockerhub_datapath, ssl: true)!

println(engine)
