VSPlist
============


VSPlist is a simple Swift class that reads and writes to plist files.


Installation
============


Add VSPlist.swift to your project.


Usage
=====

Use the class method loadPlistFile to read the plist file as a dictionary.

```
let dict = VSPlist.loadPlistFile(fileName: "Test.plist")
```

Use the class method savePlistFile to write to the plist file.

```
VSPlist.savePlistFile(fileName: "Test.plist", dictionary: dict)
```
