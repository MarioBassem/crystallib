#!/usr/bin/env -S v -n -w -enable-globals run

import os
import json
import freeflowuniverse.crystallib.core.openapi.gen

const spec_path = '${os.dir(@FILE)}/openapi.json'

mod := gen.generate_client_module(
	api_name: 'Gitea'
	
)!
mod.write_v('${os.dir(@FILE)}/gitea_client',
	overwrite: true
)!
