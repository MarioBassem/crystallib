module model

//Data object for user
[root ; inherit:'base']
pub struct User {
pub mut:
	contacts	[]Contact [model:usermgmt.usermanager] //list of contacts for a user
}


pub struct Contact {
pub mut:
	name        string
}