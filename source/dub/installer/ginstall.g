std.main:
	glue corec
	glue file
	std.echo "Install G..."
	csys "sudo cp glang /usr/bin"
	[%] : "/usr/bin/glang"
	flex
	lxd done
	fcd faild
std.end: exit N
