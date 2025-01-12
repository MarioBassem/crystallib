module herodev

import freeflowuniverse.crystallib.installers.web.mdbook
import freeflowuniverse.crystallib.installers.web.zola
import freeflowuniverse.crystallib.installers.sysadmintools.dagu

@[params]
pub struct InstallArgs {
pub mut:
	reset bool
}

// install mdbook will return true if it was already installed
pub fn install(args_ InstallArgs) ! {
	mut args := args_

	mdbook.install(reset: args.reset)!
	zola.install(reset: args.reset)!
	dagu.install(reset: args.reset)!
}
