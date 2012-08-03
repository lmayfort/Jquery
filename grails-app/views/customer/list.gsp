
<%@ page import="Jquery.Customer" %>
<html>
    <head>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'ui.jqgrid.css')}" />
        <link rel="stylesheet" href="${resource(dir:'css/ui-lightness',file:'jquery-ui-1.8.20.custom.css')}" />
        <g:javascript library="jquery-1.3.2.min"/>
        <g:javascript library="jquery-ui-1.7.2.custom.min"/>
        <g:javascript library="grid.locale-en"/>
        <g:javascript library="jquery.jqGrid.min"/>
    </head>
    <body>
       <div class="body">
            <h1>Customer List</h1>

            <!-- table tag will hold our grid -->
            <table id="customer_list" class="scroll jqTable" cellpadding="0" cellspacing="0"></table>
            <!-- pager will hold our paginator -->
            <div id="customer_list_pager" class="scroll" style="text-align:center;"></div>

            <script type="text/javascript">
            /* when the page has finished loading.. execute the follow */
            $(document).ready(function () {
                jQuery("#customer_list").jqGrid({
                  url:'jq_customer_list',
                  datatype: "json",
                  colNames:['First Name','Last Name','Age','Email Address','id'],
                  colModel:[
                    {name:'firstName'},
                    {name:'lastName'},
                    {name:'age'},
                    {name:'email'},
                    {name:'id'}
                  ],
                  pager: jQuery('#customer_list_pager'),
                  viewrecords: true,
                  gridview: true
                });
            });
            </script>
            
            <div class="buttons">
                <g:form>
                  <g:hiddenField name="id" value="${jq_customer_list?.id}" />
                   <span class="button"><g:actionSubmit class="create" action="create" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                     <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                     <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
                </g:form>
            </div>
      
      </div>
    </body>
</html>