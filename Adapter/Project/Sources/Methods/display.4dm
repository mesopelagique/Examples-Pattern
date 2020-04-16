//%attributes = {}
C_OBJECT:C1216($1;$shape)
$shape:=$1

  //ALERT(String($shape.x)+";"+String($shape.y)+";"+String($shape.width)+";"+String($shape.heigth))

  // Is it ok to display
C_BOOLEAN:C305($0)
$0:=($shape.x#Null:C1517) & ($shape.y#Null:C1517) & ($shape.width#Null:C1517) & ($shape.height#Null:C1517)
