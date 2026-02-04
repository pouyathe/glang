
/*
    Part of G.

    this library using in commend line and part of "g2d" project.

    compile it with dub as compiling g with dub.


*/

/*
    Every change must be in here.
    1. create file.
    2. add std_newline, std_file_read, std_fecho, std_savevalue_in_string, 
    3. add notes (part of g) & thsi every change note
    4. add std_singi.
    5. add std_delete.
*/
module glang_in_dlang;

import std.stdio, std.file;

void std_newline(){
    writeln("");
}
int std_file_read(string file_name, ref string gloabl_string){
    if (exists(file_name)){
        string sc = readText(file_name);
        gloabl_string = sc;
        return 1;
    } else {
        return 0;
    }
}

int std_fecho(string data_name, string global){
    if (data_name == "%"){
        writeln(global);
        return 1;
    } else {
        return 0;
    }
}

void std_savevalue_in_string(ref string globa, string value){
    globa = value;
}

void std_singi(int globalint, int value){
    globalint = value;
}

int std_filemv(string source, string maqsad){
    if (exists(source)){
        rename(source, maqsad);
        return 0;
    } else {
        return 2;
    }
}
int std_delete(string filepath){
    if (exists(filepath)){
        remove(filepath);
        return 0;
    } else {
        return 1;
    }
}

int std_filewrite(string filename, string content){
    if (exists(filename)){
        File openit = File(filename, "w");
        openit.write(content);
        return 0;
    } else {
        return 1;
    }
}