//%attributes = {}
_:=spec

If (_#Null:C1517)
	
	While (_.describe("If not init"))
		While (_.it("it must have a null instance"))
			_.expect(cs:C1710.Singleton.instance).to(_.beNull())  // test could be run only one time, then it initilized
		End while 
	End while 
	
	$value1:="init 1"
	While (_.describe("If init"))
		
		cs:C1710.Singleton.new($value1)
		
		While (_.describe("it must have an instance"))
			_.expect(cs:C1710.Singleton.instance).notTo(_.beNull())
			
			While (_.it("with value passed at first init"))
				_.expect(cs:C1710.Singleton.instance.value).to(_.beEqualTo($value1))
			End while 
			
		End while 
		
	End while 
	
	While (_.describe("If we re-init"))
		
		$value:="init 2"
		cs:C1710.Singleton.new($value)
		
		While (_.describe("it must have an instance"))
			_.expect(cs:C1710.Singleton.instance).notTo(_.beNull())
			
			While (_.it("with value passed at first init, not second"))
				_.expect(cs:C1710.Singleton.instance.value).to(_.beEqualTo($value1))
			End while 
			
		End while 
		
		
	End while 
	
	While (_.describe("If we edit"))
		
		$value:="init 3"
		Use (cs:C1710.Singleton.instance)
			cs:C1710.Singleton.instance.value:="init 3"
		End use 
		
		While (_.describe("it must have an instance"))
			_.expect(cs:C1710.Singleton.instance).notTo(_.beNull())
			
			While (_.it("with value passed at this edit"))
				_.expect(cs:C1710.Singleton.instance.value).to(_.beEqualTo($value))
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