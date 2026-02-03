# The G Programming Language : Book
Written by Pouya Mohammadi

> This book uses v5.7.6 of the glang interpreter. Please see ![this page](https://github.com/glang/doc/the-g-programming-language-book/last.pdf) to get the latest version of this book.

> This is the English version of this book

# Introduction
We all know that nowadays finding a programming language that is both simple and efficient has become difficult, even impossible. The story starts exactly from here. G is a language that tries to maintain ease of use, small size (minimalism), data protection, and more.

Of course, building such a thing has taken a lot of time, but now G can really find a large and special place in the world of programming languages.

Here I thank Walter Bright for the advice he gave me, and I always try to follow them.


# Section 1 \ Getting Started

Let's start by installing G - a process that is neither time-consuming nor lengthy (well, only for G!)

So we have two methods for installing G:
> I haven't yet created compiled binary versions for other architectures at the time of writing this book. Only one architecture is supported: x86 64-bit.

The first method, which is also the simplest, is installing the binary.
The second method is compiling from source.

In the first method, we simply go to the website ![glang](https://glang.ct.ws/) and click on the download button (that nice button full of CSS) which takes us to the GitHub page and G's releases. We click on the file named "glang" to download it.

This file is a binary, and after downloading it, we need to give it execution permissions with the command:
```bash
chmod +x glang
```
We give permission to the binary file, which is kind of like telling the system: "Hey! This is an executable file."

Then we simply run it with ‍‍```./glang -v```

Okay, only one thing remains - we need to move it to the /usr/bin folder so we can use it everywhere with this command:

```bash
sudo cp glang /usr/bin
```
This part of our work is done too.
Because access to this folder isn't possible for regular users like you and me, we use sudo.

Okay, that was our easy method up to this point.
But as I said, sometimes it's necessary to run G on another platform with a different architecture, or the binary version is old and you want access to a newer version.

So if you're in the second category (old binary version), please tell us in the GitHub issue section.

Okay, let's move on to compilation.

First of all, we need the source code. For this, we can use git:

‍‍‍```bash
git clone https://github.com/pouyathe/glang
```
Okay, with the above code, a folder named "glang" is created with everything in it.
Let's enter that folder:
```bash
cd glang/
```
Okay, don't be scared! Yes, this place is full of files, let's ignore them and go to the source folder.
```bash
cd source
```
Okay, here we come to choices. The cmake section isn't complete yet at the time I'm writing this book, but the dub section is the best and most up-to-date one.
oda is a project manager and builder that I wrote myself. If you use that, you just need to download the glang_foroda.oda file.

As I said, cmake isn't complete yet, so I'll use dub.

Okay, let's go to the dub folder:
```bash
cd dub
```
Now it's enough that dmd is installed on our system. If it's not, download it from your linux package manager.

Because G is written in D, it needs to be compiled with D itself.

After installing dmd and dub, in the "dub" folder, write the following script: ```dub```
This command does the compilation work for you and then gives you the G language binary file.
And if you want, you can move it to /usr/bin to have access to it from everywhere.

## Section 2 / Sections

Now that you've successfully installed G and made sure it works, it's time to tell you a bit about G.

The G interpreter follows a specific rule that I wrote and named "Clean and Simple Code".

This is how it works: the interpreter only looks for one thing - the code section.

Let me explain it better for you. If you've written assembly, you know that in assembly, a file consists of sections.

When I was working on a 16-bit real-mode operating system, my assembly file consisted of 2 sections: the code section and the data section. In 16-bit, reserved memory was in the data section, and data were the strings, with the difference that you had to put a zero at the end to indicate the end of the string because the assembler wouldn't understand where the string ends and where it should stop.

Just like that assembly, G files are the same way, but only with the code section being created.

Why do I say only one section? Because in G, you can't both create a function or, in other words, you can't have both a code section and a function section.

Either that file should be an executable file or only a function file.

And in each file, only 1 function can be created, which also makes the project more readable (we don't need to read a file consisting of thousands of functions to find that function) and also makes G files have a very small size.

Let's get into the practical section.
Okay, our rule is that first we need to learn how to create a section so the interpreter understands it.
2. How to tell the interpreter what to do after finishing that section.

Defining a section is very simple, but we need to know some rules:
1. The interpreter only reads standard sections, meaning we need to tell the interpreter: "The interpreter's goal is only to pass through this file, but I need to get its attention."
   This reminds me of interrupts in the CPU - in the processor, there's a lot of other work happening, and with an interrupt, you say: "Hey, wait! Do my job first, then do whatever you want."
2. After reading that section, the interpreter doesn't know what to do. We need to tell it what to do.
3. The interpreter only reads code in the code section. Code in the function section doesn't get executed for this reason.

Okay, so how do we create a standard section? Well, since G is an easy language, this isn't difficult either!

1. All standard sections start with ‍‍‍```std.<section type> ```
   > Note: As you yourself have noticed, creating custom sections isn't possible. Sometimes if you create one, it's either an error or that section simply won't be read. In other words, the interpreter is lazy and just wants to pass through the file, and if there's a code section, it gets its attention.

2. All standard sections must end with ‍‍```std.exit``` and then you need to tell the interpreter what to do.
   > You can only exit with a program whose code section has finished, either with error or without error.

Okay, let's see an example:
```g
std.main:
    std.echo "Hi"
    ln
std.end: exit N
```
Okay, as you saw, starting to write each section begins with ":".
And you see that std.end itself is, in a way, a separate section for itself, but it uses lambda syntax (writing everything in one line).

And I can only do one thing after finishing the code section. As I said, the interpreter is lazy and won't waste its time on a section to call its file's data input/output tools, etc. again. But it only does one thing in the last section: exit the program.

N is our Normal, meaning the program exits without error.
Let me explain this a bit: This gives the terminal the signal that yes, this program had no errors.

The opposite of this is E, which is short for Error.
And it gives the terminal the signal that executing this program had an error.

Let me show you an example for this too:

```g
std.main:
    std.echo "Ho"
    ln
std.end: exit E
```
Okay, now that we understand this, let's talk about the function section.

First, we need to give a name to that function. In G, its name can be any character (the interpreter is lazy).
And we use ```fn``` both for creating functions and for calling them.

> Maybe you don't know what a function is - no problem! I'm like you. When I was in 7th grade and started programming, I didn't know either!
> Functions are sections of code that save code so we don't need to write them from scratch, and both flexibility and time and code beauty are preserved.
> Imagine I wrote the Pythagorean theorem in G, and now the code is, say, 20 lines, and I have another file that has Pythagorean-related problems. If I define Pythagorean from scratch again, it's both difficult and time-consuming. Instead, I convert it to a function, give it the value, and it returns the answer to me.

Okay, let's give an example of this:
```g
fn hello_func
    std.echo "type your name my friend :"
    glue string
    get_n
    std.echo "Hello "
    fecho %
    ln

```
Maybe you don't know some parts of the code - don't worry! I haven't told you about them yet and don't expect you to learn them now. We'll talk about them later.

Okay, there's one point, which is that the function section doesn't need to be closed because:
1. It's not standard - the interpreter isn't going to read it to execute it.
2. It adds it to the main code like C.

## Section 3 / Data

Okay, let's move to another section of G: data.
Consider that G aims for clean, editable, easy, and reusable code, and its philosophy is exactly this, unlike other languages.

Okay, in total, in G we have several data types:
rea: Our money
int or @: Numbers
%: Text string
float: Decimal numbers
address: Both allocated RAM memory and the address of that memory in RAM (malloc)
bi: Very large numbers
And some libraries have a specific type of data, but mostly it's just a label for one of these same data types.

There's one very important thing that we must know 100% in G: Each data type has a global variable. Some of them are only accessible through this way.

Let's get into this topic a bit more. If you've written assembly, you know there's something called a register that's inside the CPU and has very high speed. G also uses something similar to this, which follows the same philosophy of clean code.

And most functions in G use these global variables.
You'd better use these variables in functions unless you use their label.

Okay, let's proceed with how to define a function:
‍```g
std.main:
    [%] : "Hello world"
    [__rea__] : 0.05
    [__float__] : 1.038
    [__bi__] : 1937937469274836476767577398494759385
    [__string__] : "it will change global string."
    [@] : 17
    [%], 2hi8j : "this not change global string it be new string"
    fecho %
    ln
std.end exit N
```
There's another discussion... Some functions support taking variables, not all of them. For example:
```g
std.echo
```
Doesn't support taking variables, but its brother:
‍‍‍```g
fecho % or std.format.echo %
‍‍‍‍‍```
Only supports taking variables, not taking strings by typing in it.

Okay, as you saw, the name of that variable doesn't matter if you customize it, and it can be anything, which follows G's philosophy of ease.
And besides, not all variables support naming yet.

And for each variable name holder, you can create 10 custom names, not infinite.

As an example, ```get_n``` stores the answer and what it got from the user in the global string variable.

You don't need to define the global variable. It's always defined.

All data can be changed. There's nothing in G currently for limiting strings, meaning all their values can be changed.

And in very long texts, you can't use space and must use _ instead:
```g
std.main:
    [%] : "Hello_to_the_word_of_me_and_you"
    cutspace %
    fecho %
    ln
std.end: exit N
```

## Section 4 \ Math
We arrive at the sweet section of math, which might not be so sweet for some people and more sour or salty! Anyway, let's move on :)

Okay, in G we can perform mathematical operations on two things:
1. Money
2. Numbers

Okay, let's start with the most useful one: numbers.

In G there are always two points:
‍1. Math is always performed on the global variable
2. Each mathematical operation has its own sign and starts from the left

```g
std.main:
    [@] : 2
    [@] : + 1
    [@] : - 1
    [@] : * 3
    [@] : \ 3
    int.echo @
    ln
std.end: exit N
```
```
pouya@pouya-Latitude-E5440:~$ glang -c math.g
2
pouya@pouya-Latitude-E5440:~$ 
````

My answer became 2. You run it too and see what your answer is!

Okay, so we have four operations:
1. +: Addition
2. -: Subtraction
3. *: Multiplication
4. \: Division

> Note: These operations work like this:
> global number + 4
> global number * 2

Now let's talk about money.
In G, there's a special variable for money that makes it excellent for use by banking services.

```g
std.main:
    [__rea__] : 0.3
    rea_add 0.4
    fecho __rea__
    ln
std.end: exit N
```
```
pouya@pouya-Latitude-E5440:~$ glang -c math.g
0.7
pouya@pouya-Latitude-E5440:~$ 

```
Okay, for me it became 0.7 too.
Absolutely, absolutely, absolutely run it yourself to learn.

## Section 5 \ Loops

For now, G is still forming and still doesn't have some things, but I still think it's worth it.

Let's take a look at loops.
In G, we kind of have foreach and kind of don't.
Let's know how to construct it technically.

In G, we use ```lwhile``` to execute a G file based on the value of the global number variable.
> Don't be fooled by its name! This isn't going to execute the file if a condition is true.

```g
std.main:
    [@] : 10
    lwhile helloworld
std.end: exit N
````

You shouldn't give the file name with .g because the interpreter sees every G file as one of the components of G.
And you can use / and the same standard Linux addressing system to execute it if the file is in a folder.

## Section 6 / Screen

We've reached this section, the screen section. Let's pay more attention to it because it's really not without merit.

Okay, let's start.

G uses three methods for printing to the terminal screen.
As I said, functions either accept variables or not. I want to express this same section for strings.
```g
std.main:
    std.echo "Hello world"
    ln
    [%] : "Hello"
    fecho %
    ln
std.end: exit N
```

ln: It's our same "\n". For beginners, it's the same new line creator.

Now if we want to print a number, we have several ways:

1. Use it like a string:
```g
std.main:
    std.echo "2"
    [%] : "4"
    fecho %
    ln
std.end: exit N
``` 
This method is only useful in printing because we can't use this number in strings for mathematical operations.
2. Use the numbers themselves:

```g
std.main:
    [%] : 23
    int.echo @
    ln
std.end: exit N
```
With this method, the numbers themselves are printed and we can easily use them.

Getting colored output in the terminal:
In G, like always, this is easy too. We use ```glue```.

```g
std.main:
    glue gcolor

    fcolor __gcolor__:blue
    std.echo "Hi"
    ln
    fcolor __gcolor__:system
std.end: exit N
```

```gcolor``` gives us the ability to print in color.

The gcolor variables are as follows:
1. blue
2. lightgreen
3. red
4. system

## Section 7 / Server

Okay, from version 5.7.7 onwards, the ability to create a server has been provided.
And we can very easily create a server:
```g
std.main:
    http 8080
std.end: exit N
``` 
I think this is the smallest code for creating a server in the world! The code creates a local server on port 8080 and puts the content of the index.html file into it.

> A few notes: Always check if that port is free or not.

At the time of writing this book, full HTTP support through standard libraries isn't available yet, and for more advanced work, use netg.

## Section 8 / Conditions

Conditions are well supported from version 5.7.7 onwards.

1. We use "if" for strings
2. We use "condition" for numbers

```g
std.main:
    [%] : "Hi"
    [%], a : "Hi"
    if %a
    lxd thisprogram
std.end: exit N
```
The above code creates an infinite loop that always checks if hi equals hi, then executes this same program.

Or for numbers:
```g
std.main:
    [@] : 12
    condition > 6
    lxd thisprogram
std.end: exit N
```
Unlike the above code, this doesn't create a loop.
And it does this: if the global number value is greater than the given number, it sets the condition flag to 1.

Now that we're talking about the condition flag, let me explain it to you.
In G, we have a flag like in assembly called the condition flag. If it's 1, it means they're equal, and if it's zero, it means the condition isn't true (I don't mean that if they're equal, the condition is true).

Okay, sometimes we need to clear this flag, which we do with ```::cl```.
Whenever :: comes, it means your work is with the condition flag.
Except in ```condition``` because there it means two numbers being equal.

Let me write all the ```condition``` conditions for you:
1. >
2. <
3. ::
The first means if the global number was larger.
The second is the opposite of this.
The third is if they're equal.

In G, to execute something if the flag is set to something, we must use lxd/fcd:

If flag was 1: lxd
If flag was 0: fcd
```g
std.main:
    [%] : ""
    [%], a : ""
    if %a
    lxd m
    fcd x
std.end: exit N
```

## Section 9 / Files

Files are also simple because, as always, G is simple too.

Reading a file:
```g
std.main:
    glue file
    [%] : "hi.txt"
    file.read %
    file.read "hi.txt"
    fecho %
    ln
std.end: exit N
```
Writing to a file:

```g
std.main:
    glue file
    [%] : "this will save in this file"
    file.write "hi.txt"
    ln
std.end: exit N
```

Checking existence of a file:

```g
std.main:
    glue file
    file.exs "hi.txt"
    lxd yes_message
std.end: exit N
```
You might want to get the filename from the global string variable. In this situation, we use flex:
```g
std.main:
    get_n
    flex
    lxd helloworld
std.end: exit N
```

## Section 10 / flex

flex is the name of the package manager, library installer, and library creator in G.
And working with it is also very simple.

```
flex #create new project
flex new #create new library project
flex build #build project and install it (may run with sudo to it can install it)
flex public #add your library to public mirror (add to mirror then flex use)
sudo flex -r packagename #remove an installed flex package
sudo flex add lib-name #install library
```

Okay, let's start with installing it.
For its installation, I plan for it to be installed with the language itself, but for now we go to:
[here](https://github.com/pouyathe/flex)
And download the latest release.
Now G must already be installed on our system. Then with this command, we run the installer:
```bash
sudo glang -c auto.g
```
Because this installs, we need to use root access.

Now after installation, it's enough that we just run:
```bash
flex -v
```
And we have output like this:
```
pouya@pouya-Latitude-E5440:~/glang$ flex -v
Flex version 1.1, A project manager for glang.
GNU G | (S3)
Copyright (C) 2026 The G programming language Pouya Mohammadi.
v5.7.7 Feb  2 2026 21:39:26

Use 'build' to compile a project. (use it inside of your project folder.)
pouya@pouya-Latitude-E5440:~/glang$ 
```
And it's installed that easily!
Now let's install a library with it:
```bash
sudo flex add hi
```
Now this library just says hi and doesn't do anything else.

To use flex libraries, we must use their header to find the library address in the system:

```g
std.main:
    glue flex.hi
    fn sayhi
std.end: exit N
```

Now we have output like this:
```
pouya@pouya-Latitude-E5440:~/glang$ glang -c test.g
Hi
pouya@pouya-Latitude-E5440:~/glang$ 
```
Okay, now maybe you want to write your own project with flex. Well, no problem!

First we should call ```flex```:
```
pouya@pouya-Latitude-E5440:~/glang$ flex
=> Flex version : 1.1
A Name for project? g-learn   
 Project g-learn created inside flex folder.
pouya@pouya-Latitude-E5440:~/glang$ 
```
pouya@pouya-Latitude-E5440:~/glang$ cd ~/flex
pouya@pouya-Latitude-E5440:~/flex$ ls
afcp  fuchsia  fuchsia.zip  g-learn  mylibs  oda  test3  tesx
pouya@pouya-Latitude-E5440:~/flex$ cd g-learn
pouya@pouya-Latitude-E5440:~/flex/g-learn$ ls
bcfg  g-learn  src
pouya@pouya-Latitude-E5440:~/flex/g-learn$ cd src
pouya@pouya-Latitude-E5440:~/flex/g-learn/src$ ls
main.g
pouya@pouya-Latitude-E5440:~/flex/g-learn/src$ 
```
You see I've written a lot of things with flex.
Okay, let's examine:
1. Flex puts project files in ~/flex/projectname
2. Flex creates three files: bcfg, g-learn, src where:
   src: The program files and source folder
   projectname: The binary file it creates for installation and is specific to flex, and flex itself uses it
   bcfg: Configuration file for flex

Inside the folder we have the main.g file and our code starts from here.
I'll now write a very simple program:
```g
std.main:
    glue gcolor

    fcolor __gcolor__:blue
    std.echo "Hello to everyone who wants to learn G"
    ln
    fcolor __gcolor__:system
std.end: exit N
```
Okay, now let's return to the project folder:
That is here:
```
~/flex/g-learn
```
And let's install it and build it:
```
pouya@pouya-Latitude-E5440:~/flex/g-learn$ flex build
[sudo] password for pouya:     
g-learn is installed.
pouya@pouya-Latitude-E5440:~/flex/g-learn$ 
```
Now let's test it:
‍‍‍```
pouya@pouya-Latitude-E5440:~/flex/g-learn$ g-learn
Hello to everyone who wants to learn G
pouya@pouya-Latitude-E5440:~/flex/g-learn$ 
```
And that's it! We wrote our program with G and built and installed it without errors!

Let's talk about something important too.

In G, if you want to use lxd/fcd in a flex project, you must give the address like this:

```g
lxd /usr/flex/projectname/gfilename
```

Let's examine more closely.

Here I brought the source code of ```fuchsia``` which is a terminal written with G:
‍‍```g
std.main:
        glue string
        glue file
        glue gcolor

        fcolor __gcolor__:blue
        file.read "/usr/flex/fuchsia/art.txt"
        fecho %
        ln
        fcolor __gcolor__:system
        std.echo "fuchsia"
        fcolor __gcolor__:cyan
        std.echo " v1.2_2 "
        fcolor __gcolor__:system
        std.echo "- based In glang "
        glang.version
        fcolor __gcolor__:lightgreen
        fecho %
        ln
        fcolor __gcolor__:system
        std.echo "see "
        fcolor __gcolor__:lightgreen
        std.echo "http://glang.ct.ws/fuchsia.html"
        fcolor __gcolor__:system
        ln
        fcolor __gcolor__:blue
        std.echo ".fua> "
        fcolor __gcolor__:system
        get_n
        [%], a : ".ef ~.line"
        if %a
        lxd /usr/flex/fuchsia/newlined
        [%], versionoffuchsia : ".ef ~.version"
        ...

‍‍‍```
I think you understood that you must give file addresses in a way that they still work after installing the package.
Flex takes each package's files to its own folder, and you must give that address.

Now let's create a library.

First, let's create a library with ```flex new```:

```
pouya@pouya-Latitude-E5440:~$ flex new
=> Flex version : 1.1
A Name for new library? glearn

any note to show in installation progress? Hi its glearn library

creator name for glearn? Pouya Mohammadi
Library glearn created in flex home folder.
pouya@pouya-Latitude-E5440:~$ 
```
Okay, it's created. Let's go write it:
```
pouya@pouya-Latitude-E5440:~$ cd ~/flex
pouya@pouya-Latitude-E5440:~/flex$ cd mylibs
pouya@pouya-Latitude-E5440:~/flex/mylibs$ ls
glearn  gonline  gtermcolor  netg  siglib  stable.zip  s.zip  test  test2  ulow
pouya@pouya-Latitude-E5440:~/flex/mylibs$ cd glearn
pouya@pouya-Latitude-E5440:~/flex/mylibs/glearn$ ls
glearn.g
pouya@pouya-Latitude-E5440:~/flex/mylibs/glearn$ cat .flex.config
package_name "glearn"
desc "Hi its glearn library"
creator "Pouya Mohammadi"
pouya@pouya-Latitude-E5440:~/flex/mylibs/glearn$ 
```

You see that when flex builds a library, it saves its source file in the ```mylibs``` folder.

And the configuration file is .flex.config which is for setting how it works.

Okay, there are some points.

If you want to add a shared library ".so", we must change the config:
```
so sharedlibraryname.so
```
With this, flex takes the file to /usr/lib.

And for using it, you must also give the /usr/lib address.

```
std.main:
    sharedloader /usr/lib/libhi.so hi Pouya
std.end: exit N
```
Output: 
"Hi Pouya"

```c
#include <stdio.h>

void sayhitome(const char* value){
        printf("Hi %s", value);
}
```
```bash
pouya@pouya-Latitude-E5440:~/flex/mylibs/glearn$ gcc -shared -fPIC hi.c -o libhi.so
```
```g
fn glearn_hi
        sharedloader /usr/lib/libhi.so sayhitome pouya
```
Okay, let's send it to the server:
```
pouya@pouya-Latitude-E5440:~/flex/mylibs/glearn$ flex public
Publishing glearn in Flex Github Mirror...
  adding: glearn.g (deflated 2%)
  adding: libhi.so (deflated 88%)
  adding: hi.c (deflated 4%)
  adding: .flex.config (deflated 6%)
{
  "content": {
    "name": "README.md",
    "path": "glearn/README.md",
    "sha": "e69de29bb2d1d6434b8b29ae775ad8c2e48c5391",
    "size": 0,
    "url": "https://api.github.com/repos/pouyathe/flex-mirror/contents/glearn/README.md?ref=main",
    "html_url": "https://github.com/pouyathe/flex-mirror/blob/main/glearn/README.md",
    "git_url": "https://api.github.com/repos/pouyathe/flex-mirror/git/blobs/e69de29bb2d1d6434b8b29ae775ad8c2e48c5391",
    "download_url": "https://raw.githubusercontent.com/pouyathe/flex-mirror/main/glearn/README.md",
    "type": "file",
    "_links": {
      "self": "https://api.github.com/repos/pouyathe/flex-mirror/contents/glearn/README.md?ref=main",
      "git": "https://api.github.com/repos/pouyathe/flex-mirror/git/blobs/e69de29bb2d1d6434b8b29ae775ad8c2e48c5391",
      "html": "https://github.com/pouyathe/flex-mirror/blob/main/glearn/README.md"
    }
  },
  "commit": {
    "sha": "0e38d54d209d814528820b4039b321aa575c05ef",
    "node_id": "C_kwDORDMaK9oAKDBlMzhkNTRkMjA5ZDgxNDUyODgyMGI0MDM5YjMyMWFhNTc1YzA1ZWY",
    "url": "https://api.github.com/repos/pouyathe/flex-mirror/git/commits/0e38d54d209d814528820b4039b321aa575c05ef",
    "html_url": "https://github.com/pouyathe/flex-mirror/commit/0e38d54d209d814528820b4039b321aa575c05ef",
    "author": {
      "name": "Pouya Mohammadi",
      "email": "pouya.momhidei@gmail.com",
      "date": "2026-02-03T11:54:57Z"
    },
    "committer": {
      "name": "Pouya Mohammadi",
      "email": "pouya.momhidei@gmail.com",
      "date": "2026-02-03T11:54:57Z"
    },
    "tree": {
      "sha": "c22f74756ce35dfb696ad1429f763b130b460094",
      "url": "https://api.github.com/repos/pouyathe/flex-mirror/git/trees/c22f74756ce35dfb696ad1429f763b130b460094"
    },
    "message": "Init",
    "parents": [
      {
        "sha": "eaed021702cdcf3c2633aa8ca9e7924dbefcafc5",
        "url": "https://api.github.com/repos/pouyathe/flex-mirror/git/commits/eaed021702cdcf3c2633aa8ca9e7924dbefcafc5",
        "html_url": "https://github.com/pouyathe/flex-mirror/commit/eaed021702cdcf3c2633aa8ca9e7924dbefcafc5"
      }
    ],
    "verification": {
      "verified": false,
      "reason": "unsigned",
      "signature": null,
      "payload": null,
      "verified_at": null
    }
  }
}
{
  "content": {
    "name": "stable.zip",
    "path": "glearn/stable.zip",
    "sha": "95df1173df8c4d8c9ae6cc5a7b41aebb18714a30",
    "size": 2801,
    "url": "https://api.github.com/repos/pouyathe/flex-mirror/contents/glearn/stable.zip?ref=main",
    "html_url": "https://github.com/pouyathe/flex-mirror/blob/main/glearn/stable.zip",
    "git_url": "https://api.github.com/repos/pouyathe/flex-mirror/git/blobs/95df1173df8c4d8c9ae6cc5a7b41aebb18714a30",
    "download_url": "https://raw.githubusercontent.com/pouyathe/flex-mirror/main/glearn/stable.zip",
    "type": "file",
    "_links": {
      "self": "https://api.github.com/repos/pouyathe/flex-mirror/contents/glearn/stable.zip?ref=main",
      "git": "https://api.github.com/repos/pouyathe/flex-mirror/git/blobs/95df1173df8c4d8c9ae6cc5a7b41aebb18714a30",
      "html": "https://github.com/pouyathe/flex-mirror/blob/main/glearn/stable.zip"
    }
  },
  "commit": {
    "sha": "e685e2ac6099c65fbbf4cd4a568082558cd8ae35",
    "node_id": "C_kwDORDMaK9oAKGU2ODVlMmFjNjA5OWM2NWZiYmY0Y2Q0YTU2ODA4MjU1OGNkOGFlMzU",
    "url": "https://api.github.com/repos/pouyathe/flex-mirror/git/commits/e685e2ac6099c65fbbf4cd4a568082558cd8ae35",
    "html_url": "https://github.com/pouyathe/flex-mirror/commit/e685e2ac6099c65fbbf4cd4a568082558cd8ae35",
    "author": {
      "name": "Pouya Mohammadi",
      "email": "pouya.momhidei@gmail.com",
      "date": "2026-02-03T11:54:59Z"
    },
    "committer": {
      "name": "Pouya Mohammadi",
      "email": "pouya.momhidei@gmail.com",
      "date": "2026-02-03T11:54:59Z"
    },
    "tree": {
      "sha": "ea5faeeb52327def53891699d5fb11534d35e882",
      "url": "https://api.github.com/repos/pouyathe/flex-mirror/git/trees/ea5faeeb52327def53891699d5fb11534d35e882"
    },
    "message": "Uploading zip",
    "parents": [
      {
        "sha": "0e38d54d209d814528820b4039b321aa575c05ef",
        "url": "https://api.github.com/repos/pouyathe/flex-mirror/git/commits/0e38d54d209d814528820b4039b321aa575c05ef",
        "html_url": "https://github.com/pouyathe/flex-mirror/commit/0e38d54d209d814528820b4039b321aa575c05ef"
      }
    ],
    "verification": {
      "verified": false,
      "reason": "unsigned",
      "signature": null,
      "payload": null,
      "verified_at": null
    }
  }
}
glearn as stable version in public.
pouya@pouya-Latitude-E5440:~/flex/mylibs/glearn$ 
```
Okay, the server address is:
https://github.com/pouyathe/flex-mirror

Let's test it!

First install it:
```
pouya@pouya-Latitude-E5440:~$ sudo flex add glearn
glearn Download as stable version.
Archive:  /usr/flex/.cache/glearn.zip
  inflating: glearn.g                
  inflating: libhi.so                
  inflating: hi.c                    
  inflating: .flex.config            
shared library libhi.so installed.
Hi its glearn library
developed by Pouya Mohammadi
```
Now let's run it:
```g
std.main:
    glue flex.glearn
    fn glearn_hi
std.end: exit N
```

```
pouya@pouya-Latitude-E5440:~$ glang -c test.g
Hi pouyapouya@pouya-Latitude-E5440:~$ 
```
Okay, if you've understood, I forgot to make a new line.

Okay, that's it for flex. Really, this works!
## Section 11 / Searching in Texts

Okay, maybe you want to use some features for texts, which of course is no problem.

Let's search for something in text. Suppose we have:
```g
std.main:
    [%] : "Hello to world! written by pouya."
std.end: exit N
```
And we're looking for a word or sentence in it. For example here, the author's name.
In G, to find something in text, we use ```infbe```:
```g
std.main:
    [%] : "Hello to world! written by pouya."
    infbe "pouya"
    lxd itwrittenbypouya
std.end: exit N
```
itwrittenbypouya.g
```
std.main:
    std.echo "It written by pouya (me)"
    ln
std.end: exit N
```

Okay, now maybe we're not looking for a specific author's name and just want to find out who that author is.
To get the word after something, we use ```tonext``` which separates words word by word.

```g
std.main:
    [%] : "Hello to world! written by pouya"
    tonext by
    std.echo "it written by "
    fecho %
    ln
std.end: exit N
```
## Section 12 / Binary

For reading binary in G, we use raw.

```g
std.main:
    raw r my.bin
std.end: exit N
```
Okay, now we can do several things with this binary:
1. Print it.

We can either print it as hex or normally.

```g
std.main:
    raw r mybin.bin
    raw w_hex 0
std.end: exit N
```
In G, the file content creates an array for each hex.
Okay, for reading each one, we must give an index.

This index starts from zero.

For example for me here:
```
pouya@pouya-Latitude-E5440:~$ glang -c test.g
7F
``` 
Returned for zero.

## Section 13 / Memory
G gives you manual access to memory.
This is something like ```malloc```.

```g
std.main:
    gram 128
    gram free
std.end: exit N
``` 
With ```gram``` we can reserve memory.
And I took 128 bytes of RAM memory.

And with `gram free` freed it.

We can write in this memory.

 ```g
 std.main:
    gram 128
    @_faddr 12
 std.end: exit N
 ```
  This code puts the number 12 in the first empty section.

  Now maybe you don't want to just put numbers
  and want to put other things too.

  ```g
  std.main:
    gram 128
    [@*__address__] : "Hi"
    gram free
 std.end: exit N
 ```

 Okay, but maybe you want to see the physical address of that memory in RAM.
 ```g
 std.main:
    gram 128
    f*addr
 std.end: exit N
 ```
 ```*``` is the memory pointer and for pointing to it, we use this.

 ## Section 14 / Ports

 For talking with ports and sending data, we must use ```gserial```.

 First we must define the port for G.

 ```g
 std.main:
    gserial /port/address
 std.end: exit N
 ``` 
 Now we can send data to the port:
 ```g
 std.main:
    gserial /port/address
    send "hi"
    end
 std.end: exit N
 ```
 For closing the port too, we must use end.

 With this ease, we've learned 80-90% of G until now.

 ## Section 15 / Additional Notes

 std.slp "time": Holding program execution until completion of that time in seconds
 glang.build: Getting the interpreter build date and storing in global string variable %
 defe: Getting the condition flag value
 glang.version: Getting the interpreter version and storing in global string variable %  
 csys "command": Executing command - needs "glue corec" first
 string.in: Same as infbe
 string.num: Converting global number variable value to text stored in global text variable
 error.new "error": Creating error

 And that's it. We've now learned everything that was in version 5.7.6!

 Thank you for reading this book and thank you for choosing G.

 If you have suggestions: pouya.momhidei@gmail.com
