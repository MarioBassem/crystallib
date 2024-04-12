#!/usr/bin/env -S v -w -enable-globals run

import freeflowuniverse.crystallib.installers.sysadmintools.garage_s3
import freeflowuniverse.crystallib.installers.sysadmintools.fungistor
import freeflowuniverse.crystallib.installers.sysadmintools.dagu
import freeflowuniverse.crystallib.installers.net.mycelium
import freeflowuniverse.crystallib.installers.db.zdb
import freeflowuniverse.crystallib.installers.db.redis

redis.install(start:true)!

zdb.install(start:true)!

mycelium.install()!

fungistor.install()!

dagu.install(start:true)!

garage_s3.install(start:true)!