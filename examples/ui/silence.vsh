#!/usr/bin/env -S v -w -cg -enable-globals run

import freeflowuniverse.crystallib.osal
import freeflowuniverse.crystallib.ui.console

console.silent_set()
mut job2 := osal.exec(cmd: 'ls /',debug:true)!
println("I got nothing above")

console.silent_unset()
println("now I will get output")

osal.exec(cmd: 'ls /',debug:true)!
