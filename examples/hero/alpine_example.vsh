#!/usr/bin/env -S v -n -w -enable-globals run


import freeflowuniverse.crystallib.hero.bootstrap

mut al:=bootstrap.new_alpine_loader()

al.start()!