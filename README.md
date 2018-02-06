# XojoWE_NativeDatefield
An easy and simple but performant Datepicker for the Xojo WebEdition


1. Simply download the Xojo file and drag'n'drop it into your Xojo Project.
2. After that you can drag the control on a web layout such as a webpage, a webcontainer or a webdialog
3. Add the function "Date_Convert" (as below) to your app object.
4. Now you need the to add the JavaScript code below to your App.HTMLHeader property and you're ready to go.
5. You can retrieve the date with the "ValueChanged" event or using the "Value" parameter.

![Screenshot](https://github.com/VanDerLars/XojoWE_NativeDatefield/blob/master/Bildschirmfoto%202018-02-05%20um%2016.33.26.png)


(3.) Add this function to your app object and name it "Date_Covert"

*this function converts a date object into a string (YYYY-MM-DD) and a string into a date object.*

```Xojo
Public Function Date_Convert(Date_ as Date) as String
  dim a1 as String = cstr(date_.Year)
  dim a2 as String = cstr(date_.Month)
  dim a3 as String = cstr(date_.Day)
  
  if a1.Len = 1 then a1 = "0" + a1
  if a2.Len = 1 then a2 = "0" + a2
  if a3.Len = 1 then a3 = "0" + a3
  
  
  Return a1 + "-" + a2 + "-" + a3
End Function


Public Function Date_Convert(Date_ as String) as Date
  try
    dim D as new Date
    'MsgBox(date_)
    dim s() as string = split(Date_, "-")
    if s.Ubound > 1 then
      if Left(s(2),1) = "0" then s(2) = ReplaceAll(s(2),"0","")
      if Left(s(1),1) = "0" then s(1) = ReplaceAll(s(1),"0","")
      
      
      D.Day = CDbl(s(2))
      D.Month =CDbl( s(1))
      D.Year =CDbl( s(0))
    Else
      s() = split(Date_, ".")
      if s.Ubound > 0 then
        if Left(s(0),1) = "0" then s(0) = ReplaceAll(s(0),"0","")
        if Left(s(1),1) = "0" then s(1) = ReplaceAll(s(1),"0","")
        
        
        D.Day = CDbl(s(0))
        D.Month =CDbl( s(1))
        D.Year =CDbl( s(2))  
      else
        D = nil    
      end if
    end if
    
    return D
  catch
  End try
End Function
```



(4.) Copy this to your App.HTMLHeader property

*This script collects the "onblur" event of the date input and triggeres it back to the server with the selected date value. It also gets the current date from the object, when you use the getter in the value property.*

```JavaScript
<script>
  // DateControl
function NativeDateControlChanged(controlid){
  var a = document.getElementById('nativeDate_' + controlid);
  var d = a.value;
  console.log (d);
  console.log('NativeDateControlChanged');
  Xojo.triggerServerEvent(controlid, 'ValueChanged', [d]);
}

function NativeDateControlGetValue(controlid){
  var a = document.getElementById('nativeDate_' + controlid);
  var d = a.value;
  console.log (d);
  console.log('NativeDateControlGetValue');
  Xojo.triggerServerEvent(controlid, 'GotValue', [d]);
}

</script>
```
