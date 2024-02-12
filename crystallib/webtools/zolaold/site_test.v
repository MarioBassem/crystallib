module zola

// pub fn test_site_new() ! {
// 	mut sites := new()!
// 	site := sites.site_new(SiteConfig{})!
// }

// pub fn (mut site ZolaSite) prepare() ! {
// 	site.template_install()!
// 	if os.exists('${site.path_publish.path}/content') {
// 		os.rmdir_all('${site.path_publish.path}/content')!
// 	}
// 	os.cp_all(site.path_content.path, '${site.path_build.path}/content', true)!
// 	os.cp_all(site.path_content.path, '${site.path_build.path}/static/', false)!
// 	preprocessor.preprocess('${site.path_build.path}/content')!
// }

// pub fn (mut site ZolaSite) generate(gitrepos_status map[string]RepoStatus) ! {
// 	if !site.changed(gitrepos_status) {
// 		return
// 	}
// 	console.print_header(' site generate: ${site.name} on ${site.path_build.path}')

// 	css_source := '${site.path_build.path}/css/index.css'
// 	css_dest := '${site.path_build.path}/static/css/index.css'
// 	site.tailwind.compile(css_source, css_dest)!
// 	osal.exec(
// 		cmd: '
// 		source ${osal.profile_path()}
// 		zola -r ${site.path_build.path} build -f -o ${site.path_publish.path}
// 		'
// 	)!
// 	// execute('rsync -a ${dir(@FILE)}/tmp_content/ ${dir(@FILE)}/content/')
// 	// rmdir_all('${dir(@FILE)}/tmp_content')!

// 	// os.mv('${site.path_build.path}/public', site.path_publish.path)!
// }

// pub struct App {
// 	vweb.Context
// 	path pathlib.Path @[vweb_global]
// }

// @['/:path...']
// pub fn (mut app App) index(path string) vweb.Result {
// 	if path == '/' {
// 		return app.html(os.read_file('${app.path.path}/index.html') or {
// 			return app.server_error(500)
// 		})
// 	}
// 	if !path.all_after_last('/').contains('.') {
// 		return app.html(os.read_file('${app.path.path}${path}/index.html') or {
// 			return app.not_found()
// 		})
// 	}
// 	return app.not_found()
// }

// pub struct ServeParams {
// 	port int
// 	open bool
// }

// pub fn (mut site ZolaSite) serve(params ServeParams) ! {
// 	mut app := App{
// 		path: site.path_publish
// 	}
// 	app.mount_static_folder_at('${site.path_publish.path}', '/')
// 	spawn vweb.run(&app, params.port)
// 	if params.open {
// 		osal.exec(cmd: 'open http://localhost:${params.port}')!
// 	}
// 	for {}
// }

// // all the gitrepo keys
// fn (mut site ZolaSite) gitrepo_keys() []string {
// 	mut res := []string{}
// 	res << site.gitrepokey
// 	for collection in site.collections {
// 		if collection.gitrepokey !in res {
// 			res << collection.gitrepokey
// 		}
// 	}
// 	return res
// }

// // is there change in repo since last build?
// fn (mut site ZolaSite) changed(gitrepos_status map[string]RepoStatus) bool {
// 	mut change := false
// 	gitrepokeys := site.gitrepo_keys()

// 	for key, status in gitrepos_status {
// 		if key in gitrepokeys {
// 			// means this site is using that gitrepo, so if it changed the site changed
// 			if status.revlast != status.revlast {
// 				change = true
// 			}
// 		}
// 	}
// 	return true
// }

// fn (mut site ZolaSite) template_install() ! {
// 	config := $tmpl('./templates/config.toml')
// 	mut config_dest := pathlib.get('${site.path_build.path}/config.toml')
// 	config_dest.write(config)!

// 	os.cp('${os.dir(@FILE)}/templates/vercel.json', '${site.path_build.path}/vercel.json')!
// 	os.cp_all('${os.dir(@FILE)}/templates/css', '${site.path_build.path}/css', true)!
// 	os.cp_all('${os.dir(@FILE)}/templates/templates', '${site.path_build.path}/templates', true)!
// 	os.cp_all('${os.dir(@FILE)}/templates/static', '${site.path_build.path}/static', true)!
// }