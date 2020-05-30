&& ======================================================================== &&
&& Class FoxStringBuilder
&& ======================================================================== &&
Define Class FoxStringBuilder As Session
	Hidden aString(1)
	Hidden nStringCounter
	Hidden cContent
	Hidden cVersion
&& ======================================================================== &&
&& Function Init
&& ======================================================================== &&
	Function Init As Void
		Lparameters tvData As Variant
		With This
			.nStringCounter = 0
			.cContent = ""
			.cVersion = "2020.30.05.23.54"
			If Pcount() = 1
				.Append(tvData)
			Endif
		EndWith
	Endfunc
&& ======================================================================== &&
&& Function Append
&& ======================================================================== &&
	Function Append As Void
		Lparameters tvData As Variant
		If Type("tvData") != "U"
			This.nStringCounter = This.nStringCounter + 1
			Dimension This.aString(This.nStringCounter)
			This.aString[This.nStringCounter] = This.ParseToString(tvData)
			This.cContent = This.cContent + This.aString[This.nStringCounter]
		Endif
	Endfunc
&& ======================================================================== &&
&& Hidden Function ParseToString
&& ======================================================================== &&
	Hidden Function ParseToString
		Lparameters tvData As Variant
		Local lcContent As String
		lcContent = ""
		If Type("tvData") == "O" And This.isBuilderObject(tvData)
			lcContent = tvData.ToString()
		Else
			lcContent = Transform(tvData)
		Endif
		Return lcContent
	Endfunc
&& ======================================================================== &&
&& Hidden Function isBuilderObject
&& ======================================================================== &&
	Hidden Function IsBuilderObject As Boolean
		Lparameters toObject As Object
		Local lbContinue As Boolean
		lbContinue = .T.
		Try
			toObject.ToString()
		Catch
			lbContinue = .F.
		Endtry
		Return lbContinue
	Endfunc
&& ======================================================================== &&
&& Function ToString()
&& ======================================================================== &&
	Function ToString() As String
		Return This.cContent
	Endfunc
&& ======================================================================== &&
&& Function AppendCodePoint()
&& ======================================================================== &&
	Function AppendCodePoint() As String
		Lparameters tnCodePoint As Integer
		If Type("tnCodePoint") == "N"
			This.Append(Chr(tnCodePoint))
		Endif
	Endfunc
&& ======================================================================== &&
&& Function Delete
&& ======================================================================== &&
	Function Delete() As Void
		Lparameters tnStart As Integer, tnEnd As Integer
		Local lcRemainingChar As String
		lcRemainingChar = Substr(This.cContent, tnStart, tnEnd - tnStart)
		This.cContent = Strtran(This.cContent, lcRemainingChar)
	EndFunc
&& ======================================================================== &&
&& Function DeleteCharAt
&& ======================================================================== &&
	Function DeleteCharAt() As Void
		Lparameters tnIndex As Integer
		This.Delete(tnIndex, tnIndex + 1)
	EndFunc
&& ======================================================================== &&
&& Function IndexOf
&& ======================================================================== &&
	Function IndexOf() As Integer
		Lparameters tcSearchExpression As String
		Return At(tcSearchExpression, This.cContent, 1)
	EndFunc	
&& ======================================================================== &&
&& Function Insert
&& ======================================================================== &&
	Function Insert() As Integer
		Lparameters tnOffset As Integer, tvData As Variant
		This.cContent = This.Replace(tnOffset, tnOffset, tvData)
	EndFunc
&& ======================================================================== &&
&& Function LastIndexOf
&& ======================================================================== &&
	Function LastIndexOf As Integer
		Lparameters tcSearchExpression As String
		Local lnOccurs As Integer, lnIndex As Integer
		lnOccurs = Occurs(tcSearchExpression, This.cContent)
		lnIndex  = 0
		If lnOccurs > 0
			lnIndex = At(tcSearchExpression, This.cContent, lnOccurs)			
		EndIf
		Return lnIndex
	EndFunc
&& ======================================================================== &&
&& Function Replace
&& ======================================================================== &&
	Function Replace As String
		Lparameters tnStart As Integer, tnEnd As Integer, tvData As Variant
		Local lcBeforeOffset As String, lcAfterOffset As String
		lcBeforeOffset = Substr(this.cContent, 1, tnStart)
		lcAfterOffset  = Substr(this.cContent, tnEnd + 1)
		This.cContent = lcBeforeOffset + This.ParseToString(tvData) + lcAfterOffset
		Return This.cContent
	EndFunc
&& ======================================================================== &&
&& Function Reverse
&& ======================================================================== &&
	Function Reverse As String
		lcContent = ""
		For nIndex = Len(This.cContent) to 1 step -1
			lcContent = lcContent + Substr(This.cContent, nIndex, 1)
		EndFor
		Return lcContent
	EndFunc
&& ======================================================================== &&
&& Function GetLines
&& ======================================================================== &&
	Function GetLines As Integer
		Return This.nStringCounter
	EndFunc
&& ======================================================================== &&
&& Function Version
&& ======================================================================== &&
	Function GetVersion As String
		Return This.cVersion
	EndFunc
Enddefine