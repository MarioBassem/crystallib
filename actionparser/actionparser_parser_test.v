module actionparser

import os
import freeflowuniverse.crystallib.texttools

const testpath = os.dir(@FILE) + '/testdata'

fn test_parse_into_blocks() {
	text := "!!git.link
source:'https://github.com/ourworld-tsc/ourworld_books/tree/development/content/feasibility_study/Capabilities'
dest:'https://github.com/threefoldfoundation/books/tree/main/books/feasibility_study_internet/src/capabilities'"
	blocks := parse_into_blocks(text) or { panic('cant parse') }
	assert blocks.blocks.len == 1
	assert blocks.blocks[0].name == 'git.link'
	content_lines := blocks.blocks[0].content.split('\n')
	assert content_lines[1] == "source:'https://github.com/ourworld-tsc/ourworld_books/tree/development/content/feasibility_study/Capabilities'"
	assert content_lines[2] == "dest:'https://github.com/threefoldfoundation/books/tree/main/books/feasibility_study_internet/src/capabilities'"
}

fn test_file_parse() {
	mut parser := get()
	parser.file_parse('$actionparser.testpath/testfile.md')?
	assert parser.actions.len == 10
}