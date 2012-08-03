<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'ui.jqgrid.css')}" />
        <link rel="stylesheet" href="${resource(dir:'css/ui-lightness',file:'jquery-ui-1.8.20.custom.css')}" />
        <link rel="stylesheet" href="${resource(file:'layout-default-latest.css')}" />
          <link rel="stylesheet" href="${resource(dir:'css',file:'layout-default-latest.css')}" />
       <link rel="stylesheet" href="${resource(dir:'css',file:'jquery.ui.tabs.css')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'jquery.ui.theme.css')}" />
        <g:javascript library="jquery-1.3.2.min"/>
        <g:javascript library="jquery-ui-1.7.2.custom.min"/>
       
         <g:javascript library="jquery.layout-latest"/>
          <g:javascript library="jquery.ui.all"/>
          <g:javascript library="jquery.ui.core"/>
           <g:javascript library="jquery.ui.draggable"/>
           <g:javascript library="jquery.ui.tabs"/>
            <g:javascript library="jquery.layout-1.2.0"/>
              <g:javascript library="themeswitchertool"/>
                <g:javascript library="debug"/>
                  <g:javascript library="jquery.ui.widget"/>
         
        <g:javascript library="jquery-1.3.2.min"/>
        <g:javascript library="jquery-ui-1.7.2.custom.min"/>
        <g:javascript library="grid.locale-en"/>
        <g:javascript library="jquery.jqGrid.min"/>
         <g:javascript library="jquery.layout-latest"/>
          <g:javascript library="jquery.ui.all"/>
          <g:javascript library="jquery.ui.core"/>
           <g:javascript library="jquery.ui.draggable"/>
           <g:javascript library="jquery.ui.tabs"/>
             <r:layoutResources/> 
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><g:layoutTitle default="Grails" /></title>
       
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />
    </head>
    <body>
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
        </div>
        <div id="grailsLogo"><a href="http://grails.org"><img src="${resource(dir:'images',file:'grails_logo.png')}" alt="Grails" border="0" /></a></div>
        <g:layoutBody />
    </body>
</html>