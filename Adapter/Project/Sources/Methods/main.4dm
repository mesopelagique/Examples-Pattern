//%attributes = {}
_:=spec 

While (_.describe("While creating rectangle defined by corner"))
	
	$rectangle:=cs:C1710.Rectangle.new(10;10;100;150)
	
	While (_.it("it should not display"))
		_.expect(display ($rectangle)).to(_.beFalse())
	End while 
	
	While (_.describe("but with adapter"))
		$adapter:=cs:C1710.LegacyRectangle.new($rectangle)
		
		While (_.it("it should display"))
			_.expect(display ($adapter)).to(_.beTrue())
		End while 
		
	End while 
End while 