# The G Programming Language  
**A friendly guide for curious programmers**  
*Version 5.7.6 • By Pouya Mohammadi • Written with heart, coded with passion*

---
# 📖 **Table of Contents - The G Programming Language Book**

## **Main Chapters**

### **📚 Chapter 1: Let's Get Started**
- **1.1** Why G Language? - The Philosophy Behind It
- **1.2** How to Install G?
  - 1.2.1 Easy Way: Download Ready Binary
  - 1.2.2 Advanced Way: Compile from Source
- **1.3** Installation Test: Make Sure It Works

### **🧩 Chapter 2: Structure of G Language**
- **2.1** The Lazy Interpreter! How It Reads Files
- **2.2** Main Sections: `std.main` and `std.end`
- **2.3** Why Can Each File Have Only One Function?
- **2.4** Exit States: `exit N` (Normal) and `exit E` (Error)

### **📦 Chapter 3: Data and Variables**
- **3.1** Global Variables (Like CPU Registers)
  - 3.1.1 `@` - For Numbers
  - 3.1.2 `%` - For Text
  - 3.1.3 `__rea__` - For Money
  - 3.1.4 `__float__` - For Decimals
- **3.2** Custom Variables: Name Them Yourself!
- **3.3** How to Store and Retrieve Values?

### **➕ Chapter 4: Mathematics and Calculations**
- **4.1** Four Basic Operations on Numbers (`+`, `-`, `*`, `\`)
- **4.2** Financial Calculations with `rea_add`
- **4.3** Order of Operations: How the Interpreter Calculates
- **4.4** Type Conversions: Number to Text and Vice Versa

### **🔄 Chapter 5: Program Control**
- **5.1** Loops with `lwhile`: Repeating Tasks
- **5.2** Conditions: Decision Making in Programs
  - 5.2.1 `if` for Text
  - 5.2.2 `condition` for Numbers
- **5.3** Condition Flags: `::`, `::cl`, `lxd`, `fcd`
- **5.4** Executing Other Files

### **💻 Chapter 6: Input and Output**
- **6.1** Printing to Screen
  - 6.1.1 `std.echo` for Static Text
  - 6.1.2 `fecho` for Variables
  - 6.1.3 `int.echo` for Numbers
- **6.2** Getting User Input with `get_n`
- **6.3** Coloring Output with `gcolor`
  - 6.3.1 Available Colors: Blue, Red, Green, Default
- **6.4** New Line: `ln` is Our Enter Key

### **📂 Chapter 7: Working with Files**
- **7.1** `file` Library: How to Load It?
- **7.2** Reading from Files
- **7.3** Writing to Files
- **7.4** Checking File Existence with `file.exs`
- **7.5** When Filename is in a Variable (`flex`)

### **🌐 Chapter 8: Network and Internet**
- **8.1** Creating Simple HTTP Server with `http 8080`
- **8.2** `netg` Library for Advanced Tasks
- **8.3** Sending POST Requests
- **8.4** Working with Ports and Connections

### **🧩 Chapter 9: Development and Libraries**
- **9.1** Installing `flex` (G's Package Manager)
- **9.2** Creating New Libraries
  - 9.2.1 Creating New Project
  - 9.2.2 Writing Library Code
  - 9.2.3 Building and Installing Library
- **9.3** Using Others' Libraries
- **9.4** Sharing Your Own Library

### **🔗 Chapter 10: Interfacing with Other Languages**
- **10.1** Creating C Libraries
- **10.2** Compiling to `.so` (Shared Library)
- **10.3** Calling C Functions from G with `sharedloader`
- **10.4** Working with Memory and Addresses

### **⚡ Chapter 11: Advanced Features**
- **11.1** Memory Management with `gram`
- **11.2** Direct Work with Memory Addresses
- **11.3** Reading Binary Files with `raw`
- **11.4** Searching in Text with `infbe` and `tonext`
- **11.5** Execution Delay with `std.slp`

### **🔧 Chapter 12: Tools and Tricks**
- **12.1** Getting Interpreter Version (`glang.version`)
- **12.2** Creating Custom Errors (`error.new`)
- **12.3** Executing System Commands (`csys`)
- **12.4** String and Number Conversions

### **❓ Chapter 13: Troubleshooting**
- **13.1** Common Errors and Solutions
- **13.2** How to Debug a Non-Working Program?
- **13.3** What to Do When Interpreter Shows Weird Message?
- **13.4** Connecting with G Community (GitHub Issues)

### **🎯 Chapter 14: Practical Projects**
- **14.1** Building a Simple Calculator
- **14.2** A Program That Converses with User
- **14.3** Data Storage System in Files
- **14.4** A Small Web Server
- **14.5** Useful Library for Your Own Projects

### **📖 Appendices**
- **Appendix A:** Complete G Commands Table
- **Appendix B:** Ready-to-Use Sample Codes
- **Appendix C:** Additional Learning Resources
- **Appendix D:** Persian-English Terminology Glossary
- **Appendix E:** G Version History

---

**✨ Important Note:** This table of contents is based on G language version 5.7.6. If a newer version comes out, some things might be added or changed.

**📞 For Help:** If you get stuck anywhere or have questions, you can ask in [GitHub Issues](https://github.com/pouyathe/glang/issues) or email me.

*Last Updated: February 2026 • Pouya Mohammadi*
## 📖 **Let's Start Here...**

### **First: Install It So We Can Move Forward!**

Okay, we have two ways:

**Way 1 - The Easiest (for those who want to get there fast):**
```bash
# Go to GitHub, download it, type these:
chmod +x glang
./glang -v  # See if it works?
sudo cp glang /usr/bin  # Now you have it everywhere
```

**Way 2 - For those who want to build it themselves:**
```bash
git clone https://github.com/pouyathe/glang
cd glang/source/dub
# Now you need to install dmd...
dub  # That's it! It builds it for you
```

> ❗ **Remember:** Right now only x86-64 works. If you have another system, tell me in GitHub issues.

---

## 🧠 **Let's Understand Something First: G's Philosophy**

G is like a **lazy but smart person**! It only looks for one thing: **the code section**.

Remember how it was in assembly? We had a code section, a data section... Well G is the same but **only has the code section**.

**Why?** Because I want:
- Files to be small
- Finding things to be easy  
- It to be like that assembly I love

---

## ✍️ **How Do I Write a G Program?**

### **The Simplest One:**
```g
std.main:
    std.echo "Hello everyone!"
    ln  # This ln is just our enter key
std.end: exit N  # N means Normal, everything finished OK
```

Or if we had an error:
```g
std.main:
    std.echo "Oops! A problem happened"
    ln
std.end: exit E  # E means Error, tell them we had an error
```

---

## 📦 **Data in G - Like CPU Registers!**

In G we have some **global variables** (like cpu registers):

| Its name | What it's for | Example |
|----------|---------------|---------|
| `@` | Number | `[@] : 15` |
| `%` | Text | `[%] : "How are you?"` |
| `__rea__` | Money | `[__rea__] : 25.50` |
| `__float__` | Decimal | `[__float__] : 3.14` |

**Real Life Example:**
```g
std.main:
    [%] : "Pouya"  # My name
    [@] : 17       # My age
    [__rea__] : 0  # Money in my pocket right now :)
    
    std.echo "Name: "
    fecho %       # fecho is for printing variables
    ln
    
    std.echo "Age: "
    int.echo @    # This is for printing numbers
    ln
std.end: exit N
```

> 💡 **Cool Tip:** You can give your variable your own name too! `[%], my_name : "Pouya"`

---

## ➕ **Math - Easier Than Counting Money in Your Pocket!**

Always works on that same `@`:

```g
std.main:
    [@] : 10
    [@] : + 5    # Now it's 15
    [@] : * 2    # Now it's 30  
    [@] : \ 3    # Now it's 10 (division)
    [@] : - 4    # Now it's 6
    
    int.echo @   # See? Became 6!
    ln
std.end: exit N
```

**For money** it's a little different:
```g
std.main:
    [__rea__] : 1000
    rea_add 500     # Adding
    fecho __rea__   # Show it: 1500
    ln
std.end: exit N
```

---

## 🔁 **Loops - Repeat Until You Learn!**

In G we use `lwhile`:

```g
std.main:
    [@] : 5          # Five times
    lwhile hello     # Run the 'hello' file
std.end: exit N
```

The `hello` file (don't put `.g`!):
```g
std.main:
    std.echo "Greetings!"
    ln
std.end: exit N
```

---

## 🤔 **Conditions - Make Decisions!**

**For text:**
```g
std.main:
    [%] : "password"
    [%], password : "password123"
    if password          # If password was correct
    lxd go_inside        # Execute this
std.end: exit N
```

**For numbers:**
```g
std.main:
    [@] : 20
    condition > 18     # If greater than 18
    lxd adult          # This
    fcd child          # Otherwise this
std.end: exit N
```

---

## 🎨 **Be Colorful! Make Your Terminal Beautiful**

```g
std.main:
    glue gcolor  # Bring the color library
    
    fcolor __gcolor__:blue
    std.echo "This is blue!"
    ln
    
    fcolor __gcolor__:red
    std.echo "This is red!"
    ln
    
    fcolor __gcolor__:system  # Return to normal color
std.end: exit N
```

**Colors you have:**
- Blue (`blue`)
- Light Green (`lightgreen`)
- Red (`red`)  
- System normal color (`system`)

---

## 🌐 **Make a Server - Easy Like Drinking Water!**

```g
std.main:
    http 8080  # That's it! Your server is on
std.end: exit N
```

> 📍 **Remember:** Port 8080 should be free. It serves `index.html` if it exists.

---

## 📂 **Work With Files**

```g
std.main:
    glue file  # Call the file library
    
    # Write to it
    [%] : "Save this"
    file.write "note.txt"
    
    # Read from it
    file.read "note.txt"
    fecho %  # See what you wrote
    ln
std.end: exit N
```

---

## 🧩 **Build Your Own Library!**

**First install flex:**
```bash
# Get flex from GitHub
sudo glang -c auto.g  # Install it
flex -v  # See if it works?
```

**Now make a library:**
```bash
flex new
# It asks you: Library name? "greeter"
# Description? "A simple library for greeting"
# Creator? "Pouya"
```

**Go edit your library:**
```bash
cd ~/flex/mylibs/greeter
# In greeter.g write:
```

```g
fn special_greet
    std.echo "Special greeting from my own library!"
    ln
```

**Now install it:**
```bash
cd ~/flex/mylibs/greeter
sudo flex build  # Builds and installs it
```

**Use your own library:**
```g
std.main:
    glue flex.greeter  # Call your library
    fn special_greet   # Run its function
std.end: exit N
```

---

## 🔗 **You Can Even Call C Libraries!**

**First make a C library:**
```c
// hi.c
#include <stdio.h>

void greet_in_persian() {
    printf("Hello from C!\n");
}
```

**Compile it:**
```bash
gcc -shared -fPIC hi.c -o libgreet.so
```

**Now use it in G:**
```g
std.main:
    sharedloader /usr/lib/libgreet.so greet_in_persian
std.end: exit N
```

---

## 💭 **Some Other Cool Things:**

- `std.slp "2"` - Hold the program for 2 seconds
- `glang.version` - Get the interpreter version  
- `error.new "My error"` - Create a new error
- `get_n` - Get something from the user

---

## 🎯 **In The End...**

As you saw, G tries to be **simple** but **powerful**. Maybe my code looks messy now, but truth be told:
- I'm in Iran
- Our internet gets cut on and off
- Sometimes I code offline for weeks
- This version 5.7.7 means I rewrote it 5 times!

**Final words:** G is like my school notebook - maybe it's scribbly, but I wrote it myself. Now I'm trying to clean it up.

If you liked it, I'd be happy if you give the project a star 🙂  
If you see a problem, tell me in issues.

**Pouya**  
*A 17-year-old teenager who loves programming*