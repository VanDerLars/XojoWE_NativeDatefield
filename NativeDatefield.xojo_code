#tag Class
Protected Class NativeDatefield
Inherits webcontrolwrapper
	#tag Event
		Sub Close()
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function ExecuteEvent(Name as String, Parameters() as Variant) As Boolean
		  select case name
		  case("ValueChanged")
		    'routename
		    
		    if Parameters.Ubound > -1 then
		      dim val as string = parameters(0)  
		      dim dat as Date = app.Date_Convert(val)
		      self.Value = dat
		      
		      RaiseEvent ValueChanged(dat)
		    else
		      //invalides Datum
		    end if
		    
		  case("GotValue")
		    'routename
		    
		    if Parameters.Ubound > -1 then
		      dim val as string = parameters(0)  
		      dim dat as Date = app.Date_Convert(val)
		      self.Value = dat
		    else
		      //invalides Datum
		    end if
		    
		  end select
		  
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  Open()
		  
		  
		  //self.ExecuteJavaScript("loadMap('" + self.MapID + "', '" + self.ControlID + "'); console.log('loadmap:  + " + self.MapID + " - " + self.ControlID + "');")
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub SetupCSS(ByRef Styles() as WebControlCSS)
		  Styles(0).Value("visibility") = "visible"
		  
		  if self.Visible = false then
		    Styles(0).Value("display") = "none"
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function SetupHTML() As String
		  
		  Dim source() As String
		  source.Append("<div id=""" + me.ControlID + """ class=""via_nativeDate via_ndf_" + self.ControlID + """ style="""">" )
		  source.Append(initiateItems_HTML())
		  source.append("</div>")
		  
		  Return Join(source,"")
		End Function
	#tag EndEvent

	#tag Event
		Sub Shown()
		  
		  Shown()
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function initiateItems_HTML() As String
		  dim ret() as String
		  
		  ret.Append("<input id=""nativeDate_" + self.ControlID + """ class=""" + self.WebStyleName + """ type=""date"" onblur=""NativeDateControlChanged('" + self.ControlID + "')"">")
		  
		  
		  
		  Return join(ret, "")
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Shown()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ValueChanged(Value as Date)
	#tag EndHook


	#tag Property, Flags = &h21
		Private mValue As Date
	#tag EndProperty

	#tag Property, Flags = &h0
		TextValue As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  self.ExecuteJavaScript("NativeDateControlGetValue('" + self.ControlID + "');")
			  
			  return mValue
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mValue = value
			  
			  dim d,m,y as String
			  y = value.Year.ToText
			  m = value.Month.ToText
			  d = value.Day.ToText
			  
			  if m.Len = 1 then m = "0" + m
			  if d.Len = 1 then d = "0" + d
			  
			  if y.Len = 1 then y = "000" + y
			  if y.Len = 2 then y = "00" + y
			  if y.Len = 3 then y = "0" + y
			  
			  dim js() as string
			  js.Append("var ndt = jQuery('#nativeDate_" + self.ControlID + "');")
			  js.Append("ndt.val('" + y + "-" + m + "-" + d + "');")
			  
			  
			  self.ExecuteJavaScript(join(js, EndOfLine))
			End Set
		#tag EndSetter
		Value As Date
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		WebStyleName As String
	#tag EndProperty


	#tag Constant, Name = JavascriptNamespace, Type = String, Dynamic = False, Default = \"SLN_via_NativeDate", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Cursor"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Automatic"
				"1 - Standard Pointer"
				"2 - Finger Pointer"
				"3 - IBeam"
				"4 - Wait"
				"5 - Help"
				"6 - Arrow All Directions"
				"7 - Arrow North"
				"8 - Arrow South"
				"9 - Arrow East"
				"10 - Arrow West"
				"11 - Arrow Northeast"
				"12 - Arrow Northwest"
				"13 - Arrow Southeast"
				"14 - Arrow Southwest"
				"15 - Splitter East West"
				"16 - Splitter North South"
				"17 - Progress"
				"18 - No Drop"
				"19 - Not Allowed"
				"20 - Vertical IBeam"
				"21 - Crosshair"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Behavior"
			InitialValue="25"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HorizontalCenter"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockHorizontal"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockVertical"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabOrder"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextValue"
			Visible=true
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="VerticalCenter"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="WebStyleName"
			Visible=true
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Behavior"
			InitialValue="150"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ZIndex"
			Group="Behavior"
			InitialValue="1"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_DeclareLineRendered"
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_HorizontalPercent"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_IsEmbedded"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_Locked"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_NeedsRendering"
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_OfficialControl"
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_OpenEventFired"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_VerticalPercent"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
