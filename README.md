
# G

<div align="center">

**Data type, memory safe & super fast programming language.**

[![License](https://img.shields.io/badge/license-GNU-blue.svg)](LICENSE)
[![GitHub Stars](https://img.shields.io/github/stars/pouyathe/glang?style=social)](https://github.com/pouyathe/glang)

</div>

---

## 🚀 About G

**G** is a lightweight, high-performance programming language designed for developers who value speed and safety. With a tiny interpreter footprint (~2.4MB), G delivers instant startup and execution without the bloat of modern runtimes.

### Key Features
*   ⚡ **Blazing Fast:** Minimal overhead with efficient execution.
*   🔒 **Memory Safe:** Built-in safety features to prevent common memory errors.
*   📦 **Lightweight:** The entire interpreter fits in a tiny binary package.
*   🛠 **Developer Friendly:** Modern syntax with support for standard libraries (`std`).

---

## 📦 Installation

### 1. Download the Interpreter
Grab the latest stable release for your platform:

[Download glang.oda](https://github.com/pouyathe/glang/source/oda/glang_foroda.oda)
***
see [this](https://github.com/pouyathe/oda) for how to make it yourself.
Also You can download source files for :
    [dub](https://github.com/pouyathe/glang/source/dub)
    

Extract the archive and add the `glang` binary to your system PATH.

### 2. VS Code Extension (Recommended)
Get custom icons for `.g` files.

*   **Search:** `G Language icon Support` in the VS Code Marketplace.
*   **Or Install Manually:**
    1.  Download the `.vsix` file from the [Releases](https://github.com/pouyathe/vscode_icon-glang/releases) page.
    2.  Open VS Code -> Extensions -> ... -> Install from VSIX.

---

## 💻 Quick Start

Create a file named `hello.g`:

```g
std.main:
    std.echo "Hello world!"
    ln
std.end: exit N
```

**Run it:**
```bash
glang -c hello.g
```

---

## 📖 Syntax Overview

### Functions
Define functions using the `fn` keyword.

```g
fn add_two
    [@] : + 2

```
> A Function must define in just one file for multi function use must create another files.

### Standard Library (`std`)
Access powerful built-in functions easily.

*   `std.echo "string"` : Print output.
*   `std.newline` : Print a new line.
*   `std.exit` : Terminate the program.

### Comments
```g
This is a single line comment


   Multi-line comments
   are also supported

```
> Comments dosen't have any symbol just write them like normal text!

---

## 🤝 Contributing

We welcome contributions! Please feel free to submit a Pull Request.

1.  Fork the project
2.  Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3.  Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4.  Push to the Branch (`git push origin feature/AmazingFeature`)
5.  Open a Pull Request

---

## 📜 License

This project is licensed under the GNUv3 License - see the [LICENSE](LICENSE) file for details.

---

<div align="center">
Made with ❤️ by <a href="https://github.com/pouyathe">Pouya Mohammadi</a>
</div>
