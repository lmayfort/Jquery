

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <link href='${resource( dir:'css/ui-lightness', file:'jquery-ui-1.8.20.custom.css')}' rel='stylesheet' type='text/css' />
    <link href='${resource( dir:'css', file:'layout-default-latest.css')}' rel='stylesheet' type='text/css' />
     <link href='${resource( dir:'css', file:'ui.tabs.css')}' rel='stylesheet' type='text/css' />
     <link href='${resource( dir:'css', file:'main.css')}' rel='stylesheet' type='text/css' />
      <g:javascript library="prototype" />


    <g:javascript src="jquery-ui-1.8.20.custom.css" />
      <g:javascript src="jquery.layout-latest"/>
    <title>Testing Tabs</title>
  </head>
  <body>
    <h1>Testing Simple Tabs</h1>
    <DIV id="tabs">
   
       <A href="#tabs-1">Tab 1</A>
       <A href="#tabs-2">Tab 2</A>
       <A href="#tabs-3">Tab 3</A>
   
	
</DIV>

    <g:javascript src="demo-modified-ajax.js" />
    <g:javascript library="underscore" />
    <g:javascript library="backbone" />

    <g:javascript>

   

      // This jquery syntax invokes jquery in general (why is it at the end?):
      $(document).ready(function() {
        // This selector "activates" the jquery tab component:
        $( '#tabs' ).tabs({selected: 0});
 

    </g:javascript>

  </body>
</html>
