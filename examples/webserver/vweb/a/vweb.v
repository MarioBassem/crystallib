module main

import vweb
import db.sqlite
// import freeflowuniverse.crystallib.webserver.components
import os

const pubpath = os.dir(@FILE) + '/public'

// fn print_req_info(mut req ctx.Req, mut res ctx.Resp) {
// 	// println(req)
// 	println('${req.method} ${req.path}')
// }

// fn do_stuff(mut req ctx.Req, mut res ctx.Resp) {
// 	println('incoming request!')
// }

struct App {
	vweb.Context
	middlewares map[string][]vweb.Middleware
pub mut:
	user_id string
}

fn main() {
	db := sqlite.connect('/tmp/web.db') or { panic(err) }

	vweb.run_at(new_app(), vweb.RunParams{
		port: 8081
	}) or { panic(err) }
}

pub fn (mut app App) before_request() {
	app.user_id = app.get_cookie('id') or { '0' }
}

fn new_app() &App {
	mut app := &App{
		middlewares: {
			'/': [midleware_debug]
		}
	}
	// makes all static files available.
	app.mount_static_folder_at(os.resource_abs_path('.'), '/')
	return app
}

fn midleware_debug(mut ctx vweb.Context) bool {
	println(ctx.req)
	println(ctx.query)
	println(ctx.form)
	return true
}

struct Object {
	title       string
	description string
}


@['/']
pub fn (mut app App) page_home() vweb.Result {
	// all this constants can be accessed by src/templates/page/home.html file.
	page_title := 'V is the new V'
	v_url := 'https://github.com/vlang/v'

	list_of_object := [
		Object{
			title: 'One good title'
			description: 'this is the first'
		},
			Object{
			title: 'Other good title'
			description: 'more one'
		},
	]
	// $vweb.html() in `<folder>_<name> vweb.Result ()` like this
	// render the `<name>.html` in folder `./templates/<folder>`
	return $vweb.html()
}

@['/register']
pub fn (mut app App) page_register() vweb.Result {
	description:='
		Welcome to the ThreeFold Ecosystem, please register your interest.
	'
	legal:='		
	'
	return $vweb.html()
}


@['/foo']
fn (mut app App) world() vweb.Result {
	return app.text('World')
}

@['/register_submit'; post]
fn (mut app App) register_submit() vweb.Result {
	println(app.form)
	return app.json(app.form)
}

@['/email_check'; get]
fn (mut app App) register_check() vweb.Result {
	println(app.query)
	email:= app.query["email"] or {""}
	if ! email.contains("@"){
		return app.text("email is not in right format, please fix.")
	}
	return app.text("")
}


@['/editor']
pub fn (mut app App) page_editor() vweb.Result {
	return $vweb.html()
}
