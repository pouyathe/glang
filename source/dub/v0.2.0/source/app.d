/* G version 5.7.7 source code.
 (C) 2026 Pouya Mohammadi.
 use or edit it under Gnu V3.

----- list of new (1)

 1. Safe added.
 2. more file options added.
 3. delete file added.
 4. commendline added.
*/


// ----------------- import section -----------------------

/*
    To-Do list1: v0.2.0

    1. add more options for files (DONE)
    2. complate commendline (DONE)
    3. remove my f*** copyright texts (DONE) (Why i add them? just for nice output :) but i now know they be bad.)
    4. remove deadcodes. (NO FINISH YET)
    5. fix all ifs. (NO FINISH YET)
    6. i think the glang when no commend be show error are bad i must put commend line here. also -cl flag be. (DONE)
    7. fix error messages. (DONE)
    8. remove bad words from value names. (DONE)
*/

/*
    compiler version 
    DMD64 D Compiler v2.090.1
        [ --- ! ---- ] This code written for dmd v2.090.1!
    
*/


import std.stdio, std.string, std.regex, std.file;
// For EXIT and C functions
import core.stdc.stdlib : system;
// for use system function from c in d.
import core.stdc.stdlib;
//for convert to string, int etc.
import std.conv;
import core.sys.posix.unistd;
//for get system time
import std.datetime;
import std.bigint;
// for __bi__.
import std.exception;
//import std.loader;

//for manager bold and more color output for gcolor
//import terminal;

//for manage ports
//import serialport;
//error_made for use in 'error.new' as where maybe user want to create a error.

import std.json;
// for read json fioles and wok with they

import glang_in_dlang; // for commendline functions.
// -------------------------- import section ----------------------


// ----- for commendline
string global_string;
int gloabl_inti;
int if_flag;

void error_made(string msg, string file_name){
    enum string RED    = "\033[31m";
    enum string RESET  = "\033[0m";
    write(RED, "\033[1m" ~file_name ~ ":", RESET);
    write(" " ~ msg ~ "\n");
    exit(1);
}
string get_n(){
    auto resualt = readln();
    resualt = chomp(resualt);
    return resualt;
}
void info_made(string msg, string file_name){
    enum string BLUE    = "\033[34m";
    enum string RESET  = "\033[0m";
    write(BLUE, "\033[1m" ~file_name ~ ":", RESET);
    write(" " ~ msg ~ "\n");
}
extern(C) {
    void* dlopen(const char*, int);
    void* dlsym(void*, const char*);
    // char* dlerror(void);
    char* dlerror();
    // int dlclose(void *handle);
    int dlclose(void*);
}
enum RTLD_LAZY = 1;

extern(C) void function(const char*) myFunction;
extern(C) void function() myFunc;
void _pouya_run_as_safe_memory(string code, string filename){ // cause args error i think it be cause i forget it when im in function i dont have args. i add fielname insted.
    //string code1 = readText(code); // i read text of g file to run it as safe.
    // but i figure out something i need first check if file be to i dont breack anything to show unknwon errors
    if (exists(code)){
        // so looks like code is exists we are in good point!
        string cristanoronaldo = readText(code);
        // cr7 now have content of g file.
        //now we must check if user use unmemory safe functions 
        /* list of them :
          gram | f*addr | f@addr (i think i dont remeber whats function be name of it)
          امیرحسین اگر این رو می خونی بدون که این کد قراره امن اجرا بشه.
          بعد تو مدرسه هم انقدر ما رو ... دیگه خودت می دونی 
          این یه یادگاری از من وقتی مردم
        */
        if (cristanoronaldo.indexOf("gram") != -1 || cristanoronaldo.indexOf("f*addr") != -1 || cristanoronaldo.indexOf("f@addr") != -1 || cristanoronaldo.indexOf("[@*__address__]") != -1 || cristanoronaldo.indexOf("sharedloader") != -1){
            // i forget add args[2] because it have file name . error_made("safe mode : cannot use leak memory risky functions.", args);
            // it made error
            /*
            source/app.d(108,79): Error: undefined identifier args, did you mean overloadset abs?
            */
            // i now know i dont have acess to  args i checing it insted use filename . error_made("safe mode : cannot use leak memory risky functions.", args[2]);
            error_made("safe: leak memory risky functions not allowed in safe mode.", filename);
        
        }
    }
}
/*class g_error {
    string func_name;
    string x_value;
    string error_not_value = "Need last one value for " ~ func_name ~ ".";
    string error_nofile = "FileSystem ERROR, no file exists with name " ~ func_name;
    string error_fuzeerror = "FUZE ERROR, no header with name " ~ func_name;
    string error_need_x_value = "Need last " ~ x_value ~ " for " ~ func_name;
    string error_file_header = "FileSystem ERROR, unknwon header.";
    string error_no_value_with_name = "unknown value or data with name : " ~ func_name;
}*/
void error_madefcl(string msg, string file_name){
    enum string RED    = "\033[31m";
    enum string RESET  = "\033[0m";
    write(RED, "\033[1m" ~ file_name ~ ":", RESET);
    write(" " ~ msg ~ "\n");
}

void resame(){
    write("> ");
    commend_run();
}
void commend_run(){
    /*
        Commendline work:
        1. it will first get code from user.
        2. it check whats functions are be in it or not.
        3. if it found a fucnstion be in it, it go to function work.
        4. i use glang_for_dalng.d for use it will be more easy then i write all functions again and it good because i will use it for use glang inside dlang.
        5. then it run a loop again after work be great or have error it run commend_run again

    */
    //simulate_gvalues(); i change it to just easy add when u import glang_in_dlang.
    string gsss_savecode1 = readln();
    // under line for remove newline form user typed code.
    string gsss_savecode = chomp(gsss_savecode1);
    if (gsss_savecode == "exit"){
        exit(0);
    } else if (gsss_savecode.indexOf("std.echo") != -1){
        auto egex = regex(`std.echo "(.*?)"`);
        auto egex2 = match(gsss_savecode, egex);
        if (!egex2.empty){
            writeln(egex2.captures[1]);
            write("> ");
            commend_run();
        } else {
            error_madefcl("Need last one value for 'std.echo'.", "stdin");
            write("> ");
            commend_run();               
        }
                            
    } else if (gsss_savecode.indexOf("file.read") != -1){
        auto filename = regex(`file.read "(.*?)"`);
        auto fnn = match(gsss_savecode, filename);
        if (!fnn.empty){
            int value = std_file_read(fnn.captures[1], global_string);
            if (value == 0){
                error_madefcl("FileSystem ERROR, file " ~ fnn.captures[1] ~ " is not exists.", "stdin");
                write("> ");
                commend_run();
            } else {
                write("> ");
                commend_run();
            }
        }
    } else if(gsss_savecode.indexOf("ln") != -1 || gsss_savecode.indexOf("std.newline") != -1){
        std_newline();
        write("> ");
        commend_run();
    } else if(gsss_savecode.indexOf("fecho") != -1 || gsss_savecode.indexOf("std.format.echo") != -1){
        auto get_fname = regex(`fecho (\S+)`);
        auto get_f = match(gsss_savecode, get_fname);
        if (!get_f.empty){
            int ev = std_fecho(get_f.captures[1], global_string);
            if (ev == 0){
                error_madefcl("unknown value " ~ get_f.captures[1] ~ ".", "stdin");
                write("> ");
                commend_run();
            } else {
                write("> ");
                commend_run();
            }
        } else {
            error_madefcl("Need last one value for 'fecho'.", "stdin");
            write("> ");
            commend_run();
        }
    } else if(gsss_savecode.indexOf("[%]") != -1 || gsss_savecode.indexOf("[__string__]") != -1){
        auto gts = regex(`: "(.*?)"`);
        auto gts2 = match(gsss_savecode, gts);
        if (!gts.empty){
            std_savevalue_in_string(global_string, gts2.captures[1]);
            write("> ");
            commend_run();
        } else {
            error_madefcl("Need value to save in global string.", "stdin");
            write("> ");
            commend_run();
        }
    } else if(gsss_savecode.indexOf("[@]") != -1 || gsss_savecode.indexOf("[__int__]") != -1){
        auto get_alue_for_int = regex(`: (\S+)`);
        auto gvfi = match(gsss_savecode, get_alue_for_int);
        if (!gvfi.empty){
            std_singi(gloabl_inti, to!int(gvfi.captures[1]));
            write("> ");
            commend_run();
        } else {
            error_madefcl("saving noting in global number?", "stdin");
            write("> ");
            commend_run();
        }
    } else if(gsss_savecode.indexOf("exit") != -1){
        exit(0);
    } else if(gsss_savecode.indexOf("defe") != -1){
        writeln(if_flag);
        write("> ");
        commend_run();
    } else if(gsss_savecode.indexOf("condition") != -1){
        auto get_oprator = regex(`condition (\S+)`);
        auto mathc_og = match(gsss_savecode, get_oprator);
        if (!mathc_og.empty){
            auto numb_vlaue = regex(mathc_og.captures[1] ~ ` (\S+)`);
            auto nv = match(gsss_savecode, numb_vlaue);
            if (!nv.empty){
                if (mathc_og.captures[1] == "<"){
                    if (gloabl_inti < to!int(nv.captures[1])){
                        if_flag = 1;
                        resame();
                    } else {
                        if_flag= 0;
                        resame();
                    }
                } else if(mathc_og.captures[1] == "::"){
                    if (gloabl_inti == to!int(nv.captures[1])){
                        if_flag = 1;
                        resame();
                    } else {
                        if_flag = 0;
                        resame();
                    }
                } else if(mathc_og.captures[1] == ">"){
                    if (gloabl_inti > to!int(nv.captures[1])){
                        if_flag = 1;
                        resame();
                    } else {
                        if_flag = 0;
                        resame();
                    }
                } else {
                    error_madefcl("unknown oprator '" ~ mathc_og.captures[1] ~ "'.", "stdin");
                    write("> ");
                    commend_run();
                }
            } else {
                error_madefcl("Need last two value for 'condition'.", "stdin");
                write("> ");
                commend_run();
            }
        } else {
            error_madefcl("Need last two value for 'condition'.", "stdin");
            write("> ");
            commend_run();
        }
    } else if(gsss_savecode.indexOf("lxd") != -1){
        auto head = regex(`lxd (\S+)`);
        auto heda = match(gsss_savecode, head);
        if (!heda.empty){
            if (if_flag == 1){
                system(toStringz("glang -c " ~ heda.captures[1] ~ ".g"));
                write("> ");
                commend_run();
            }
        } else {
            error_madefcl("Need last one value for 'lxd'.", "stdin");
            write("> ");
            commend_run();
        }
    } else if(gsss_savecode.indexOf("fcd") != -1){
        auto gtfile = regex(`fcd (\S+)`);
        auto gtfile2 = match(gsss_savecode, gtfile);
        if (!gtfile2.empty){
            system(toStringz("glang -c " ~ gtfile2.captures[1] ~ ".g"));
            resame();
        } else {
            error_madefcl("Need last one value for 'fcd'.", "stdin");
            resame();
        }
    } else if(gsss_savecode.indexOf("::cl") != -1){
        if_flag = 0;
        resame();
    } else if(gsss_savecode.indexOf("file.mv") != -1){
        auto getfn = regex(`file.mv "(.*?)"`);
        auto getfn2 = match(gsss_savecode, getfn);
        if(!getfn2.empty){
            auto get_d = regex("\"" ~ getfn2.captures[1] ~ "\"" ~ ` "(.*?)"`);
            auto get_dd = match(gsss_savecode, get_d);
            if(!get_dd.empty){
                int stdfmv = std_filemv(getfn2.captures[1], get_dd.captures[1]);
                if (stdfmv == 2){
                    error_madefcl("FileSystem ERROR, file " ~ getfn2.captures[1] ~ " not exists.", "stdin");
                    resame();
                } else if(stdfmv == 1){
                    error_madefcl("FileSystem ERROR, file " ~ get_dd.captures[1] ~ " not exists.", "stdin");
                    resame();
                } else {
                    resame();
                }
            } else {
                error_madefcl("Need last two value for 'file.mv'.", "stdin");
                resame();
            }
        } else {
            error_madefcl("Need last two value for 'file.mv'.", "stdin");
            resame();
        }
    } else if(gsss_savecode.indexOf("file.remove") != -1){
        auto filen = regex(`file.remove "(.*?)"`);
        auto filen2 = match(gsss_savecode, filen);
        if (!filen2.empty){
            int dos = std_delete(filen2.captures[1]);
            if (dos == 1){
                error_madefcl("FileSystem ERROR, cannot find " ~ filen2.captures[1] ~ ".", "stdin");
                resame();
            } else {
                resame();
            }
        } else {
            error_madefcl("Need last one value for 'file.remove'.", "stdin");
            resame();
        }
    } else if(gsss_savecode.indexOf("gram") != -1 || gsss_savecode.indexOf("raw") != -1 || gsss_savecode.indexOf("[@*__address__]") != -1){
        error_madefcl("safe: leak memory risky functions not allowed in safe mode.", "stdin");
        resame();
    } else if(gsss_savecode.indexOf("flex") != -1) {
        if (exists(global_string)){
            if_flag = 1;
            resame();
        } else {
            if_flag = 0;
            resame();
        }
    } else if(gsss_savecode.indexOf("csys") != -1){
        auto taknogarsnow = regex(`csys "(.*?)"`);
        auto tngs = match(gsss_savecode, taknogarsnow);
        if (!tngs.empty){
            system(toStringz(tngs.captures[1]));
            resame();
        } else {
            error_madefcl("Need last one value for 'csys'.", "stdin");
            resame();
        }
    } else if(gsss_savecode.indexOf("file.write") != -1){
        auto filenams = regex(`file.write "(.*?)"`);
        auto fsn = match(gsss_savecode, filenams);
        if (!fsn.empty){
            int coderesult = std_filewrite(fsn.captures[1], global_string);
            if (coderesult == 1){
                error_madefcl("FileSystem ERROR, cannot find " ~ fsn.captures[1] ~ ".", "stdin");
                resame();
            } else {
                resame();
            }
        } else {
            error_madefcl("Need last one value for 'file.write'.", "stdin");
            resame();
        }
    } else {
        error_madefcl("No function or value founded then be G function.", "stdin");
        resame();
    }
}
void main(string[] args){

    // ---------------- compiler strings and infos -------------------
    
    string gsss_version = "v0.2.0";
    string gsss_builddate = __DATE__;
    string gsss_buildtime = __TIME__;

    // ---------------- end of this section --------------------------

    // ---------------- GSSS Flags for compile time ------------------

    int __endbe_exit__;
    int __eqube__;
    int file_add;
    int error_add;
    int corec_add;
    int string_add;
    int false_add;
    int debug_add;
    int serial_add;
    int main_be;
    int end_be;
    int g_color_add;
    SysTime accessTime, modificationTime; // for getTime
    // decimal support
    // {{{{{{{{{{{{{{{{{{{{{{{{{{{{{Global values}}}}}}}}}}}}}}}}}}}}}}}}}}}}}
    string global;
    string glue_global_import_value;
    string[20] custom_value; //SSS String model (immu... string custom_value[20])
    int counter_how_much_cs;
    ubyte[] global_hex;
    void*[] global_address;
    real global_real;
    int global_int;
    BigInt global_mpf;
    string mds;
    float global_float;
    File global_port;
    File global_point_toingfile;
    //type Decimal = ddecimal.Decimal;
    // ---------------- end of this section ---------------------------

    // ---------------- colors ----------------------------------------

    enum string RED    = "\033[31m";
    enum string RESET  = "\033[0m";

    // ---------------- end of this section ---------------------------
    
    if (args.length < 2){
        /*
        write(RED, "\033[1mError : " ,RESET);
        write("Missing option / commend to do.\n");
        writeln("Use a -h / --help for show help info.");
        exit(1);
        */
        // new version as todo list.
        writeln("\033[1mG\033[0m ("  ~ gsss_version ~ ")" ~ " | (C) Pouya Mohammadi.");
        writeln("\033[34mhttps://glang.ct.ws/ for documents \033[31mG CommendLine run with \"safe\".\033[0m");
        write("> ");
        commend_run();
    } else {
        if (args[1] == "-h" || args[1] == "--help"){
            writeln("\033[1mG\033[0m Interpreter | (S3)");
            writeln("Copyright (C) 2026 The G programming language Pouya Mohammadi.");
            writeln("");
            writeln("options : ");
            writeln("--help / -h            show current menu.");
            writeln("--compile / -c         start compile progress");
            writeln("--version / -v         show version and info.");
            writeln("--upgrade / -u         update list of lib's in system. (run it when you install a lib yourself.)");
            writeln("--builddate / -bd      get build date of GNUG");
            writeln("--buildtime / -bt      get build time of GNUG");
            writeln("");

        } else {
            if (args[1] == "--version" || args[1] == "-v"){
                writeln("\033[1mG\033[0m Interpreter | (S3)");
                writeln("Copyright (C) 2026 The G programming language Pouya Mohammadi.");
                writeln(gsss_version ~ " " ~ __DATE__ ~ " " ~ __TIME__);
            } else {
                if (args[1] == "--builddate" || args[1] == "-bd"){
                    writeln(__DATE__);
                } else {
                    if (args[1] == "--buildtime" || args[1] == "-bt"){
                        writeln(__TIME__);
                    } else {
                        if (args[1] == "--commendline" || args[1] == "-cl"){
                            writeln("\033[1mG\033[0m ("  ~ gsss_version ~ ")" ~ " | (C) Pouya Mohammadi.");
                            writeln("\033[34mhttps://glang.ct.ws/ for documents \033[31mG CommendLine run with \"safe\".\033[0m");
                            write("> ");
                            commend_run();
                            // get user typed code.
                            
                            
                        } else {
                            if (args[1] == "-c" || args[1] == "--compile"){
                                if (args.length < 3){
                                    error_made("No G file imported.", "Error");
                                }
                                try {
                                    if (exists(args[2])){
                                        string __filecontent__ = readText(args[2]);
                                        size_t __main_ = __filecontent__.indexOf("std.main:");
                                        if (__main_ != -1){
                                            // check if we are in safe mode.
                                            // first we need found if developer use safe label or not.
                                    
                                            if (__filecontent__.indexOf("safe std.main:") != -1){
                                                // we go where if it be.
                                                // since we here it means user type safe usually we must call are "safe checker" function
                                                main_be = 1; // first we must tell interperter developer use std.main so it not say error and it know code section is be.
                                                _pouya_run_as_safe_memory(args[2], args[2]); // run safe checker
                                            }
                                            if (__filecontent__.indexOf("std.main:") != -1){
                                                main_be = 1;
                                            }
                                            if (__filecontent__.indexOf("std.end:") != -1){
                                                end_be = 1;
                                            }
                                            if (main_be != 1){
                                                error_made("cannot found standard code section.", args[2]);
                                            }
                                            if (end_be != 1){
                                                error_made("cannot found end point for standard code section then it open and it Inuse.", args[2]);
                                            }
                                            
                                            long __num_count__ = cast(int)(__filecontent__[0 .. __main_].count('\n') + 1);
                                            long __start_code__ = __num_count__ + 1; //it for after main (std.main) at code, user typed code start after it.
                                            auto lines = __filecontent__.splitLines();
                                            string endline = lines[$ - 1];
                                            if (endline.indexOf("std.end: exit") != -1){
                                                __endbe_exit__ = 1;
                                                //if (lines.indexOf("fn") != -1){

                                                  //  lines = lines.replace("fn ")
                                                //}
                                                //int startds = __start_code__ - 1;
                                                for (int i = cast(int)(__start_code__ - 1); i < lines.length; i++){
                                                    string line = lines[i];
                                                    if (line.indexOf("fn") != -1){
                                                        auto hgf = regex(`fn (\S+)`);
                                                        auto jhg = match(line, hgf);
                                                    
                                                        if (!jhg.empty){
                                                        
                                                            auto fjjf = lines.replace("\tfn", "fn");
                                                            auto dhyf = jhg.captures[1];
                                                            //dhyf = dhyf.replace("flex.", "/.flex_/");
                                                            //auto hfg = regex(` :: (\S+)`);
                                                            //auto j = match(line, hfg);
                                                            //if (!j.empty){
                                                                //dhyf = dhyf.replace(" :: " ~ j, ""); //get file name
                                                            
                                                            auto fhd = readText(glue_global_import_value);
                                                            auto jfhf = regex(`fn (\S+)`);
                                                            auto hfg = match(fhd, jfhf);
                                                            if (!hfg.empty){
                                                                if (hfg.captures[1] == dhyf){
                                                                    //auto nee = fhd.split("\n");
                                                                    lines = lines[0 .. i] ~ lines[i+1 .. $];
                                                                    auto nee = fhd.split("\n");
                                                                    lines = lines[0 .. i] ~ nee ~ lines[i .. $];
                                                                }
                                                            }
                                                            
                                                            //lines = lines.replace("fn " ~ jhg.captures[1], fhd); 
                                                            // /writeln(lines);
                                                            
                                                        } else {
                                                            error_made("No function founded.", args[2]);
                                                        }
                                                    }  
                                                    if (line.indexOf("std.echo") != -1){
                                                        auto regex_of_std_echo = regex(`std.echo "(.*?)"`); //nect connect inside string.
                                                        auto _std_echo_value_ = match(line, regex_of_std_echo);
                                                        if (!_std_echo_value_.empty){
                                                            // now _std_echo_value_.captures[1] have value.
                                                            write(_std_echo_value_.captures[1]);
                                                        } else {
                                                            write(RED, args[2] ~ ":", RESET);
                                                            write(" Need last one value need for " ~ "'std.echo'.\n");
                                                            exit(1);
                                                        }
                                                    } else {
                                                        if (line.indexOf("std.newline") != -1 || line.indexOf("ln") != -1){
                                                                writeln("");
                                                        } else {
                                                            if (line.indexOf("equ.if") != -1){
                                                                auto regex_equ_if = regex(`equ.if (\S+)`);
                                                                auto __equal_it_vaule_ = match(line, regex_equ_if);
                                                                
                                                                if (!__equal_it_vaule_.empty){
                                                                    if (__equal_it_vaule_.captures[1] == "%" ~ custom_value[2]){
                                                                        if (global == custom_value[1]){
                                                                            __eqube__ = 1;
                                                                            
                                                                        }
                                                                    } else {
                                                                        if (__equal_it_vaule_.captures[1] == "not%"){
                                                                            if (global != global){
                                                                                __eqube__ = 1;
                                                                            }
                                                                        } else {
                                                                            auto stringer = regex(` "(.*?)"`);
                                                                            auto uhuh = match(line, stringer);
                                                                            if (!uhuh.empty) {
                                                                                if (uhuh.captures[1] == global){
                                                                                    __eqube__ = 1;
                                                                                }
                                                                            } else {
                                                                                if (__equal_it_vaule_.captures[1] == "%" || __equal_it_vaule_.captures[1] == "__string__"){
                                                                                    __eqube__ = 1;
                                                                                } else {
                                                                                        if ("%" ~ custom_value[4] == __equal_it_vaule_.captures[1]){
                                                                                            if (custom_value[3] == global){
                                                                                                __eqube__ = 1;
                                                                                            }
                                                                                        } else {
                                                                                            if ("%" ~ custom_value[6] == __equal_it_vaule_.captures[1]){
                                                                                                if (custom_value[5] == global){
                                                                                                    __eqube__ = 1;
                                                                                                }
                                                                                            } else {
                                                                                                if ("%" ~ custom_value[8] == __equal_it_vaule_.captures[1]){
                                                                                                    if (custom_value[7] == global){
                                                                                                        __eqube__ = 1;
                                                                                                    }
                                                                                                } else {
                                                                                                    if ("%" ~ custom_value[10] == __equal_it_vaule_.captures[1]){
                                                                                                        if (custom_value[9] == global){
                                                                                                            __eqube__ = 1;
                                                                                                        }
                                                                                                    } else {
                                                                                                        error_made("Syntex Error : maybe you forget (') or you type wrong?", args[2]);
                                                                                                    }
                                                                                                }
                                                                                            }
                                                                                        }
                                                                                }
                                                                                
                                                                            }
                                                                        }
                                                                    }
                                                                } else {
                                                                    write(RED, args[2] ~ ":", RESET);
                                                                    write(" Need last one value for " ~ "'equ.if'.\n");
                                                                    exit(1);
                                                                    
                                                                }
                                                            } else {
                                                                if (line.indexOf("equ.echo") != -1){
                                                                    auto yuy = regex(`equ.echo "(.*?)"`);
                                                                    auto yuy_value = match(line, yuy);
                                                                    if (!yuy_value.empty){
                                                                        if (__eqube__ == 1){
                                                                            write(yuy_value.captures[1]);
                                                                        }
                                                                    } else {
                                                                        write(RED, args[2] ~ ":", RESET);
                                                                        write(" Need last one value for " ~ "'equ.echo'.\n");
                                                                        exit(1);
                                                                    }
                                                                } else {
                                                                    if (line.indexOf("::cl") != -1){
                                                                        __eqube__ = 0;
                                                                    } else {
                                                                        if (line.indexOf("csys") != -1){
                                                                            if (corec_add == 1){
                                                                            auto __corec_sys_regex__ = regex(`csys "(.*?)"`);
                                                                            auto __corec_system_value__ = match(line, __corec_sys_regex__);
                                                                            if (!__corec_system_value__.empty){
                                                                                system(__corec_system_value__.captures[1].toStringz());
                                                                            } else {
                                                                                write(RED, args[2] ~ ":", RESET);
                                                                                write(" Need last one value for " ~ "'csys'.\n");
                                                                                exit(1);
                                                                            }
                                                                            } else {
                                                                                error_made("FUZE ERROR, unknown header 'corec' and unknown function on header 'csys'", args[2]);
                                                                            }
                                                                        } else {
                                                                            if (line.indexOf("error.new") != -1){
                                                                                if (error_add == 1){
                                                                                auto __errornew_regex__ = regex(`error.new "(.*?)"`);
                                                                                auto __errornew_value__ = match(line, __errornew_regex__);
                                                                                if (!__errornew_value__.empty){
                                                                                    error_made(__errornew_value__.captures[1], args[2]);
                                                                                } else {
                                                                                    error_made("Need last one value for 'error.new'", args[2]);
                                                                                }
                                                                                } else {

                                                                                                    error_made("FUZE ERROR, unknown header 'error' and unknown function on header 'new'", args[2]);
                                                                                }
                                                                            } else {
                                                                                if (line.indexOf("[%]") != -1 || line.indexOf("[__string__]") != -1){
                                                                                    auto name_ = regex(`, (\S+)`);
                                                                                    auto name__ = match(line, name_);
                                                                                    if (!name__.empty){
                                                                                        if (counter_how_much_cs == 10){
                                                                                            error_made("Syntex Error, Cannot put more value. (Maximum)", args[2]);
                                                                                        } else {
                                                                                            auto s_save = regex(`: "(.*?)"`);
                                                                                            auto s_save_value = match(line, s_save);
                                                                                            if (!s_save_value.empty){
                                                                                                custom_value[counter_how_much_cs + 1] = s_save_value.captures[1];
                                                                                                custom_value[counter_how_much_cs + 1 + 1 ] = name__.captures[1];
                                                                                            } else {
                                                                                                auto pm = regex(`: (\S+)`);
                                                                                                auto mm = match(line, pm);

                                                                                                if (mm.captures[1] == "%" ~ custom_value[2]){
                                                                                                    custom_value[counter_how_much_cs + 1] = custom_value[1];
                                                                                                    custom_value[counter_how_much_cs + 1 + 1 ] = name__.captures[1];
                                                                                                } else {
                                                                                                    if (mm.captures[1] == "%" ~ custom_value[4]){
                                                                                                        custom_value[counter_how_much_cs + 1] = custom_value[3];
                                                                                                        custom_value[counter_how_much_cs + 1 + 1 ] = name__.captures[1];
                                                                                                    } else {
                                                                                                        if (mm.captures[1] == "%" ~ custom_value[6]){
                                                                                                            custom_value[counter_how_much_cs + 1] = custom_value[5];
                                                                                                            custom_value[counter_how_much_cs + 1 + 1 ] = name__.captures[1];
                                                                                                        } else {
                                                                                                            if (mm.captures[1] == "%" ~ custom_value[8]){
                                                                                                                custom_value[counter_how_much_cs + 1] = custom_value[7];
                                                                                                                custom_value[counter_how_much_cs + 1 + 1 ] = name__.captures[1];
                                                                                                            } else {
                                                                                                                if (mm.captures[1] == "%" ~ custom_value[10]){
                                                                                                                    custom_value[counter_how_much_cs + 1] = custom_value[9];
                                                                                                                    custom_value[counter_how_much_cs + 1 + 1 ] = name__.captures[1];
                                                                                                                } else {
                                                                                                                    if (mm.captures[1] == "@" || mm.captures[1] == "__int__"){
                                                                                                                        custom_value[counter_how_much_cs + 1] = to!string(global_int);
                                                                                                                        custom_value[counter_how_much_cs + 1 + 1 ] = name__.captures[1];
                                                                                                                    } else {
                                                                                                                        if (mm.captures[1] == "%" || mm.captures[1] == "__string__"){
                                                                                                                            custom_value[counter_how_much_cs + 1] = global;
                                                                                                                            custom_value[counter_how_much_cs + 1 + 1 ] = name__.captures[1];
                                                                                                                        } else {
                                                                                                                            error_made("Unknown string or int value " ~ mm.captures[1] ~ ".", args[2]);
                                                                                                                        }
                                                                                                                    }
                                                                                                                }
                                                                                                            }
                                                                                                        }
                                                                                                    }
                                                                                                }
                                                                                            
                                                                                        }
                                                                                        }
                                                                                    } else {
                                                                                        auto s_save = regex(`: "(.*?)"`);
                                                                                        auto s_save_value = match(line, s_save);
                                                                                        if (!s_save_value.empty){
                                                                                            global = s_save_value.captures[1];
                                                                                        } else {
                                                                                            error_made("Syntex error, Need string to save at Global String as value of it.", args[2]);
                                                                                        }
                                                                                    }
                                                                                } else {
                                                                                    if (line.indexOf("std.format.echo") != -1 || line.indexOf("fecho") != -1){
                                                                                        auto s_save = regex(`std.format.echo (\S+)`);
                                                                                        auto s_save_value = match(line, s_save);
                                                                                        if (!s_save_value.empty){
                                                                                            if (s_save_value.captures[1] == "%" || s_save_value.captures[1] == "__string__"){
                                                                                                write(global);
                                                                                            } else {
                                                                                                if (to!string(s_save_value.captures[1]) == "%" ~ custom_value[2]){
                                                                                                    write(custom_value[1]);
                                                                                                } else {
                                                                                                    if (to!string(s_save_value.captures[1]) == "%" ~ custom_value[4]){
                                                                                                        write(custom_value[3]);
                                                                                                    } else {
                                                                                                        if (to!string(s_save_value.captures[1]) == "%" ~ custom_value[6]){
                                                                                                            write(custom_value[5]);
                                                                                                        } else {
                                                                                                            if (to!string(s_save_value.captures[1]) == "%" ~ custom_value[8]){
                                                                                                                write(custom_value[7]);
                                                                                                            } else {
                                                                                                                if (to!string(s_save_value.captures[1]) == "%" ~ custom_value[10]){
                                                                                                                    write(custom_value[9]);
                                                                                                                } else {
                                                                                                                   error_made("PASS ERROR, Cannot found any value for this label.", args[2]);
                                                                                                                }
                                                                                                            }
                                                                                                        }
                                                                                                    }
                                                                                                }
                                                                                            }
                                                                                        
                                                                                        } else {
                                                                                                auto mkm = regex(`fecho (\S+)`);
                                                                                                auto kdh = match(line, mkm);
                                                                                                if (!mkm.empty){
                                                                                                    if (kdh.captures[1] == "%" || kdh.captures[1] == "__string__"){
                                                                                                    write(global);
                                                                                                } else {
                                                                                                    if (to!string(kdh.captures[1]) == "%" ~ custom_value[2]){
                                                                                                        write(custom_value[1]);
                                                                                                    } else {
                                                                                                        if (to!string(kdh.captures[1]) == "%" ~ custom_value[4]){
                                                                                                            write(custom_value[3]);
                                                                                                        } else {
                                                                                                            if (to!string(kdh.captures[1]) == "%" ~ custom_value[6]){
                                                                                                                write(custom_value[5]);
                                                                                                            } else {
                                                                                                                if (to!string(kdh.captures[1]) == "%" ~ custom_value[8]){
                                                                                                                    write(custom_value[7]);
                                                                                                                } else {
                                                                                                                    if (to!string(kdh.captures[1]) == "%" ~ custom_value[10]){
                                                                                                                        write(custom_value[9]);
                                                                                                                    } else {
                                                                                                                        if (to!string(kdh.captures[1]) == "__float__"){
                                                                                                                            write(global_float);
                                                                                                                        } else {
                                                                                                                            if (kdh.captures[1] == "__bi__"){
                                                                                                                                write(global_mpf);
                                                                                                                            } else {
                                                                                                                                if (kdh.captures[1] == "__rea__"){
                                                                                                                                    write(global_real);
                                                                                                                                } else {
                                                                                                                                    if (kdh.captures[1] == "!f"){
                                                                                                                                        auto jgh = regex(`!f (\S+)`);
                                                                                                                                        auto gf = match(line, jgh);
                                                                                                                                        if (!gf.empty){
                                                                                                                                            write(format("%.15f", global_real));
                                                                                                                                        } else {
                                                                                                                                            error_made("At 'f' mode, you need type a real value label.", args[2]);
                                                                                                                                        }
                                                                                                                                    } else {
                                                                                                                                        error_made("PASS ERROR, Cannot found any value for this label.", args[2]);

                                                                                                                                    }
                                                                                                                                    
                                                                                                                                }
                                                                                                                                 
                                                                                                                            }
                                                                                                                               
                                                                                                                            }
                                                                                                                    
                                                                                                                
                                                                                                                        }
                                                                                                                    }
                                                                                                                }
                                                                                                            }
                                                                                                        }
                                                                                                    }
                                                                                                } else {
                                                                                                error_made("Need last one value for 'std.format.echo' or with label 'fecho'.", args[2]);
                                                                                            }
                                                                                            } 
                                                                                                
                                                                                        
                                                                                    } else {
                                                                                        if (line.indexOf("glue") != -1){
                                                                                            auto glue_ = regex(`glue (\S+)`);
                                                                                            auto glue_value = match(line, glue_);
                                                                                            if (!glue_value.empty){
                                                                                                if (glue_value.captures[1] == "file"){
                                                                                                    file_add = 1;
                                                                                                } else {
                                                                                                    if (glue_value.captures[1] == "error"){
                                                                                                        error_add = 1;
                                                                                                    } else {
                                                                                                        if (glue_value.captures[1] == "corec"){
                                                                                                            corec_add = 1;
                                                                                                        } else {
                                                                                                            if (glue_value.captures[1] == "string"){
                                                                                                                string_add = 1;
                                                                                                            } else {
                                                                                                                if (glue_value.captures[1] == "false"){
                                                                                                                    false_add = 1;
                                                                                                                } else {
                                                                                                                    if (glue_value.captures[1] == "debug"){
                                                                                                                        debug_add = 1;
                                                                                                                    } else {
                                                                                                                        if (glue_value.captures[1] == "gcolor"){
                                                                                                                            g_color_add = 1;
                                                                                                                        } else {
                                                                                                                            if (glue_value.captures[1] == "gserial"){
                                                                                                                                serial_add = 1;
                                                                                                                            } else {

                                                                                                                                string dk = glue_value.captures[1];
                                                                                                                                 dk = dk.replace("flex.", "");
                                                                                                                                 //writeln(dk);
                                                                                                                                string jj = glue_value.captures[1]; // flex.hi
                                                                                                                                
                                                                                                                                if (jj.indexOf("flex") != -1) {
                                                                                                                                    if (line.indexOf("/") != -1){
                                                                                                                                        auto jfj = regex(`/(\S+)`);
                                                                                                                                        auto jfj2 = match(dk, jfj);
                                                                                                                                        dk = dk.replace("/" ~ jfj2.captures[1], "");
                                                                                                                                        string d2k = glue_value.captures[1];
                                                                                                                                        d2k = d2k.replace("flex.", "");
                                                                                                                                        jj = jj.replace(d2k , "");
                                                                                                                                        jj = jj.replace("flex.", "/usr/flex/.lib/" ~ dk ~ "/" ~ jfj2.captures[1] ~ ".g");
                                                                                                                                        
                                                                                                                                    } else {

                                                                                                                                    
                                                                                                                                    jj = jj.replace(dk, "");
                                                                                                                                    jj = jj.replace("flex.", "/usr/flex/.lib/" ~ dk ~ "/" ~ dk ~ ".g");
                                                                                                                                    }
                                                                                                                                }
                                                                                                                                
                                                                                                                                
                                                                                                                                //writeln(jj);
                                                                                                                                if (exists(jj)){
                                                                                                                                    //string hdf = glue_value.captures[1];
                                                                                                                                    //if (glue_value.captures[1].indexOf("flex.") != -1){
                                                                                                                                        
                                                                                                                                        //hdf = hdf.replace("flex.", "/usr/flex/.lib/" ~ dk ~ "/" ~ dk ~ ".g");
                                                                                                                                    //}
                                                                                                                                    glue_global_import_value = jj;
                                                                                                                                } else {
                                                                                                                                    error_made("Name Error, \033[1m'" ~ glue_value.captures[1] ~ "'\033[0m is not standard name for \033[1m'glue'\033[0m.", args[2]);
                                                                                                                                }
                                                                                                                            }
                                                                                                                        }
                                                                                                                    }
                                                                                                                    
                                                                                                                }
                                                                                                            
                                                                                                            }
                                                                                                        }
                                                                                                    }
                                                                                                }
                                                                                            } else {
                                                                                                error_made("Need last one value for 'glue'.", args[2]);
                                                                                            }

                                                                                        } else {
                                                                                            if (line.indexOf("file.read") != -1){
                                                                                                if (file_add == 1) {
                                                                                                auto s_save = regex(`file.read "(.*?)"`);
                                                                                                auto s_save_value = match(line, s_save);
                                                                                                auto stringd = regex(`file.read (\S+)`);
                                                                                                auto string_value = match(line, stringd);
                                                                                                if (!s_save_value.empty){
                                                                                                        mds = s_save_value.captures[1];
                                                                                                 
                                                                                                    if (exists(mds)){
                                                                                                        global = readText(mds).chomp();
                                                                                                    } else {
                                                                                                        error_made("FileSystem FAILD , " ~ mds ~ " not exists.", args[2]);
                                                                                                    }
                                                                                                    
                                                                                                } else {
                                                                                                    if (!string_value.empty){
                                                                                                        mds = string_value.captures[1];
                                                                                                        if (exists(mds)){
                                                                                                            global = readText(mds);
                                                                                                        } else {
                                                                                                            error_made("FileSystem FAILD , " ~ mds ~ " not exists.", args[2]);
                                                                                                        }
                                                                                                    } else {
                                                                                                        error_made("Need last one value for 'file.read'", args[2]);
                                                                                                    }
                                                                                                    
                                                                                                }
                                                                                                } else {
                                                                                                    error_made("FUZE ERROR, unknown header 'file' and unknown function on header 'read'", args[2]);
                                                                                                }
                                                                                                
                                                                                            } else {
                                                                                                if (line.indexOf("file.write") != -1){
                                                                                                    if (file_add == 1){
                                                                                                        auto s_save = regex(`file.write "(.*?)"`);
                                                                                                        auto s_save_value = match(line, s_save);
                                                                                                        if (!s_save_value.empty){
                                                                                                            if (exists(s_save_value.captures[1])){
                                                                                                                try {
                                                                                                                    auto m = File(s_save_value.captures[1], "w");
                                                                                                                    m.write(global);
                                                                                                                    m.close();

                                                                                                                } catch(Exception e){
                                                                                                                    if (to!string(e).indexOf("Enforcement failed (Bad file descriptor)") != -1){
                                                                                                                        error_made("FileSystem FAILD, cannot save into " ~ s_save_value.captures[1] ~ ", Enforcement Failed (Bad file descriptor)", args[2]);
                                                                                                                    }
                                                                                                                    error_made("FileSystem FAILD, cannot save into " ~ s_save_value.captures[1] ~ " " ~ to!string(e), args[2]);
                                                                                                                }
                                                                                                                
                                                                                                            } else {
                                                                                                                error_made("FileSystem FAILD , " ~ s_save_value.captures[1] ~ " not exists.", args[2]);
                                                                                                            }
                                                                                                        } else {
                                                                                                            auto m = regex(`file.write (\S+)`);
                                                                                                            auto m1 = match(line, m);
                                                                                                            if (!m1.empty){
                                                                                                                if ("%" ~ custom_value[2] == m1.captures[1]){
                                                                                                                    auto q = File(custom_value[1], "w");
                                                                                                                    q.write(global);
                                                                                                                    q.close();
                                                                                                                }
                                                                                                            } else {
                                                                                                                error_made("Need last one value or unknown string " ~ m1.captures[1] ~ ".", args[2]);
                                                                                                            }
                                                                                                        }
                                                                                                    } else {
                                                                                                        error_made("FUZE ERROR, unknown header 'file' and unknown function on header 'write'", args[2]);
                                                                                                    }
                                                                                                } else {
                                                                                                    if (line.indexOf("file.exs") != -1){
                                                                                                        if (file_add == 1){
                                                                                                        auto value = regex(`file.exs "(.*?)"`);
                                                                                                        auto match_value = match(line, value);
                                                                                                        if (!match_value.empty){
                                                                                                            if (exists(match_value.captures[1])){
                                                                                                                __eqube__ = 1;
                                                                                                            } else {
                                                                                                                __eqube__ = 0;
                                                                                                            }
                                                                                                        } else {
                                                                                                            auto value1 = regex(`file.exs (\S+)`);
                                                                                                            auto m = match(line, value1);
                                                                                                            if (!m.empty){
                                                                                                                if (m.captures[1] == "%" ~ custom_value[2]){
                                                                                                                    if (exists(custom_value[1])){
                                                                                                                        __eqube__ = 1;
                                                                                                                    } else {
                                                                                                                        __eqube__ = 0;
                                                                                                                    }
                                                                                                                } else {
                                                                                                                    if (m.captures[1] == "%" ~ custom_value[4]){
                                                                                                                        if(exists(custom_value[3])){
                                                                                                                            __eqube__ = 1;
                                                                                                                        } else {
                                                                                                                            __eqube__ = 0;
                                                                                                                        }
                                                                                                                    } else {
                                                                                                                        if (m.captures[1] == "%" ~ custom_value[6]){
                                                                                                                            if(exists(custom_value[5])){
                                                                                                                                __eqube__ = 1;
                                                                                                                            } else {
                                                                                                                                __eqube__ = 0;
                                                                                                                            }
                                                                                                                        } else {
                                                                                                                            if (m.captures[1] == "%" ~ custom_value[8]){
                                                                                                                                if (exists(custom_value[7])){
                                                                                                                                    __eqube__ = 1;
                                                                                                                                } else {
                                                                                                                                    __eqube__ = 0;
                                                                                                                                }
                                                                                                                            } else {
                                                                                                                                if (m.captures[1] == "%" ~ custom_value[10]){
                                                                                                                                    if (exists(custom_value[9])){
                                                                                                                                        __eqube__ = 1;
                                                                                                                                    } else {
                                                                                                                                        __eqube__ = 0;
                                                                                                                                    }
                                                                                                                                } else {
                                                                                                                                    if (m.captures[1] == "%"){
                                                                                                                                        if (exists(global)){
                                                                                                                                            __eqube__ = 1;
                                                                                                                                        } else {
                                                                                                                                            __eqube__ = 0;
                                                                                                                                        }
                                                                                                                                    } else {
                                                                                                                                        error_made("unknown string " ~ m.captures[1] ~ ".", args[2]);
                                                                                                                                    }
                                                                                                                                }
                                                                                                                            }
                                                                                                                        }

                                                                                                                    }
                                                                                                                    }
                                                                                                                } else {
                                                                                                                    error_made("Need last one value for 'file.exs'.", args[2]);
                                                                                                                }
                                                                                                            } 
                                                                                                            
                                                                                                        } 
                                                                                                        
                                                                                                        } else {
                                                                                                        if (line.indexOf("string.userln") != -1){
                                                                                                            if (string_add == 1){
                                                                                                                global = readln();
                                                                                                                global = chomp(global);
                                                                                                            } else {
                                                                                                                error_made("FUZE ERROR, unknown header 'string' and unknown function 'userln'.", args[2]);
                                                                                                            }
                                                                                                        } else {
                                                                                                            if (line.indexOf("false.echo") != -1 || line.indexOf("ffecho") != -1){
                                                                                                                if (false_add == 1){
                                                                                                                    auto value = regex(`false.echo "(.*?)"`);
                                                                                                                    auto value_sss = match(line, value);
                                                                                                                    if (!value_sss.empty){
                                                                                                                        if (__eqube__ == 0){
                                                                                                                            write(value_sss.captures[1]);
                                                                                                                        }
                                                                                                                    } else {
                                                                                                                        error_made("Need last one value for 'false.echo'.", args[2]);
                                                                                                                    }
                                                                                                                } else {
                                                                                                                    error_made("FUZE ERROR, unknown header 'false' and unknown function 'echo'.", args[2]);
                                                                                                                }
                                                                                                            } else {
                                                                                                                if (line.indexOf("std.exit") != -1){
                                                                                                                    exit(0);
                                                                                                                } else {
                                                                                                                    if (line.indexOf("std.false.exit") != -1 || line.indexOf("fexit") != -1){
                                                                                                                        if (__eqube__ == 0){
                                                                                                                            exit(0);
                                                                                                                        }
                                                                                                                    } else {
                                                                                                                        if (line.indexOf("std.equ.exit") != -1 || line.indexOf("texit") != -1){
                                                                                                                            if (__eqube__ == 1){
                                                                                                                                exit(0);
                                                                                                                            }
                                                                                                                        } else {
                                                                                                                            if (line.indexOf("[@]") != -1 || line.indexOf("[__int__]") != -1){
                                                                                                                                auto hj = regex(`: (\S+)`);
                                                                                                                                auto mj = match(line, hj);
                                                                                                                                if (!mj.empty){
                                                                                                                                    auto mol = regex(`\+ (\S+)`);
                                                                                                                                    auto mlk = match(line, mol);
                                                                                                                                    if (!mlk.empty){
                                                                                                                                        try {
                                                                                                                                            global_int = to!int(global_int) + to!int(mlk.captures[1]);
                                                                                                                                        } catch (Exception e){
                                                                                                                                            error_made("maybe you not put number in [@]?", args[2]);
                                                                                                                                        }
                                                                                                                                    } else {
                                                                                                                                        auto meam = regex(`\- (\S+)`);
                                                                                                                                        auto kmk = match(line, meam);
                                                                                                                                        if (!kmk.empty){
                                                                                                                                            try {
                                                                                                                                                global_int = to!int(global_int) - to!int(kmk.captures[1]);
                                                                                                                                            } catch (Exception e){
                                                                                                                                                error_made("maybe you not put number in [@]?", args[2]);
                                                                                                                                            }
                                                                                                                                        } else {
                                                                                                                                            auto __mosali__ = regex(`\\ (\S+)`);
                                                                                                                                            auto __mosalidictator__ = match(line, __mosali__);
                                                                                                                                            if (!__mosalidictator__.empty){
                                                                                                                                                try {
                                                                                                                                                    global_int = to!int(global_int) / to!int(__mosalidictator__.captures[1]);
                                                                                                                                                } catch (Exception e){
                                                                                                                                                    error_made("maybe you not put number in [@]?", args[2]);
                                                                                                                                                }
                                                                                                                                            } else {
                                                                                                                                                auto mjmj = regex(`\* (\S+)`);
                                                                                                                                                auto runinmyhead = match(line, mjmj);
                                                                                                                                                if (!runinmyhead.empty){
                                                                                                                                                    global_int = to!int(global_int) * to!int(runinmyhead.captures[1]);
                                                                                                                                                } else {
                                                                                                                                                    global_int = to!int(mj.captures[1]);
                                                                                                                                                }
                                                                                                                                            }
                                                                                                                                        }
                                                                                                                                        
                                                                                                                                    }
                                                                                                                                } else {
                                                                                                                                    error_made("Syntex error, Need string to save at Global Number as value of it.", args[2]);
                                                                                                                                }
                                                                                                                               
                                                                                                                            } else {
                                                                                                                                if (line.indexOf("string.num") != -1){
                                                                                                                                    if (string_add == 1){
                                                                                                                                        global = to!string(global_int);
                                                                                                                                    } else {
                                                                                                                                        error_made("FUZE ERROR, unknown header 'string' and unknown function 'num'.", args[2]);
                                                                                                                                    }
                                                                                                                                    
                                                                                                                                } else {
                                                                                                                                    if (line.indexOf("string.in") != -1){
                                                                                                                                        if (string_add == 1){
                                                                                                                                            auto value = regex(`string.in "(.*?)"`);
                                                                                                                                            auto value_of = match(line, value);
                                                                                                                                            if (!value_of.empty){
                                                                                                                                                if (global.indexOf(value_of.captures[1]) != -1){
                                                                                                                                                    __eqube__ = 1;
                                                                                                                                                }
                                                                                                                                            } else {
                                                                                                                                                error_made("Syntex Error : Cannot 'string.in' be empty.", args[2]);
                                                                                                                                            }
                                                                                                                                        } else {
                                                                                                                                            error_made("FUZE ERROR, unknown header 'string' and unknown function 'in'.", args[2]);
                                                                                                                                        }
                                                                                                                                    } else {
                                                                                                                                        if (line.indexOf("std.slp") != -1){
                                                                                                                                            auto value = regex(` "(\S+)"`);
                                                                                                                                            auto value_of = match(line, value);
                                                                                                                                            if (!value_of.empty){
                                                                                                                                                sleep(to!int(value_of.captures[1]));
                                                                                                                                            } else {
                                                                                                                                                error_made("Need last one value for 'std.slp'.", args[2]);
                                                                                                                                            }
                                                                                                                                            
                                                                                                                                        } else {
                                                                                                                                                                                                                                                                                   //}
                                                                                                                                            if (line.indexOf("equ.corec.system") != -1){
                                                                                                                                                if (__eqube__ == 1){
                                                                                                                                                    auto hgg = regex(`equ.corec.system "(.*?)"`);
                                                                                                                                                    auto hank = match(line,hgg);
                                                                                                                                                    if (!hank.empty){
                                                                                                                                                        if (__eqube__ == 1){
                                                                                                                                                            system(toStringz(hank.captures[1]));
                                                                                                                                                        }
                                                                                                                                                    }
                                                                                                                                                 
                                                                                                                                                }
                                                                                                                                            } else {
                                                                                                                                                if (line.indexOf("glang.version") != -1){
                                                                                                                                                    /*
                                                                                                                                                    simple : this will get interpreter version then saved in "gsss_version" in top of file and put it in global string.

                                                                                                                                                    this function i think not ave too many thing to talk about it.
                                                                                                                                                    */
                                                                                                                                                    global = gsss_version;
                                                                                                                                                } else {
                                                                                                                                                    if (line.indexOf("std.json") != -1){
                                                                                                                                                        //we goal : 
                                                                                                                                                        /*
                                                                                                                                                        1. read json file and put it in a JSONValue so we can use it later.
                                                                                                                                                        2. after read it we get oprator from user to check whats we must do with this.
                                                                                                                                                        3. if user type "get" as option 2 it means he/she want to get value of a data in json.
                                                                                                                                                        But if it be int (number) or string? we need to check whats it be and after it save in correct global data type.
                                                                                                                                                        4. test if it work
                                                                                                                                                        5. add more options for it.
                                                                                                                                                        */
                                                                                                                                                        // this function will get data of json file and put it and start get value from json.
                                                                                                                                                        // first we got file name.
                                                                                                                                                        string vals = "";
                                                                                                                                                        auto get_name_of_json = regex(`std.json "(.*?)"`);
                                                                                                                                                        auto get_name__ = match(line, get_name_of_json);
                                                                                                                                                        if (!get_name__.empty){
                                                                                                                                                            // if we are here it means we now have filename but we must first check if fiel be or not.
                                                                                                                                                            if (exists(get_name__.captures[1])){
                                                                                                                                                                //now lets read the file and put it on a json value then we can us eit.
                                                                                                                                                                
                                                                                                                                                                    string readt = readText(get_name__.captures[1]);
                                                                                                                                                                    JSONValue jsonv = parseJSON(readt);
                                                                                                                                                                    // now we in goal 2.
                                                                                                                                                                    auto gjson__ = regex("\"" ~ get_name__.captures[1] ~ "\"" ~ ` (\S+)`);
                                                                                                                                                                    auto gjson__2 = match(line, gjson__);
                                                                                                                                                                    // to for my debug prosees writeln(gjson__2.captures[1]);
                                                                                                                                                                    if (!gjson__2.empty){
                                                                                                                                                                        //now we in gloal 3
                                                                                                                                                                        if (gjson__2.captures[1] == "get"){
                                                                                                                                                                            // now we need name of data label in json.
                                                                                                                                                                            auto naof = regex(gjson__2.captures[1] ~ ` "(.*?)"`);
                                                                                                                                                                            auto naof2 = match(line, naof);
                                                                                                                                                                            if (!naof2.empty){
                                                                                                                                                                                // we now have data name!
                                                                                                                                                                                // lets get value of it and check what the fuc* its be.
                                                                                                                                                                                if (jsonv[naof2.captures[1]].type == JSONType.string){ //check if it be a string
                                                                                                                                                                                    global = jsonv[naof2.captures[1]].str; // it b done lets move it in right data type "string".
                                                                                                                                                                                    /*
                                                                                                                                                                                    now we must check whats type it be and save it in correct data type gloabl.
                                                                                                                                                                                    */
                                                                                                                                                                                } else if(jsonv[naof2.captures[1]].type == JSONType.integer){ //check if it be really a number
                                                                                                                                                                                    global_int = to!int(jsonv[naof2.captures[1]].integer); // i remove convert for it be like dead code. it return long but we want int.
                                                                                                                                                                                } else if(jsonv[naof2.captures[1]].type == JSONType.FLOAT){ //check if it be a float
                                                                                                                                                                                    global_float = to!float(jsonv[naof2.captures[1]].floating); // it be now lets move it in global float. as it return double i must convert it to float
                                                                                                                                                                                } else {
                                                                                                                                                                                    error_made("unsupported json data type.", args[2]);
                                                                                                                                                                                }
                                                                                                                                                                            } else {
                                                                                                                                                                                error_made("Need last three value for 'std.json' with oprator 'get'.", args[2]);
                                                                                                                                                                            }
                                                                                                                                                                        } else {
                                                                                                                                                                            //f or now lets just work with get
                                                                                                                                                                            error_made("unknown option " ~ gjson__2.captures[1], args[2]);
                                                                                                                                                                        }
                                                                                                                                                                    } else {
                                                                                                                                                                        error_made("Need last three value for 'std.json'.", args[2]);
                                                                                                                                                                    }
                                                                                                                                                                
                                                                                                                                                            } else {
                                                                                                                                                                error_made("json file is not exists.", args[2]);
                                                                                                                                                            }
                                                                                                                                                        }
                                                                                                                                                        
                                                                                                                                                    } else {
                                                                                                                                                        if (line.indexOf("defe") != -1){
                                                                                                                                                            if (debug_add == 1){
                                                                                                                                                                global = to!string(__eqube__);
                                                                                                                                                            } else {
                                                                                                                                                                error_made("FuZE ERROR, 'defe' is not be. maybe need glue debug?", args[2]);
                                                                                                                                                            }
                                                                                                                                                        } else {
                                                                                                                                                            if (line.indexOf("if") != -1){
                                                                                                                                                                auto m = regex(`if (\S+)`);
                                                                                                                                                                auto m_1 = match(line, m);
                                                                                                                                                                if (debug_add == 1){
                                                                                                                                                                    info_made("get " ~ m_1.captures[1] ~ " for value name 'if'.", args[2]);
                                                                                                                                                                }
                                                                                                                                                                if (!m_1.empty){
                                                                                                                                                                    if (m_1.captures[1] == "@"){
                                                                                                                                                                        if (debug_add == 1){
                                                                                                                                                                            info_made("get " ~ m_1.captures[1] ~ " for value name of 'if'.", args[2]);
                                                                                                                                                                        }
                                                                                                                                                                    auto valueofopreator = regex(m_1.captures[1] ~ ` (\S+)`);
                                                                                                                                                                    auto oprator = match(line, valueofopreator);
                                                                                                                                                                    if (!oprator.empty){
                                                                                                                                                                        auto valueforo = regex(oprator.captures[1] ~ ` (\S+)`);
                                                                                                                                                                        auto rege = match(line, valueforo);
                                                                                                                                                                        if (!rege.empty){
                                                                                                                                                                            if (oprator.captures[1] == ">"){
                                                                                                                                                                                if (global_int < to!int(rege.captures[1])){
                                                                                                                                                                                    __eqube__ = 1;

                                                                                                                                                                                } else {
                                                                                                                                                                                    __eqube__ = 0;
                                                                                                                                                                                }
                                                                                                                                                                            } else if(oprator.captures[1] == "<"){
                                                                                                                                                                                if (global_int > to!int(rege.captures[1])){
                                                                                                                                                                                    __eqube__ = 1;
                                                                                                                                                                                } else {
                                                                                                                                                                                    __eqube__ = 0;
                                                                                                                                                                                }
                                                                                                                                                                            } else if(oprator.captures[1] == "="){
                                                                                                                                                                                if (global_int == to!int(rege.captures[1])){
                                                                                                                                                                                    __eqube__ = 1;
                                                                                                                                                                                } else {
                                                                                                                                                                                    __eqube__ = 0;
                                                                                                                                                                                }
                                                                                                                                                                            } else {
                                                                                                                                                                                error_made("unsupported oprator for 'if'.", args[2]);
                                                                                                                                                                            }

                                                                                                                                                                        
                                                                                                                                                                        
                                                                                                                                                                        } else {
                                                                                                                                                                            error_made("Need oprator of 'if'", args[2]);

                                                                                                                                                                        }
                                                                                                                                                                     }
                                                                                                                                                                    } else {
                                                                                                                                                                    if ("%" ~ custom_value[2] == m_1.captures[1]){
                                                                                                                                                                        if (custom_value[1] == global){
                                                                                                                                                                            __eqube__ = 1;
                                                                                                                                                                        } else {
                                                                                                                                                                            __eqube__ = 0;
                                                                                                                                                                        }
                                                                                                                                                                    } else {
                                                                                                                                                                        if ("%" ~ custom_value[4] == m_1.captures[1]){
                                                                                                                                                                            if (custom_value[3] == global){
                                                                                                                                                                                __eqube__ = 1;
                                                                                                                                                                            } else {
                                                                                                                                                                                __eqube__ = 0;
                                                                                                                                                                            }
                                                                                                                                                                            } else {
                                                                                                                                                                                            error_made("unknown string " ~ m_1.captures[1] ~ ".", args[2]);
                                                                                                                                                                            }
                                                                                                                                                                                
                                                                                                                                                                        }
                                                                                                                                                                    }
                                                                                                                                                                    } else {
                                                                                                                                                                        error_made("Need last one value for 'if'.", args[2]);
                                                                                                                                                                    }
                                                                                                                                                                
                                                                                                                                                                
                                                                                                                                                            
                                                                                                                                                            } else {
                                                                                                                                                                if (line.indexOf("conv ") != -1){
                                                                                                                                                                    auto ggmsg = regex(`conv (\S+)`);
                                                                                                                                                                    auto ggdh = match(line, ggmsg);
                                                                                                                                                                    if (!ggdh.empty){
                                                                                                                                                                        if (ggdh.captures[1] == "__int__"){
                                                                                                                                                                            auto mj = regex(`__int__ (\S+)`);
                                                                                                                                                                            auto mfj = match(line, mj);
                                                                                                                                                                            if (!mfj.empty){
                                                                                                                                                                                try {
                                                                                                                                                                                    if (mfj.captures[1] == "%" ~ custom_value[2]){
                                                                                                                                                                                        global_int = to!int(custom_value[1]);
                                                                                                                                                                                    } else {
                                                                                                                                                                                        if (mfj.captures[1] == "%" ~ custom_value[4]){
                                                                                                                                                                                            global_int = to!int(custom_value[3]);
                                                                                                                                                                                        } else {
                                                                                                                                                                                            if (mfj.captures[1] == "%" ~ custom_value[6]){
                                                                                                                                                                                                global_int = to!int(custom_value[5]);
                                                                                                                                                                                            } else {
                                                                                                                                                                                                if (mfj.captures[1] == "%" ~ custom_value[8]){
                                                                                                                                                                                                    global_int = to!int(custom_value[7]);
                                                                                                                                                                                                } else {
                                                                                                                                                                                                    if (mfj.captures[1] == "%" ~ custom_value[10]){
                                                                                                                                                                                                        global_int = to!int(custom_value[9]);
                                                                                                                                                                                                    } else {
                                                                                                                                                                                                        if (mfj.captures[1] == "%"){
                                                                                                                                                                                                            global_int = to!int(global);
                                                                                                                                                                                                        }
                                                                                                                                                                                                    }
                                                                                                                                                                                                }
                                                                                                                                                                                            }
                                                                                                                                                                                        }
                                                                                                                                                                                    }
                                                                                                                                                                                } catch (Exception e){
                                                                                                                                                                                   error_made("Unreal value inside 'conv' as __int__, value is not number.", args[2]);
                                                                                                                                                                                }
                                                                                                                                                                            } else {
                                                                                                                                                                                error_made("need last one value (as number) inside 'conv'.", args[2]);
                                                                                                                                                                            }
                                                                                                                                                                        } else {

                                                                                                                                                                        }
                                                                                                                                                                    } else {
                                                                                                                                                                        error_made("Need last two value for 'conv'.", args[2]);
                                                                                                                                                                    }
                                                                                                                                                                    
                                                                                                                                                                } else {
                                                                                                                                                                    if (line.indexOf("int.echo") != -1){
                                                                                                                                                                        auto m = regex(`int.echo (\S+)`);
                                                                                                                                                                        auto jkl = match(line, m);
                                                                                                                                                                        if (!jkl.empty){
                                                                                                                                                                            if (jkl.captures[1] == "@" || jkl.captures[1] == "__int__"){
                                                                                                                                                                                write(global_int);
                                                                                                                                                                            } else {
                                                                                                                                                                                try {
                                                                                                                                                                                    write(to!int(jkl.captures[1]));
                                                                                                                                                                                } catch (Exception e){
                                                                                                                                                                                    error_made("Syntex Error, value inside 'int.echo' is not __int__.", args[2]);
                                                                                                                                                                                }
                                                                                                                                                                            }
                                                                                                                                                                        }
                                                                                                                                                                    } else {
                                                                                                                                                                        if (line.indexOf("glang.build") != -1){
                                                                                                                                                                            auto ll = regex(`glang.build (\S+)`);
                                                                                                                                                                            auto ll_2 = match(line, ll);
                                                                                                                                                                            if (!ll_2.empty){
                                                                                                                                                                                if (ll_2.captures[1] == "_date"){
                                                                                                                                                                                    global = __DATE__;
                                                                                                                                                                                } else {
                                                                                                                                                                                    if (ll_2.captures[1] == "_time"){
                                                                                                                                                                                        global = __TIME__;
                                                                                                                                                                                    }
                                                                                                                                                                                }
                                                                                                                                                                            }
                                                                                                                                                                        } else {
                                                                                                                                                                            if (line.indexOf("lwhile") != -1){
                                                                                                                                                                                try {
                                                                                                                                                                                    auto mf = regex(`lwhile (\S+)`);
                                                                                                                                                                                    auto mkm = match(line, mf);
                                                                                                                                                                                    if (!mkm.empty){
                                                                                                                                                                                        if (exists(mkm.captures[1] ~ ".g")){
                                                                                                                                                                                            int xx = 0;
                                                                                                                                                                                            while (xx < global_int){
                                                                                                                                                                                                system(toStringz("glang -c " ~ mkm.captures[1] ~ ".g"));
                                                                                                                                                                                                xx++;
                                                                                                                                                                                            }
                                                                                                                                                                                            
                                                                                                                                                                                        }
                                                                                                                                                                                        
                                                                                                                                                                                    } else {
                                                                                                                                                                                        error_made("Need last one value for 'lwhile'.", args[2]);
                                                                                                                                                                                    }
                                                                                                                                                                                    
                                                                                                                                                                                } catch (Exception e){
                                                                                                                                                                                    error_made("Unknown file system error.", args[2]);
                                                                                                                                                                                }
                                                                                                                                                                            } else {
                                                                                                                                                                                if (line.indexOf("time.isotime.echo") != -1){
                                                                                                                                                                                    SysTime iii; //SysTime
                                                                                                                                                                                    try {
                                                                                                                                                                                        iii = Clock.currTime();
                                                                                                                                                                                        writeln(iii);
                                                                                                                                                                                    } catch (Exception e){
                                                                                                                                                                                        error_made("Unknown error in 'time.isotime'.", args[2]);
                                                                                                                                                                                    }
                                                                                                                                                                                } else {
                                                                                                                                                                                    if (line.indexOf("_0.std.exit") != -1){
                                                                                                                                                                                        if (__eqube__ += 0){
                                                                                                                                                                                            exit(0);
                                                                                                                                                                                        }
                                                                                                                                                                                    } else {
                                                                                                                                                                                        if (line.indexOf("_0.std.newline") != -1){
                                                                                                                                                                                            if (__eqube__ == 0){
                                                                                                                                                                                                writeln("");

                                                                                                                                                                                            }
                                                                                                                                                                                        } else {
                                                                                                                                                                                            if (line.indexOf("lxd") != -1){
                                                                                                                                                                                                auto yuy = regex(`lxd (\S+)`);
                                                                                                                                                                                                auto hjhj = match(line, yuy);
                                                                                                                                                                                                if (!hjhj.empty){
                                                                                                                                                                                                    if (__eqube__ == 1){
                                                                                                                                                                                                        if (exists(hjhj.captures[1] ~ ".g")){
                                                                                                                                                                                                            system(toStringz("glang -c " ~ hjhj.captures[1] ~ ".g"));
                                                                                                                                                                                                        }
                                                                                                                                                                                                    }
                                                                                                                                                                                                }
                                                                                                                                                                                            } else {
                                                                                                                                                                                                if (line.indexOf("string.stwith") != -1){
                                                                                                                                                                                                    auto value = regex(`string.stwith (\S+)`);
                                                                                                                                                                                                    auto value1 = match(line, value);
                                                                                                                                                                                                    if (!value1.empty){
                                                                                                                                                                                                        auto value2 = regex(`-> (\S+)`);
                                                                                                                                                                                                        auto vale2_1 = match(line, value2);
                                                                                                                                                                                                        if (!vale2_1.empty){
                                                                                                                                                                                                            if (value1.captures[1] == "%" ~ custom_value[2]){
                                                                                                                                                                                                                if (startsWith(custom_value[1], vale2_1.captures[1])){
                                                                                                                                                                                                                    __eqube__ = 1;
                                                                                                                                                                                                                }
                                                                                                                                                                                                            } else {
                                                                                                                                                                                                                    if (value1.captures[1] == "%" ~ custom_value[4]){
                                                                                                                                                                                                                        if (startsWith(custom_value[3], vale2_1.captures[1])){
                                                                                                                                                                                                                            __eqube__ = 1;
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                    } else {
                                                                                                                                                                                                                        if (value1.captures[1] == "%" ~ custom_value[6]){
                                                                                                                                                                                                                            if (startsWith(custom_value[5], vale2_1.captures[1])){
                                                                                                                                                                                                                                __eqube__ = 1;
                                                                                                                                                                                                                            }
                                                                                                                                                                                                                        } else {
                                                                                                                                                                                                                            if (value1.captures[1] == "%" ~ custom_value[8]){
                                                                                                                                                                                                                                if (startsWith(custom_value[7], vale2_1.captures[1])){
                                                                                                                                                                                                                                    __eqube__ = 1;
                                                                                                                                                                                                                                }
                                                                                                                                                                                                                            } else {
                                                                                                                                                                                                                                if (value1.captures[1] == "%" ~ custom_value[10]){
                                                                                                                                                                                                                                    if (startsWith(custom_value[9], vale2_1.captures[1])){
                                                                                                                                                                                                                                        __eqube__ = 1;
                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                } else {
                                                                                                                                                                                                                                    if (value1.captures[1] == "%"){
                                                                                                                                                                                                                                        if (startsWith(global, vale2_1.captures[1])){
                                                                                                                                                                                                                                        __eqube__ = 1;
                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                    } else {
                                                                                                                                                                                                                                        auto jhk = regex(`-> "(.*?)"`);
                                                                                                                                                                                                                                        auto bbvb = match(line, jhk);
                                                                                                                                                                                                                                        if (!bbvb.empty){
                                                                                                                                                                                                                                            if (value1.captures[1] == "%"){
                                                                                                                                                                                                                                                if (startsWith(global, vale2_1.captures[1])){
                                                                                                                                                                                                                                                    __eqube__ = 1;
                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                }
                                                                                                                                                                                                                            }
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                    }
                                                                                                                                                                                                                }
                                                                                                                                                                                                            }
                                                                                                                                                                                                        }
                                                                                                                                                                                                    }
                                                                                                                                                                                                } else {
                                                                                                                                                                                                    if (line.indexOf("cutspace") != -1){
                                                                                                                                                                                                        auto spa = regex(`cutspace (\S+)`);
                                                                                                                                                                                                        auto spa1 = match(line, spa);
                                                                                                                                                                                                        if (!spa.empty){
                                                                                                                                                                                                            if (spa1.captures[1] == "%" ~ custom_value[2]){
                                                                                                                                                                                                                custom_value[1] = custom_value[1].replace("_", " ");
                                                                                                                                                                                                            } else {
                                                                                                                                                                                                                if (spa1.captures[1] == "%" ~ custom_value[4]){
                                                                                                                                                                                                                    custom_value[3] = custom_value[3].replace("_", " ");
                                                                                                                                                                                                                } else {
                                                                                                                                                                                                                    if (spa1.captures[1] == "%" ~ custom_value[6]){
                                                                                                                                                                                                                        custom_value[5] = custom_value[5].replace("_", " ");
                                                                                                                                                                                                                    } else {
                                                                                                                                                                                                                        if (spa1.captures[1] == "%" ~ custom_value[8]){
                                                                                                                                                                                                                            custom_value[7] = custom_value[7].replace("_", " ");
                                                                                                                                                                                                                        } else {
                                                                                                                                                                                                                            if (spa1.captures[1] == "%" ~ custom_value[10]){
                                                                                                                                                                                                                                custom_value[9] = custom_value[9].replace("_", " ");
                                                                                                                                                                                                                            } else {
                                                                                                                                                                                                                                if (spa1.captures[1] == "%"){
                                                                                                                                                                                                                                    global = global.replace("_", " ");
                                                                                                                                                                                                                                } else {
                                                                                                                                                                                                                                    error_made("Unknown value or function " ~ spa1.captures[1], args[2]);
                                                                                                                                                                                                                                }
                                                                                                                                                                                                                            }
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                    }
                                                                                                                                                                                                                }
                                                                                                                                                                                                            }
                                                                                                                                                                                                        } else {
                                                                                                                                                                                                            error_made("Need last one value for 'cutspace'.", args[2]);
                                                                                                                                                                                                        }
                                                                                                                                                                                                    } else {
                                                                                                                                                                                                        if (line.indexOf("[__float__]") != -1){
                                                                                                                                                                                                        auto hj = regex(`: (\S+)`);
                                                                                                                                                                                                        auto mj = match(line, hj);
                                                                                                                                                                                                        if (!mj.empty){
                                                                                                                                                                                                            auto mol = regex(`\+ (\S+)`);
                                                                                                                                                                                                            auto mlk = match(line, mol);
                                                                                                                                                                                                            if (!mlk.empty){
                                                                                                                                                                                                                        try {
                                                                                                                                                                                                                            global_float = to!float(global_float) + to!float(mlk.captures[1]);
                                                                                                                                                                                                                        } catch (Exception e){
                                                                                                                                                                                                                            error_made("maybe you not put number in [@]?", args[2]);
                                                                                                                                                                                                                        }
                                                                                                                                                                                                            } else {
                                                                                                                                                                                                                    auto meam = regex(`\- (\S+)`);
                                                                                                                                                                                                                    auto kmk = match(line, meam);
                                                                                                                                                                                                                    if (!kmk.empty){
                                                                                                                                                                                                                        try {
                                                                                                                                                                                                                            global_float = to!float(global_float) - to!float(kmk.captures[1]);
                                                                                                                                                                                                                        } catch (Exception e){
                                                                                                                                                                                                                            error_made("maybe you not put number in [@]?", args[2]);
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                    } else {
                                                                                                                                                                                                                    auto __mosali__ = regex(`\\ (\S+)`);
                                                                                                                                                                                                                    auto __mosalidictator__ = match(line, __mosali__);
                                                                                                                                                                                                                    if (!__mosalidictator__.empty){
                                                                                                                                                                                                                        try {
                                                                                                                                                                                                                            global_float = to!float(global_float) / to!float(__mosalidictator__.captures[1]);
                                                                                                                                                                                                                        } catch (Exception e){
                                                                                                                                                                                                                            error_made("maybe you not put number in [@]?", args[2]);
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                    } else {
                                                                                                                                                                                                                        auto mjmj = regex(`\* (\S+)`);
                                                                                                                                                                                                                        auto runinmyhead = match(line, mjmj);
                                                                                                                                                                                                                        if (!runinmyhead.empty){
                                                                                                                                                                                                                            global_float = to!float(global_float) * to!float(runinmyhead.captures[1]);
                                                                                                                                                                                                                        } else {
                                                                                                                                                                                                                            global_float = to!float(mj.captures[1]);
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                    }
                                                                                                                                                                                                                }
                                                                                                                                        
                                                                                                                                                                                                            }
                                                                                                                                                                                                        } else {
                                                                                                                                                                                                            error_made("Syntex error, Need string to save at Global Number as value of it.", args[2]);
                                                                                                                                                                                                        }
                                                                                                                                                                                                        } else {
                                                                                                                                                                                                            if (line.indexOf("fcd") != -1){
                                                                                                                                                                                                                auto m = regex(`fcd (\S+)`);
                                                                                                                                                                                                                auto m2 = match(line, m);
                                                                                                                                                                                                                if (!m2.empty){
                                                                                                                                                                                                                    if (__eqube__ == 0){
                                                                                                                                                                                                                        if (exists(m2.captures[1] ~ ".g")){
                                                                                                                                                                                                                            system(toStringz("glang -c " ~ m2.captures[1] ~ ".g"));
                                                                                                                                                                                                                        } else {
                                                                                                                                                                                                                            error_made("FileSystem ERORR, Cannot read file " ~ m2.captures[1] ~ ".g" ~ " File is not exists.", args[2]);
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                
                                                                                                                                                                                                                    }
                                                                                                                                                                                                                } else {
                                                                                                                                                                                                                    error_made("Need last one value for 'flxd'.", args[2]);
                                                                                                                                                                                                                }
                                                                                                                                                                                                            } else {
                                                                                                                                                                                                                if (line.indexOf("get_n") != -1){
                                                                                                                                                                                                                    auto mj = regex(`get_n (\S+)`);
                                                                                                                                                                                                                    auto mjg = match(line, mj);
                                                                                                                                                                                                                    if (string_add == 1){
                                                                                                                                                                                                                        if (!mjg.empty){
                                                                                                                                                                                                                            if (mjg.captures[1] == "%" ~ custom_value[2]){
                                                                                                                                                                                                                                custom_value[1] = get_n();
                                                                                                                                                                                                                            } else {
                                                                                                                                                                                                                                if (mjg.captures[1] == "%" ~ custom_value[4]){
                                                                                                                                                                                                                                    custom_value[3] = get_n();
                                                                                                                                                                                                                                } else {
                                                                                                                                                                                                                                    if (mjg.captures[1] == "%" ~ custom_value[6]){
                                                                                                                                                                                                                                        custom_value[5] = get_n();
                                                                                                                                                                                                                                    } else {
                                                                                                                                                                                                                                        if (mjg.captures[1] == "%" ~ custom_value[8]){
                                                                                                                                                                                                                                            custom_value[7] = get_n();
                                                                                                                                                                                                                                        } else {
                                                                                                                                                                                                                                            if (mjg.captures[1] == "%" ~ custom_value[10]){
                                                                                                                                                                                                                                                custom_value[9] = get_n();
                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                }
                                                                                                                                                                                                                            }
                                                                                                                                                                                                                        } else {
                                                                                                                                                                                                                            global = get_n();
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                    } else {
                                                                                                                                                                                                                        error_made("cannot found 'usrln', maybe 'glue string' is need?", args[2]);
                                                                                                                                                                                                                    }
                                                                                                                                                                                                                } else {
                                                                                                                                                                                                                    if (line.indexOf("flex") != -1){
                                                                                                                                                                                                                        if (exists(global)){
                                                                                                                                                                                                                            __eqube__ = 1;
                                                                                                                                                                                                                        } else {
                                                                                                                                                                                                                            __eqube__ = 0;
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                    } else {
                                                                                                                                                                                                                        if (line.indexOf("fcolor") != -1){
                                                                                                                                                                                                                            if (g_color_add == 1){
                                                                                                                                                                                                                                auto mk = regex(`fcolor (\S+)`);
                                                                                                                                                                                                                                auto mk2 = match(line, mk);
                                                                                                                                                                                                                                if (!mk2.empty){
                                                                                                                                                                                                                                    if (mk2.captures[1] == "__gcolor__:lightgreen"){
                                                                                                                                                                                                                                        write("\033[32m");
                                                                                                                                                                                                                                    } else {
                                                                                                                                                                                                                                        if (mk2.captures[1] == "__gcolor__:system"){
                                                                                                                                                                                                                                            write("\033[0m");
                                                                                                                                                                                                                                        } else {
                                                                                                                                                                                                                                            if (mk2.captures[1] == "__gcolor__:blue"){
                                                                                                                                                                                                                                                write("\033[34m");
                                                                                                                                                                                                                                            } else {
                                                                                                                                                                                                                                                if (mk2.captures[1] == "__gcolor__:custom"){
                                                                                                                                                                                                                                                    auto kj = regex(`__gcolor__:custom (\S+)`);
                                                                                                                                                                                                                                                    auto kj2 = match(line, kj);
                                                                                                                                                                                                                                                    if (!kj2.empty){
                                                                                                                                                                                                                                                        write("\033[" ~ kj2.captures[1] ~ "m");
                                                                                                                                                                                                                                                    } else {
                                                                                                                                                                                                                                                        error_made("'gcolor.fcolor' : need a value for custom mode." ,args[2]);
                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                } else {
                                                                                                                                                                                                                                                    if (mk2.captures[1] == "__gcolor__:red"){
                                                                                                                                                                                                                                                        write("\033[91m");
                                                                                                                                                                                                                                                    } else {
                                                                                                                                                                                                                                                        if (mk2.captures[1] == "__gcolor:black"){
                                                                                                                                                                                                                                                            write("\033[30m");
                                                                                                                                                                                                                                                        } else {
                                                                                                                                                                                                                                                            if (mk2.captures[1] == "__gcolor__:yellow"){
                                                                                                                                                                                                                                                                write("\033[33m");
                                                                                                                                                                                                                                                            } else {
                                                                                                                                                                                                                                                                if (mk2.captures[1] == "__gcolor__:cyan"){
                                                                                                                                                                                                                                                                    write("\033[36m");
                                                                                                                                                                                                                                                                } else {
                                                                                                                                                                                                                                                                    error_made("unknown value for fcolor " ~ mk2.captures[1], args[2]);
                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                } else {
                                                                                                                                                                                                                                    error_made("Need last one value for 'fcolor'.", args[2]);
                                                                                                                                                                                                                                }
                                                                                                                                                                                                                            } else {
                                                                                                                                                                                                                                error_made("FUZE ERROR, unknown header 'gcolor' and 'fcolor', maybe glue fcolor need?", args[2]);
                                                                                                                                                                                                                            }
                                                                                                                                                                                                                        } else {
                                                                                                                                                                                                                            if (line.indexOf("__string__to__int__") != -1 || line.indexOf("%to@") != -1){
                                                                                                                                                                                                                                global_int = to!int(global);
                                                                                                                                                                                                                            } else {
                                                                                                                                                                                                                                if (line.indexOf("__int__to__string__") != -1 || line.indexOf("@to%") != -1){
                                                                                                                                                                                                                                    global = to!string(global_int);
                                                                                                                                                                                                                                } else {
                                                                                                                                                                                                                                    if (line.indexOf("tonext") != -1){
                                                                                                                                                                                                                                        auto aa = regex(`tonext (\S+)`);
                                                                                                                                                                                                                                        auto haa = match(line, aa);
                                                                                                                                                                                                                                        if (!haa.empty){
                                                                                                                                                                                                                                            
                                                                                                                                                                                                                                            auto mk = regex(haa.captures[1] ~ ` (\S+)`);
                                                                                                                                                                                                                                            auto check = match(global, mk);
                                                                                                                                                                                                                                            global = check.captures[1];
                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                    } else {
                                                                                                                                                                                                                                        if (line.indexOf("infbe") != -1){
                                                                                                                                                                                                                                            auto aa = regex(`infbe (\S+)`);
                                                                                                                                                                                                                                            auto haa = match(line, aa);
                                                                                                                                                                                                                                            if (!haa.empty){
                                                                                                                                                                                                                                                if (global.indexOf(haa.captures[1]) != -1){
                                                                                                                                                                                                                                                    __eqube__ = 1; 
                                                                                                                                                                                                                                                } else {
                                                                                                                                                                                                                                                    __eqube__ = 0;
                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                        } else {
                                                                                                                                                                                                                                            if (line.indexOf("raw") != -1){
                                                                                                                                                                                                                                                auto k = regex(`raw (\S+)`);
                                                                                                                                                                                                                                                auto j = match(line, k);
                                                                                                                                                                                                                                                if (!j.empty){
                                                                                                                                                                                                                                                    if (j.captures[1] == "r"){
                                                                                                                                                                                                                                                        auto h = regex(`r (\S+)`);
                                                                                                                                                                                                                                                        auto r = match(line, h);
                                                                                                                                                                                                                                                        if (!r.empty){
                                                                                                                                                                                                                                                            if (exists(r.captures[1])){
                                                                                                                                                                                                                                                                ulong filez = getSize(r.captures[1]);

                                                                                                                                                                                                                                                                ubyte[] fileraww;
                                                                                                                                                                                                                                                                fileraww.length = filez;
                                                                                                                                                                                                                                                                File fs = File(r.captures[1]);

                                                                                                                                                                                                                                                                fs.rawRead(fileraww);
                                                                                                                                                                                                                                                                fs.close();

                                                                                                                                                                                                                                                                global_hex = fileraww;
                                                                                                                                                                                                                                                            } else {
                                                                                                                                                                                                                                                                error_made("FileSystem Error, file or folder " ~ r.captures[1] ~  " is not exists. 'raw'", args[2]);
                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                        } else {
                                                                                                                                                                                                                                                            
                                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                            
                                                                                                                                                                                                                                                                error_made("Need last one value for 'raw' with read mode.", args[2]);

                                                                                                                                                                                                                                                            
                                                                                                                                                                                                                                                            
                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                    } else {
                                                                                                                                                                                                                                                        if (j.captures[1] == "w_hax"){
                                                                                                                                                                                                                                                                auto mkk = regex(`w_hax (\S+)`);
                                                                                                                                                                                                                                                                auto kkk = match(line, mkk);
                                                                                                                                                                                                                                                                if (!k.empty){
                                                                                                                                                                                                                                                                    
                                                                                                                                                                                                                                                                        int kl = to!int(kkk.captures[1]);
                                                                                                                                                                                                                                                                        writef("%X", global_hex[kl]);
                                                                                                                                                                                                                                                                    
                                                                                                                                                                                                                                                                } else {
                                                                                                                                                                                                                                                                    error_made("Need a value (integer) for read by 'raw' at 'w_hax' mode.", args[2]);
                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                        } else {
                                                                                                                                                                                                                                                            error_made("'raw' cant handle " ~ j.captures[1] ~ ", Unknown mode " ~ j.captures[1], args[2]);
                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                            } else {
                                                                                                                                                                                                                                                error_made("'raw' cant handle " ~ j.captures[1] ~ ", unknwon mode " ~ j.captures[1], args[2]);
                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                        } else {
                                                                                                                                                                                                                                            if (line.indexOf("gram") != -1){
                                                                                                                                                                                                                                            auto kkkl = regex(`gram (\S+)`);
                                                                                                                                                                                                                                            auto pppp = match(line, kkkl);
                                                                                                                                                                                                                                            if (!pppp.empty){
                                                                                                                                                                                                                                                if (pppp.captures[1] == "free"){
                                                                                                                                                                                                                                                    foreach_reverse(void* ptr; global_address){
                                                                                                                                                                                                                                                        free(ptr);
                                                                                                                                                                                                                                                        
                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                    global_address.length = 0;
                                                                                                                                                                                                                                                } else {
                                                                                                                                                                                                                                                    int hjh = to!int(pppp.captures[1]);
                                                                                                                                                                                                                                                    void* jkj = malloc(cast(size_t) hjh);
                                                                                                                                                                                                                                                    global_address ~= jkj;
                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                            } else {
                                                                                                                                                                                                                                                error_made("Need last one value for 'gram'.", args[2]);
                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                        } else {
                                                                                                                                                                                                                                            if(line.indexOf("f*addr") != -1){
                                                                                                                                                                                                                                                foreach(void* ptr; global_address){
                                                                                                                                                                                                                                                    writeln(ptr);
                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                            } else {
                                                                                                                                                                                                                                                if (line.indexOf("@_faddr") != -1){
                                                                                                                                                                                                                                                    auto kkp = regex(`\@_faddr (\S+)`);
                                                                                                                                                                                                                                                    auto kj = match(line, kkp);
                                                                                                                                                                                                                                                    if (!kj.empty){
                                                                                                                                                                                                                                                        int index = to!int(kj.captures[1]);
                                                                                                                                                                                                                                                        if (index >= 0 && index < cast(int)global_address.length){
                                                                                                                                                                                                                                                        int kg = to!int(kj.captures[1]);
                                                                                                                                                                                                                                                        int cd = *(cast(int*)global_address[index]);
                                                                                                                                                                                                                                                        
                                                                                                                                                                                                                                                        write(cd);
                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                    } else {
                                                                                                                                                                                                                                                        error_made("Need last one value for 'faddr' type int.", args[2]);
                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                } else {
                                                                                                                                                                                                                                                    if (line.indexOf("[@*__address__]") != -1){
                                                                                                                                                                                                                                                        auto kjj = regex(`: (\S+)`);
                                                                                                                                                                                                                                                        auto hhd = match(line, kjj);
                                                                                                                                                                                                                                                        if (!hhd.empty){
                                                                                                                                                                                                                                                            void* target = global_address[$-1];
                                                                                                                                                                                                                                                            int ff = to!int(hhd.captures[1]);
                                                                                                                                                                                                                                                            *(cast(int*)target) = ff;
                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                    } else {
                                                                                                                                                                                                                                                        if (line.indexOf("[__bi__]") != -1){
                                                                                                                                                                                                                                                            auto kk = regex(`: (\S+)`);
                                                                                                                                                                                                                                                            auto srev = match(line, kk);
                                                                                                                                                                                                                                                            if (!srev.empty){
                                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                                global_mpf = BigInt(srev.captures[1]);
                                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                                    //error_made("Need value for '__df__' type values.", args[2]);
                                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                            } else {
                                                                                                                                                                                                                                                                error_made("Need count of byte for use in __df__ type.", args[2]);
                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                        } else {
                                                                                                                                                                                                                                                            if (line.indexOf("[__rea__]") != -1){
                                                                                                                                                                                                                                                                auto jdj = regex(`: (\S+)`);
                                                                                                                                                                                                                                                                auto hfg = match(line, jdj);
                                                                                                                                                                                                                                                                if (!hfg.empty){
                                                                                                                                                                                                                                                                   
                                                                                                                                                                                                                                                                        global_real = to!real(hfg.captures[1]);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        global_real = to!real(to!real(hfg.captures[1]));
                                                                                                                                                                                                                                                                } else {
                                                                                                                                                                                                                                                                    error_made("Need last one value for '__rea__'.", args[2]);
                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                            } else {
                                                                                                                                                                                                                                                                if (line.indexOf("rea_add") != -1){
                                                                                                                                                                                                                                                                    auto yuy = regex(`rea_add (\S+)`);
                                                                                                                                                                                                                                                                    auto hdg = match(line, yuy);
                                                                                                                                                                                                                                                                    if (!hdg.empty){
                                                                                                                                                                                                                                                                        global_real = global_real + to!real(hdg.captures[1]);
                                                                                                                                                                                                                                                                    } else {
                                                                                                                                                                                                                                                                        error_made("Need last one value for 'rea_add'", args[2]);
                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                } else {
                                                                                                                                                                                                                                                                    if (line.indexOf("becho") != -1){

                                                                                                                                                                                                                                                                        write("\033[1m");
                                                                                                                                                                                                                                                                    } else {
                                                                                                                                                                                                                                                                        if (line.indexOf("gserial") != -1){
                                                                                                                                                                                                                                                                            if (serial_add == 1){
                                                                                                                                                                                                                                                                                auto hg = regex(`gserial "(.*?)"`);
                                                                                                                                                                                                                                                                                auto egd = match(line, hg);
                                                                                                                                                                                                                                                                                if (!egd.empty){
                                                                                                                                                                                                                                                                                    //global_port = new SerialPort(egd);
                                                                                                                                                                                                                                                                                    global_port = File(egd.captures[1], "a");
                                                                                                                                                                                                                                                                                } else {
                                                                                                                                                                                                                                                                                    error_made("Need last one serial value for 'serial'", args[2]);
                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                        } else {
                                                                                                                                                                                                                                                                            if (line.indexOf("end") != -1){
                                                                                                                                                                                                                                                                                if (serial_add == 1){
                                                                                                                                                                                                                                                                                    global_port.close();
                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                            } else {
                                                                                                                                                                                                                                                                                if (line.indexOf("send") != -1){
                                                                                                                                                                                                                                                                                    if (serial_add == 1){

                                                                                                                                                                                                                                                                                    
                                                                                                                                                                                                                                                                                    auto djj = regex(`send "(.*?)"`);
                                                                                                                                                                                                                                                                                    auto hfgd = match(line, djj);
                                                                                                                                                                                                                                                                                    if (!hfgd.empty){
                                                                                                                                                                                                                                                                                        
                                                                                                                                                                                                                                                                                        global_port.write(hfgd.captures[1] ~ "\n");
                                                                                                                                                                                                                                                                                        global_port.flush();

                                                                                                                                                                                                                                                                                    } else {
                                                                                                                                                                                                                                                                                        error_made("Need last one string value for 'send'.", args[2]);
                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                    
                                                                                                                                                                                                                                                                                } else {
                                                                                                                                                                                                                                                                                    if (line.indexOf("sharedloader") != -1){
                                                                                                                                                                                                                                                                                         auto __libname__ = regex(`sharedloader (\S+)`);
                                                                                                                                                                                                                                                                                         auto libname__ = match(line, __libname__);
                                                                                                                                                                                                                                                                                         if (!libname__.empty){
                                                                                                                                                                                                                                                                                            //void* handle = dlopen(libname__.captures[1].idup.toStringz, RTLD_LAZY);
                                                                                                                                                                                                                                                                                            void* handle = dlopen(libname__.captures[1].idup.toStringz, RTLD_LAZY);
                                                                                                                                                                                                                                                                                            if (handle == null) {
                                                                                                                                                                                                                                                                                                error_made("Error loading shared library, " ~ libname__.captures[1] , args[2]);

                                                                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                                                             }
                                                                                                                                                                                                                                                                                             auto __funcname__ = regex(libname__.captures[1] ~ ` (\S+)`);
                                                                                                                                                                                                                                                                                             auto funcname__ = match(line, __funcname__);
                                                                                                                                                                                                                                                                                             if (!funcname__.empty){
                                                                                                                                                                                                                                                                                                //void* ptr = dlsym(handle, funcname__.captures[1].idup.toStringz);
                                                                                                                                                                                                                                                                                                void* ptr = dlsym(handle, funcname__.captures[1].idup.toStringz);
                                                                                                                                                                                                                                                                                                if (ptr == null) {
                                                                                                                                                                                                                                                                                                    error_made("cannot found any function called" ~ funcname__.captures[1] , args[2]);


        
                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                auto mode = regex(funcname__.captures[1] ~ ` (\S+)`);
                                                                                                                                                                                                                                                                                                auto mode1 = match(line, mode);
                                                                                                                                                                                                                                                                                                if (!mode1.empty){
                                                                                                                                                                                                                                                                                                    if (mode1.captures[1] == "%"){
                                                                                                                                                                                                                                                                                                        //myFunction = cast(typeof(myFunction))ptr;
                                                                                                                                                                                                                                                                                                        myFunction = cast(typeof(myFunction))ptr;
                                                                                                                                                                                                                                                                                                //myFunction(toStringz(global.idup));
                                                                                                                                                                                                                                                                                                        myFunction(toStringz(global.idup));
                                                                                                                                                                                                                                                                                                        dlclose(handle);
                                                                                                                                                                                                                                                                                                    } else {
                                                                                                                                                                                                                                                                                                    //myFunction = cast(typeof(myFunction))ptr;
                                                                                                                                                                                                                                                                                                        myFunction = cast(typeof(myFunction))ptr;
                                                                                                                                                                                                                                                                                                        myFunction(toStringz(mode1.captures[1].idup));
                                                                                                                                                                                                                                                                                                        dlclose(handle);
                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                } else {
                                                                                                                                                                                                                                                                                                    myFunc = cast(typeof(myFunc))ptr;
                                                                                                                                                                                                                                                                                                    myFunc();
                                                                                                                                                                                                                                                                                                    dlclose(handle);
                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                

                                                                                                                                                                                                                                                                                             }
                                                                                                                                                                                                                                                                                             

                                                                                                                                                                                                                                                                                         } else {
                                                                                                                                                                                                                                                                                            error_made("Cannot found any shared library.", args[2]);

                                                                                                                                                                                                                                                                                         }
                                                                                                                                                                                                                                                                                    }  else {
                                                                                                                                                                                                                                                                                 if (line.indexOf("condition") != -1){
                                                                                                                                                                                                                                                                                    auto valueforint = regex(`condition (\S+)`);
                                                                                                                                                                                                                                                                                    auto shoravi = match(line, valueforint);
                                                                                                                                                                                                                                                                                    if (!shoravi.empty){
                                                                                                                                                                                                                                                                                        auto hygf = regex(shoravi.captures[1] ~ ` (\S+)`);
                                                                                                                                                                                                                                                                                        auto stallin = match(line, hygf);
                                                                                                                                                                                                                                                                                        if (!stallin.empty){
                                                                                                                                                                                                                                                                                            if (shoravi.captures[1] == ">"){
                                                                                                                                                                                                                                                                                                if (global_int > to!int(stallin.captures[1])){
                                                                                                                                                                                                                                                                                                    __eqube__ = 1;
                                                                                                                                                                                                                                                                                                } else {
                                                                                                                                                                                                                                                                                                    __eqube__ = 0;
                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                            } else if (shoravi.captures[1] == "<"){
                                                                                                                                                                                                                                                                                                if (global_int < to!int(stallin.captures[1])){
                                                                                                                                                                                                                                                                                                    __eqube__ = 1;
                                                                                                                                                                                                                                                                                                } else {
                                                                                                                                                                                                                                                                                                    __eqube__ = 0;
                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                            } else if(shoravi.captures[1] == "::"){
                                                                                                                                                                                                                                                                                                if (global_int == to!int(stallin.captures[1])){
                                                                                                                                                                                                                                                                                                    __eqube__ = 1;
                                                                                                                                                                                                                                                                                                } else {
                                                                                                                                                                                                                                                                                                    __eqube__ = 0;
                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                            } else {
                                                                                                                                                                                                                                                                                                error_made("cannot found any " ~ shoravi.captures[1] ~ " for 'condition'.", args[2]);
                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                        } else {
                                                                                                                                                                                                                                                                                            error_made("cannot use 'condition' as empty index.", args[2]);
                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                        
                                                                                                                                                                                                                                                                                    } else {
                                                                                                                                                                                                                                                                                        error_made("Need last two value for 'condition'.", args[2]);
                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                } else {
                                                                                                                                                                                                                                                                                    if (line.indexOf("http") != -1){
                                                                                                                                                                                                                                                                                    auto port = regex(`http (\S+)`);
                                                                                                                                                                                                                                                                                    auto port2 = match(line, port);
                                                                                                                                                                                                                                                                                    if (!port2.empty){
                                                                                                                                                                                                                                                                                        auto content = readText("index.html");
                                                                                                                                                                                                                                                                                         string bash_script = 
        "while true; do\n" ~
        "    echo -e \"HTTP/1.1 200 OK\\r\\n" ~
        "Content-Type: text/html\\r\\n" ~
        "Content-Length: " ~ to!string(content.length) ~ "\\r\\n" ~
        "\\r\\n" ~
        content ~ "\" | \n" ~
        "    timeout 1 nc -l -p " ~ port2.captures[1] ~ " -q 1 2>/dev/null || true\n" ~
        "done";
        
                                                                                                                                                                                                                                                                                        system(toStringz(bash_script));
                                                                                                                                                                                                                                                                                    } else {
                                                                                                                                                                                                                                                                                        error_made("Need last one value for 'http'.", args[2]);
                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                } else if(line.indexOf("file.sizeof") != -1){ // get size of file and return it in global string
                                                                                                                                                                                                                                                                                    auto _satari_ = regex(`file.sizeof "(.*?)"`);
                                                                                                                                                                                                                                                                                    auto _satari2_ = match(line, _satari_);
                                                                                                                                                                                                                                                                                    if (!_satari2_.empty){
                                                                                                                                                                                                                                                                                        // now here we have file name lets first check if file be or not for safty.
                                                                                                                                                                                                                                                                                        if (exists(_satari2_.captures[1])){
                                                                                                                                                                                                                                                                                            // now we sure it be.
                                                                                                                                                                                                                                                                                            // lets get it size and return it in global string.
                                                                                                                                                                                                                                                                                            global = to!string(getSize(_satari2_.captures[1]));

                                                                                                                                                                                                                                                                                        } else {
                                                                                                                                                                                                                                                                                            error_made("FileSystem ERROR, cannot find " ~ _satari2_.captures[1], args[2]);
                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                } else {
                                                                                                                                                                                                                                                                                if(line.indexOf("file.mod") != -1){ // get times modif etc of file.
                                                                                                                                                                                                                                                                                    auto _baktiari = regex(`file.mod "(.*?)"`); // get value
                                                                                                                                                                                                                                                                                    auto _baktiari2 = match(line, _baktiari); // if it be in line
                                                                                                                                                                                                                                                                                    if (!_baktiari2.empty){ // check if developer give value
                                                                                                                                                                                                                                                                                        if (exists(_baktiari2.captures[1])){
                                                                                                                                                                                                                                                                                            getTimes(_baktiari2.captures[1], accessTime, modificationTime);
                                                                                                                                                                                                                                                                                            global = to!string(modificationTime);
                                                                                                                                                                                                                                                                                        } else {
                                                                                                                                                                                                                                                                                            error_made("FileSystem ERROR, cannot find " ~ _baktiari2.captures[1], args[2]);
                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                        
                                                                                                                                                                                                                                                                                    } else {
                                                                                                                                                                                                                                                                                        error_made("Need last one value for 'file.modif'.", args[2]);
                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                } else if (line.indexOf("file.copy") != -1){
                                                                                                                                                                                                                                                                                    
                                                                                                                                                                                                                                                                                         auto vaued = regex(`file.copy "(.*?)"`);
                                                                                                                                                                                                                                                                                         auto vaued2 = match(line, vaued);
                                                                                                                                                                                                                                                                                         if (!vaued2.empty){
                                                                                                                                                                                                                                                                                            auto fc26 = regex("\"" ~ vaued2.captures[1] ~ "\"" ~ ` "(.*?)"`);
                                                                                                                                                                                                                                                                                            auto fc25 = match(line, fc26);
                                                                                                                                                                                                                                                                                            if (!fc25.empty){
                                                                                                                                                                                                                                                                                                if (exists(vaued2.captures[1])){
                                                                                                                                                                                                                                                                                                    if (exists(fc25.captures[1])){
                                                                                                                                                                                                                                                                                                        system(toStringz("cp " ~ vaued2.captures[1] ~ " " ~ fc25.captures[1]));

                                                                                                                                                                                                                                                                                                    } else {
                                                                                                                                                                                                                                                                                                        error_made("FileSystem ERROR, cannot find " ~ fc25.captures[1], args[2]);
                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                    
                                                                                                                                                                                                                                                                                                } else {
                                                                                                                                                                                                                                                                                                    error_made("FileSystem ERROR, cannot find " ~ vaued2.captures[1], args[2]);
                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                            } else {
                                                                                                                                                                                                                                                                                                error_made("Need last two value for 'file.copy'", args[2]);
                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                            
                                                                                                                                                                                                                                                                                         } else {
                                                                                                                                                                                                                                                                                            error_made("Need last two value for 'file.copy'.", args[2]);
                                                                                                                                                                                                                                                                                         }
                                                                                                                                                                                                                                                                                    

                                                                                                                                                                                                                                                                                } else if (line.indexOf("file.delete") != -1){
                                                                                                                                                                                                                                                                                    auto yftr = regex(`file.delete "(.*?)"`);
                                                                                                                                                                                                                                                                                    auto yfter2 = match(line, yftr);
                                                                                                                                                                                                                                                                                    if (!yfter2.empty){
                                                                                                                                                                                                                                                                                        if (exists(yfter2.captures[1])){
                                                                                                                                                                                                                                                                                            remove(yfter2.captures[1]);
                                                                                                                                                                                                                                                                                        } else {
                                                                                                                                                                                                                                                                                            error_made("FileSystem ERROR, File " ~ yfter2.captures[1] ~ " dosent exists.", args[2]);
                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                    } else {
                                                                                                                                                                                                                                                                                        error_made("Need last one value for 'file.delete'.", args[2]);
                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                } else if(line.indexOf("file.mv") != -1){
                                                                                                                                                                                                                                                                                    auto f = regex(`file.mv "(.*?)"`);
                                                                                                                                                                                                                                                                                    auto f2 = match(line, f);
                                                                                                                                                                                                                                                                                    if (!f2.empty){
                                                                                                                                                                                                                                                                                        auto gd = regex("\"" ~ f2.captures[1] ~ "\"" ~ ` "(.*?)"`);
                                                                                                                                                                                                                                                                                        auto gd2 = match(line, gd);
                                                                                                                                                                                                                                                                                        if (!gd2.empty){
                                                                                                                                                                                                                                                                                            if (exists(f2.captures[1])){
                                                                                                                                                                                                                                                                                                // problom : i forget add captures . rename(f2, gd2);
                                                                                                                                                                                                                                                                                                /*
                                                                                                                                                                                                                                                                                                   source/app.d(1835,304): Error: undefined identifier gd2, did you mean variable gd?
                                                                                                                                                                                                                                                                                                   ....
                                                                                                                                                                                                                                                                                                */
                                                                                                                                                                                                                                                                                                rename(f2.captures[1], gd2.captures[1]);
                                                                                                                                                                                                                                                                                            } else {
                                                                                                                                                                                                                                                                                                error_made("FileSystem ERROR, file " ~ f2.captures[1] ~ " or maybe dest " ~ gd2.captures[1], args[2]);
                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                        } else {
                                                                                                                                                                                                                                                                                            error_made("Need last two value for 'file.mv'.", args[2]);
                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                    } else {
                                                                                                                                                                                                                                                                                        error_made("Need last two value for 'file.mv'.", args[2]);
                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                } else if (line.indexOf("file.lockit") != -1){
                                                                                                                                                                                                                                                                                    auto nf = regex(`file.lockit "(.*?)"`);
                                                                                                                                                                                                                                                                                    auto nf2 = match(line, nf);
                                                                                                                                                                                                                                                                                    if (!nf2.empty){
                                                                                                                                                                                                                                                                                        if (exists(nf2.captures[1])){
                                                                                                                                                                                                                                                                                            global_point_toingfile = File(nf2.captures[1], "r");
                                                                                                                                                                                                                                                                                            global_point_toingfile.lock();
                                                                                                                                                                                                                                                                                        } else {
                                                                                                                                                                                                                                                                                            error_made("FileSystem ERROR, cannot find " ~ nf2.captures[1], args[2]);
                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                    } else {
                                                                                                                                                                                                                                                                                        error_made("Need last one value for 'file.lockit'.", args[2]);
                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                } else if(line.indexOf("file.unlockit") != -1){
                                                                                                                                                                                                                                                                                    global_point_toingfile.unlock();
                                                                                                                                                                                                                                                                                } else if(line.indexOf("file.chmod") != -1){
                                                                                                                                                                                                                                                                                    auto f = regex(`file.chmod "(.*?)"`);
                                                                                                                                                                                                                                                                                    auto f2 =  match(line, f);
                                                                                                                                                                                                                                                                                    if (!f2.empty){
                                                                                                                                                                                                                                                                                        if (exists(f2.captures[1])){
                                                                                                                                                                                                                                                                                            auto modet = regex(f2.captures[1] ~ ` (\S+)`);
                                                                                                                                                                                                                                                                                            auto modet2 = match(line, modet);
                                                                                                                                                                                                                                                                                            if (!modet.empty){
                                                                                                                                                                                                                                                                                                system(toStringz("chmod " ~ modet2.captures[1] ~ " " ~ f2.captures[1]));
                                                                                                                                                                                                                                                                                            } else {
                                                                                                                                                                                                                                                                                                error_made("Need last two value for 'file.chmod'.", args[2]);
                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                        } else {
                                                                                                                                                                                                                                                                                            error_made("Filesystem ERROR, file " ~ f2.captures[1] ~ " dosent exsits.", args[2]);
                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                    
                                                                                                                                                                                                                                                                                

                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                            }

                                                                                                                                                                                                                                                                                        
                                                                                                                                                                                                                                                                                        
                                                                                                                                                                                                                                                                                    
                                                                                                                                                                                                                                                                                    
                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                    } 
                                                                                                                                                                                                                                }
                                                                                                                                                                                                                            }
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                    }
                                                                                                                                                                                                                }
                                                                                                                                                                                                            }
                                                                                                                                                                                                        }
                                                                                                                                                                                                    }
                                                                                                                                                                                                

                                                                                                                                                                                                }
                                                                                                                                                                                            }
                                                                                                                                                                                                
                                                                                                                                                                                            
                                                                                                                                                                                        }
                                                                                                                                                                                    }
                                                                                                                                                                                }

                                                                                                                                                                            }
                                                                                                                                                                        }
                                                                                                                                                                    }
                                                                                                                                                                }
                                                                                                                                                            }
                                                                                                                                                        }
                                                                                                                                                    }
                                                                                                                                                }
                                                                                                                                                }
                                                                                                                                            }
                                                                                                                                            }
                                                                                                                                        }
                                                                                                                                    }
                                                                                                                                }
                                                                                                                            }
                                                                                                                             
                                                                                                                        }
                                                                                                                    }
                                                                                                                }
                                                                                                            }
                                                                                                        }
                                                                                                    }
                                                                                                }
                                                                                            }
                                                                                        }
                                                                                   }   }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                            
                                                        }
                                                        if (__endbe_exit__ == 1){
                                                            auto regex_of_exit = regex(`std.end: exit (\S+)`);
                                                            auto _exit_value_ = match(endline, regex_of_exit);
                                                            if (!_exit_value_.empty){
                                                                if (_exit_value_.captures[1] == "E"){
                                                                    exit(1);
                                                                } else {
                                                                    if (_exit_value_.captures[1] == "N"){
                                                                        exit(0);
                                                                    } else {
                                                                        write(RED, "\033[1m" ~ args[2] ~ ":", RESET);
                                                                        write(" Cannot pass this value at exit function.\n");
                                                                        exit(1);
                                                                    }
                                                                }
                                                            }
                                                        } else {
                                                                if (__endbe_exit__ != 1){
                                                                    write(RED, "\033[1m" ~ args[2] ~ ":", RESET);
                                                                    write(" Faild To find end point for " ~ args[1] ~ " or not exit set.\n");
                                                                    exit(1);
                                                                }
                                                        }
                                                    }
                                                }
                                            } else {
                                            write(RED, "\033[1mGSSS : ", RESET);
                                            write(args[2] ~ " File not exists.\n");
                                            writeln("Compile faild.");
                                            exit(1);
                                        }
                                    } catch (Exception e) {
                                        write(RED, "\033[1mGSSS :", RESET);
                                        write(" Faild To read file : " ~ args[2] ~ "\n");
                                        writeln(to!string(e));
                                        writeln("Compile faild.");
                                        exit(1);
                                    }
                                } 
                            }
                        }
                    } 
                }
            }
        }
    }
    
