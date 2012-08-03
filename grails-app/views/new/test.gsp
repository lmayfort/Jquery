<%@ page import="Jquery.New" %>

<html>
  <head>
    
      
         <link rel="stylesheet" href="${resource(dir:'css',file:'layout-default-latest.css')}" />
       
        <g:javascript library="jquery-1.3.2.min"/>
        <g:javascript library="jquery-ui-1.7.2.custom.min"/>
       
         <g:javascript library="jquery.layout-latest"/>
          <g:javascript library="jquery.ui.all"/>
          <g:javascript library="jquery.ui.core"/>
           <g:javascript library="jquery.ui.draggable"/>
           <g:javascript library="jquery.ui.tabs"/>
            <g:javascript library="jquery.layout-1.2.0"/>
           <r:layoutResources/> 
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  
 <TITLE>Layout Example</TITLE>
 <script  type ="text/javascript">
$(document).ready(function () {
	$('body').layout({ applyDefaultStyles: true });
});
</SCRIPT>
</HEAD>
<BODY>
<DIV class="ui-layout-center">Center
	<P><A href="http://layout.jquery-dev.net/demos.html">Go to the Demos page</A></P>
	<P>* Pane-resizing is disabled because ui.draggable.js is not linked</P>
	<P>* Pane-animation is disabled because ui.effects.js is not linked</P>
</DIV>
<DIV class="ui-layout-north">North</DIV>
<DIV class="ui-layout-south">South</DIV>
<DIV class="ui-layout-east">East</DIV>
<DIV class="ui-layout-west">West</DIV>
</body>
</html>
