module main

import freeflowuniverse.crystallib.core.pathlib
import freeflowuniverse.crystallib.data.paramsparser
import os

const testpath3 =  os.dir(@FILE)+"/../.."

// if we return True then it means the dir or file is processed
fn filter_1(mut path pathlib.Path, mut params paramsparser.Params) !bool {
	if path.is_dir(){
		if path.path.ends_with(".dSYM"){
			return false
		}
		return true
	}
	if path.path.ends_with(".v"){
		return true
	}
	return false
}

fn executor_1(mut patho pathlib.Path, mut params paramsparser.Params) !paramsparser.Params {
	if patho.is_file(){
		// println( " - exec: $patho.path" )
		params.arg_add(patho.path)
	}
	return params
}

fn do() ! {
	mut p := pathlib.get_dir(testpath3, false)!
	mut params := paramsparser.Params{}
	mut params2 := p.scan(mut params, [filter_1], [executor_1])!
	println(params2)
	assert params2.args.len==5
}

fn main() {
	do() or { panic(err) }
}