

Class constructor
	// Singleton data
	C_VARIANT:C1683(${1})
	
	This:C1470.value:=$1
	
	This:C1470.col:=New collection:C1472()
	var $index : Integer
	For ($index; 1; Count parameters:C259; 1)
		This:C1470.col.push(${$index})
	End for 
	
	// Singleton management
	singletonize(This:C1470)