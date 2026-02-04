std.main:
    glue gcolor
    glue corec
    fcolor __gcolor__:lightgreen
    becho
    std.echo "Flex Installer "
    fcolor __gcolor__:system
    fcolor __gcolor__:blue
    std.echo "for "
    becho
    std.echo "v1.1..."
    fcolor __gcolor__:system
    ln
    becho
    std.echo "Flexinstaller"
    fcolor __gcolor__:system
    std.echo " will "
    becho
    std.echo "auto remove data's for Flex. "
    fcolor __gcolor__:system
    std.echo "continue if you really sure it safe."
    ln
    csys "sudo cp flex /usr/bin"
    csys "sudo mkdir /usr/flex/flex"
    csys "sudo cp project /usr/flex/flex"
    csys "flex -v"
std.end: exit N
