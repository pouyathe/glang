std.main:
	glue corec
	std.echo "done"
	ln
	csys "glang -c auto.g"
std.end: exit N
