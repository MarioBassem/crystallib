#!/usr/bin/env -S v -n -w -enable-globals run

import freeflowuniverse.crystallib.develop.gittools


// resets all for all git configs & caches
// gittools.reset()!

mut gs_default := gittools.get()!
// println(gs_default)

coderoot := '/tmp/code_test'
mut gs := gittools.get(coderoot: coderoot)!

// println(gs)

mut path := gittools.code_get(
	coderoot: coderoot
	url: 'https://github.com/despiegk/ourworld_data'
)!

gs_default.list()!
gs.list()!

// println(path)
// this will show the exact path of the manual
