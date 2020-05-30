Define Class FoxStringBuilderTests As FxuTestCase Of FxuTestCase.prg
	#If .F.
		Local This As FoxStringBuilderTests Of FoxStringBuilderTests.prg
	#Endif
	icTestPrefix = "Test"
	FoxBuilder = .Null.
&& ======================================================================== &&
&& Function Setup
&& ======================================================================== &&
	Function Setup
		Set Procedure To "FoxStringBuilder.prg" Additive
		This.FoxBuilder = Createobject("FoxStringBuilder")
	Endfunc
&& ======================================================================== &&
&& Function TearDown
&& ======================================================================== &&
	Function TearDown
		This.FoxBuilder = .Null.
		Clear Class FoxStringBuilder
		Release Procedure FoxStringBuilder
	Endfunc
&& ======================================================================== &&
&& Function TestObject
&& ======================================================================== &&
	Function TestObject
		If This.AssertNotNull(This.FoxBuilder, "failed to create the FoxBuilder object")
			This.MessageOut("FoxBuilder was successfully created")
		Endif
	Endfunc
&& ======================================================================== &&
&& Function TestConstructor
&& ======================================================================== &&
	Function TestConstructor
		Local loTest As Object
		loTest = Createobject("FoxStringBuilder", "This is a sample string")
		This.MessageOut(loTest.ToString())
	Endfunc
&& ======================================================================== &&
&& Function TestAppend
&& ======================================================================== &&
	Function TestAppend
		Local lcStringToAppend As String
		lcStringToAppend = "Hello"
		This.FoxBuilder.Append(lcStringToAppend)
		If This.AssertEquals(This.FoxBuilder.ToString(), lcStringToAppend, "values does not match")
			This.MessageOut("Test Ok")
		Endif
	Endfunc
&& ======================================================================== &&
&& Function TestAppendCodePoint
&& ======================================================================== &&
	Function TestAppendCodePoint
		With This.FoxBuilder
			.AppendCodePoint(Asc("H"))
			.AppendCodePoint(Asc("e"))
			.AppendCodePoint(Asc("l"))
			.AppendCodePoint(Asc("l"))
			.AppendCodePoint(Asc("o"))
			This.MessageOut(.ToString())
		Endwith
	EndFunc
&& ======================================================================== &&
&& Function TestDelete
&& ======================================================================== &&
	Function TestDelete
		This.FoxBuilder.Append("Hello World!")
		This.FoxBuilder.Delete(6, 12)
		This.MessageOut(This.FoxBuilder.ToString())
	Endfunc
&& ======================================================================== &&
&& Function TestDeleteCharAt
&& ======================================================================== &&
	Function TestDeleteCharAt
		This.FoxBuilder.Append("Hello World!")
		This.FoxBuilder.DeleteCharAt(12)
		This.MessageOut(This.FoxBuilder.ToString())
	Endfunc
&& ======================================================================== &&
&& Function TestIndexOf
&& ======================================================================== &&
	Function TestIndexOf
		This.FoxBuilder.Append("Hello World!")
		If This.AssertTrue(This.FoxBuilder.IndexOf("lo") = 4)
			This.MessageOut("TestIndexOf Ok")
		EndIf
	Endfunc
&& ======================================================================== &&
&& Function TestLastIndexOf
&& ======================================================================== &&
	Function TestLastIndexOf
		This.FoxBuilder.Append("Hello World!")	
		If This.AssertTrue(This.FoxBuilder.LastIndexOf("o") = 8)
			This.MessageOut("TestLastIndexOf Ok")
		EndIf
	Endfunc
&& ======================================================================== &&
&& Function TestInsert
&& ======================================================================== &&
	Function TestInsert
		This.FoxBuilder.Append("Hello World!")	
		This.FoxBuilder.Insert(5, " Dear")
		This.MessageOut(This.FoxBuilder.ToString())
	Endfunc
&& ======================================================================== &&
&& Function TestReplace
&& ======================================================================== &&
	Function TestReplace
		This.FoxBuilder.Append("Hello World!")	
		This.FoxBuilder.Replace(5, 6, " My Dear ")
		This.MessageOut(This.FoxBuilder.ToString())
	Endfunc
&& ======================================================================== &&
&& Function TestReverse
&& ======================================================================== &&
	Function TestReverse
		This.FoxBuilder.Append("Hello World!")	
		This.MessageOut(This.FoxBuilder.Reverse())
	Endfunc
&& ======================================================================== &&
&& Function TestGetLines
&& ======================================================================== &&
	Function TestGetLines
		This.FoxBuilder.Append("Hello")
		This.FoxBuilder.Append("World!")
		This.MessageOut(Transform(This.FoxBuilder.GetLines()))
	EndFunc
&& ======================================================================== &&
&& Function TestVersion
&& ======================================================================== &&
	Function TestVersion
		This.MessageOut(This.FoxBuilder.GetVersion())
	Endfunc
Enddefine