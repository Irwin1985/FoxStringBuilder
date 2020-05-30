# FoxStringBuilder
`FoxStringBuilder` is a Visual FoxPro Class library that creates a mutable sequence of characters.

# Table of Contents

- [Installation](#installation)
- [Simple Test](#simple-test)
- [License](#license)


## Installation

```
Just copy the FoxStringBuilder prg anywhere into your project PATH folder.
```

## Simple Test
```xBase
// declare the FoxStringBuilder Prg
Set Procedure to "FoxStringBuilder" Additive

// Instantiate FoxStringBuilder Object
=AddProperty(_vfp, "FoxBuilder", CreateObject("FoxStringBuilder"))
// Get Version
_vfp.FoxBuilder.GetVersion()
// Append some text
_vfp.FoxBuilder.Append("Hello")
_vfp.FoxBuilder.Append(" World!")
_vfp.FoxBuilder.ToString()

// It is also posible appending in constructor (including another FoxStringBuilder object)
loBuilder = CreateObject("FoxStringBuilder", "Hello World!")

// you may also append any data type into string by calling the same Append() method.
loBuilder.Append("Vfp Rules!")
loBuilder.Append(.T.)
loBuilder.Append(1985)
loBuilder.ToString() // Vfp Rules!.T.1985

// Appending an FoxStringBuilder object
loBuilderObjA = CreateObject("FoxStringBuilder")
loBuilderObjB = CreateObject("FoxStringBuilder")
loBuilderObjA.Append("Hello")
loBuilderObjB.Append(loBuilderObjA)
loBuilderObjB.Append(" World!")
loBuilderObjB.ToString() // Hello World
```
## Useful Methods
```xBase
// Delete()
_vfp.FoxBuilder.Append("Hello World!")
_vfp.FoxBuilder.Delete(6, 12) //Hello!

// DeleteCharAt()
_vfp.FoxBuilder.Append("Hello World!")
_vfp.FoxBuilder.DeleteCharAt(12) // Hello World

//IndexOf()
_vfp.FoxBuilder.Append("Hello World!")
_vfp.FoxBuilder.IndexOf("lo") // 4

// LastIndexOf()
_vfp.FoxBuilder.Append("Hello World!")
_vfp.FoxBuilder.LastIndexOf("o") // 8

// Insert()
_vfp.FoxBuilder.Append("Hello World!")
_vfp.FoxBuilder.Insert(5, " Dear") // Hello Dear World!

// Replace()
_vfp.FoxBuilder.Append("Hello World!")
_vfp.FoxBuilder.Replace(5, 6, " My Dear ") // Hello My Dear World!

// Reverse()
_vfp.FoxBuilder.Append("Hello World!")
_vfp.FoxBuilder.Reverse() // !dlroW olleH

```
## License

FoxStringBuilder is released under the MIT Licence.
