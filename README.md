# XojoWE_NativeDatefield
An easy and simple but performant Datepicker for the Xojo WebEdition


1. Simply download the Xojo file and drag'n'drop it into your Xojo Project.
2. After that you can drag the control on a web layout such as a webpage, a webcontainer or a webdialog
3. Now you need the to add the JavaScript code below to your App.HTMLHeader property and you're ready to go.
4. You can retrieve the date with the "ValueChanged" event or using the Value parameter

![Screenshot](https://github.com/VanDerLars/XojoWE_NativeDatefield/blob/master/Bildschirmfoto%202018-02-05%20um%2016.33.26.png)


Copy this to your App.HTMLHeader property:
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
