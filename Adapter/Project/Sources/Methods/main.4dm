//%attributes = {}
_:=spec

If (_#Null:C1517)
	
	While (_.describe("While creating rectangle defined by corner"))
		
		$rectangle:=cs:C1710.Rectangle.new(10; 10; 100; 150)
		
		While (_.it("it should not display"))
			_.expect(display($rectangle)).to(_.beFalse())
		End while 
		
		While (_.describe("but with adapter"))
			$adapter:=cs:C1710.LegacyRectangle.new($rectangle)
			
			While (_.it("it should display"))
				_.expect(display($adapter)).to(_.beTrue())
			End while 
			
		End while 
	End while 
	
Else 
	C_TEXT:C284($in; $out; $err)
	SET ENVIRONMENT VARIABLE:C812("_4D_OPTION_CURRENT_DIRECTORY"; Folder:C1567(fk database folder:K87:14).platformPath)
	LAUNCH EXTERNAL PROCESS:C811("/usr/local/bin/kaluza install"; $in; $out; $err)
	If (Folder:C1567(fk database folder:K87:14).folder("Components").folder("expect.4dbase").exists)
		
		CONFIRM:C162("You must restart, BDD test component has been installed by kaluza")
		If (OK=1)
			RESTART 4D:C1292()
		End if 
	Else 
		CONFIRM:C162("To launch this databse test you need to add BDD component expect\nhttps://github.com/mesopelagique/expect\n Open the url?")
		If (OK=1)
			OPEN URL:C673("https://github.com/mesopelagique/expect")
		End if 
	End if 
End if 