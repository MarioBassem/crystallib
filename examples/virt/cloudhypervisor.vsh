#!/usr/bin/env -S v -n -w -enable-globals run

import freeflowuniverse.crystallib.virt.cloudhypervisor
import freeflowuniverse.crystallib.core.texttools
import freeflowuniverse.crystallib.ui.console
import os

mut vmm:=cloudhypervisor.new()!

// virtmanager.vm_delete_all()!
// virtmanager.vm_new(reset:true,template:.alpine,name:'alpine',install_crystal:true)!
// virtmanager.vm_new(reset:true,template:.ubuntu,name:'ubuntu',install_crystal:true)!
// vmm.vm_new(reset:true,template:.arch,name:'arch',install_crystal:true)!

// mut vm:=virtmanager.vm_get('ubuntu')!
// vm.install_crystal()!

// console.print_debug_title("MYVM", vm.str())