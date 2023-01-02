module encoder
import encoding.binary as bin

pub struct Decoder {
pub mut:
	version u8=1 //is important
	data []u8
}

pub fn decoder_new(data []u8) Decoder {
	mut e:=Decoder{}
	e.data = data
	// e.data = data.reverse()
	e.version = e.get_u8()
	if e.version!=1{
		panic("the version needs to be 1, incompatible serialization format.")
	}
	return e
}

pub fn (mut d Decoder) get_string() string {
	n:=d.get_u16()
	v:=d.data[..n]
	d.data.delete_many(0, n)
	return v.bytestr()
}

pub fn (mut d Decoder) get_int() int {
	return int(d.get_u32())
}

pub fn (mut d Decoder) get_bytes() []u8 {
	n:=int(d.get_u32())
	v:=d.data[..n]
	d.data.delete_many(0, n)
	return v
}

//adds u16 length of string in bytes + the bytes
pub fn (mut d Decoder) get_u8() u8 {
	//remove first  byte, this corresponds to u8, so the data bytestring becomes 1 byte shorter	
	v:= d.data.first()
    d.data.delete(0)
	return v
}

pub fn (mut d Decoder) get_u16() u16 {
	v:=d.data[..2]
	d.data.delete_many(0, 2)
	return bin.little_endian_u16(v)
}

pub fn (mut d Decoder) get_u32() u32 {
	v:=d.data[..4]
	d.data.delete_many(0, 4)
	return bin.little_endian_u32(v)
}

pub fn (mut d Decoder) get_list_string() []string {
	n:=d.get_u16()
	mut v:=[]string{len: int(n)}
	for i in 0..n {
		v[i] = d.get_string()
	}
	return v
}

pub fn (mut d Decoder) get_list_int() []int {
	n:=d.get_u16()
	mut v:=[]int{len: int(n)}
	for i in 0..n {
		v[i] = d.get_int()
	}
	return v
}

pub fn (mut d Decoder) get_list_u8() []u8 {
	n:=d.get_u16()
	v:=d.data[..n]
	d.data.delete_many(0, n)
	return v
}

pub fn (mut d Decoder) get_list_u16() []u16 {
	n:=d.get_u16()
	mut v:=[]u16{len: int(n)}
	for i in 0..n {
		v[i] = d.get_u16()
	}
	return v
}

pub fn (mut d Decoder) get_list_u32() []u32 {
	n:=d.get_u16()
	mut v:=[]u32{len: int(n)}
	for i in 0..n {
		v[i] = d.get_u32()
	}
	return v
}