
<%@ page import="Jquery.Tab" %>
<html>
    <head>
      <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'js/css/ui.jqgrid.css')}" />
        
        <link rel="stylesheet" href="${resource(file:'layout-default-latest.css')}" />
        <g:javascript library="js/jquery-1.7.2.min"/>
        <g:javascript library="jquery-ui-1.7.2.custom.min"/>
        <g:javascript library="grid.locale-en"/>
        <g:javascript library="js/jquery.jqGrid.min"/>
        <g:javascript library="js/jquery.jqGrid.src"/>
         <g:javascript library="jquery.layout-latest"/>
          <g:javascript library="jquery.ui.all"/>
          <g:javascript library="jquery.ui.core"/>
           <g:javascript library="jquery.ui.draggable"/>
           <g:javascript library="jquery.ui.tabs"/>
<!--   rowedex3.js  -->
          
 
	<style type="text/css">
 
	p {
		font-size:		1em;
		margin:			1ex 0;
	}
	p.buttons {
		text-align:		center;
		line-height:	2.5em;
	}
	button {
		line-height:	normal;
	}
	.hidden {
		display:		none;
	}
 
	/*
	 
	Rules for simulated drop-down/pop-up lists
	 */
	ul {
		/* rules common to BOTH inner and outer UL */
		z-index:	100000;
		margin:		1ex 0;
		padding:	0;
		list-style:	none;
		cursor:		pointer;
		border:		1px solid Black;
		/* rules for outer UL only */
		width:		15ex;
		position:	relative;
	}
	ul li {
		background-color: #EEE;
		padding: 0.15em 1em 0.3em 5px;
	}
	ul ul {
		display:	none;
		position:	absolute;
		width:		100%;
		left:		-1px;
		/* Pop-Up */
		bottom:		0;
		margin:		0;
		margin-bottom: 1.55em;
	}
	.ui-layout-north ul ul {
		/* Drop-Down */
		bottom:		auto;
		margin:		0;
		margin-top:	1.45em;
	}
	ul ul li		{ padding: 3px 1em 3px 5px; }
	ul ul li:hover	{ background-color: #FF9; }
	ul li:hover ul	{ display:	block; background-color: #EEE; }
 
	</style>
 
	
        <script>
	function toggleLiveResizing () {
		$.each( $.layout.config.borderPanes, function (i, pane) {
			var o = myLayout.options[ pane ];
			o.livePaneResizing = !o.livePaneResizing;
		});
	};
	</script>
       
 
	
</head>

<body>
  <div class="body">
            <h1>City List</h1>

            <!-- table tag will hold our grid -->
            <table id="tab_list" class="scroll jqTable" cellpadding="0" cellspacing="0"></table>
            <!-- pager will hold our paginator -->
            <div id="tab_list_pager" class="scroll" style="text-align:center;"></div>

            <script type="text/javascript">
//            /* when the page has finished loading.. execute the follow */
//            $(document).ready(function () {
//                jQuery("#tab_list").jqGrid({
//                  url:'jq_tab_list',
//                  datatype: "json",
//                  colNames:['Name','City','id'],
//                  colModel:[
//                    {name:'name'},
//                    {name:'city'},
//                    {name:'id'}
//                  ],
//                  pager: jQuery('#tab_list_pager'),
//                  viewrecords: true,
//                  gridview: true
//                });
//            });
             
             $("#bedata").click(function(){ 
               var gr = jQuery("#editgrid").jqGrid('getGridParam','selrow'); 
               if( gr != null ) jQuery("#editgrid").jqGrid('editGridRow',gr,{height:280,reloadAfterSubmit:false}); 
               else alert("Please Select Row"); });
             jQuery("#tab_list").jqGrid({ 
               url:'jq_tab_list', 
               datatype: "json",
               colNames:['Name','City', 'id'], 
               colModel:[ {name:'name', width:200}, 
                 {name:'city', width:250,  align:"right"}, 
                 {name:'id', width:10}, 
                ], rowNum:10, 
                rowList:[10,20,30], 
                pager: '#tab_list_pager', 
                sortname: 'id', 
                viewrecords: true, 
                sortorder: "desc", 
                caption:"People and Cities" }); 
              jQuery("#tab_list").jqGrid('navGrid','#tab_list_pager',{edit:true,add:false,del:false});
            </script>
           
      </div>


 

    


    </body>
</html>
