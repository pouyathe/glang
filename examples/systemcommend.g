std.main:
  glue corec
  std.echo "You using "
  csys "uname -r"
  std.echo " kernel of linux!"
  ln
std.end: exit N
