module installers

import freeflowuniverse.crystallib.installers.base
import freeflowuniverse.crystallib.installers.develapps.vscode
import freeflowuniverse.crystallib.installers.develapps.chrome
import freeflowuniverse.crystallib.installers.virt.podman
import freeflowuniverse.crystallib.installers.virt.lima
import freeflowuniverse.crystallib.installers.net.mycelium
import freeflowuniverse.crystallib.core.texttools
import freeflowuniverse.crystallib.installers.lang.rust
import freeflowuniverse.crystallib.installers.lang.golang
import freeflowuniverse.crystallib.installers.lang.vlang
import freeflowuniverse.crystallib.installers.lang.crystallib
import freeflowuniverse.crystallib.installers.lang.nodejs
import freeflowuniverse.crystallib.installers.lang.python
import freeflowuniverse.crystallib.installers.web.caddy
import freeflowuniverse.crystallib.installers.hero.heroweb
import freeflowuniverse.crystallib.installers.hero.herodev
import freeflowuniverse.crystallib.installers.sysadmintools.dagu
import freeflowuniverse.crystallib.installers.sysadmintools.prometheus
import freeflowuniverse.crystallib.installers.sysadmintools.grafana
import freeflowuniverse.crystallib.installers.sysadmintools.fungistor
import freeflowuniverse.crystallib.installers.sysadmintools.garage_s3

@[params]
pub struct InstallArgs {
pub mut:
	names     string
	reset     bool
	uninstall bool
	gitpull   bool
	gitreset  bool
	start     bool
}

pub fn names(args_ InstallArgs) []string {
	names := '
		base
		caddy
		chrome
		crystal
		dagu
		develop
		garage_s3
		golang
		grafana
		fungistor
		hero
		herodev
		heroweb
		lima
		mycelium
		nodejs
		podman
		prometheus
		rust
		vlang
		vscode
		'
	mut ns := texttools.to_array(names)
	ns.sort()
	return ns
}

pub fn install_multi(args_ InstallArgs) ! {
	mut args := args_
	mut items := []string{}
	for item in args.names.split(',').map(it.trim_space()) {
		if item !in items {
			items << item
		}
	}
	for item in items {
		match item {
			'base' {
				base.install(reset: args.reset)!
			}
			'develop' {
				base.install(reset: args.reset, develop: true)!
			}
			'rust' {
				rust.install(reset: args.reset)!
			}
			'golang' {
				golang.install(reset: args.reset)!
			}
			'vlang' {
				vlang.install(reset: args.reset)!
			}
			'crystal' {
				crystallib.install(
					reset: args.reset
					git_pull: args.gitpull
					git_reset: args.gitreset
				)!
			}
			'hero' {
				crystallib.hero_install(reset: args.reset)!
			}
			'caddy' {
				caddy.install(reset: args.reset)!
				// caddy.configure_examples()!
			}
			'chrome' {
				chrome.install(reset: args.reset, uninstall: args.uninstall)!
			}
			'mycelium' {
				mycelium.install(reset: args.reset)!
				mycelium.start()!
			}
			'garage_s3' {
				garage_s3.install(reset: args.reset, config_reset: args.reset, restart: true)!
			}
			'fungistor' {
				fungistor.install(reset: args.reset)!
			}
			'lima' {
				lima.install(reset: args.reset, uninstall: args.uninstall)!
			}
			'podman' {
				podman.install(reset: args.reset, uninstall: args.uninstall)!
			}
			'prometheus' {
				prometheus.install(reset: args.reset, uninstall: args.uninstall)!
			}
			'grafana' {
				grafana.install(reset: args.reset, uninstall: args.uninstall)!
			}
			'vscode' {
				vscode.install(reset: args.reset)!
			}
			'nodejs' {
				nodejs.install(reset: args.reset)!
			}
			'python' {
				python.install()!
			}
			'herodev' {
				herodev.install()!
			}
			'heroweb' {
				heroweb.install()!
			}
			'dagu' {
				dagu.install()!
			}
			else {
				return error('cannot find installer for: ${item}')
			}
		}
	}
}
