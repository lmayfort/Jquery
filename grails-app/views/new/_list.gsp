<%@ page import="Jquery.New" %>

<%@ page contentType="text/html;charset=UTF-8" %>
<!-- <g:render template="list" bean="${newInstance}" />-->
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>People List</title>
  </head>
  <body>
    <div> 
    <h1>People List</h1>
    <g:each in="${newInstance}" status="i" var="trip">

    <td><g:link action="show" id="${trip.id}">${trip.id?.encodeAsHTML()}</g:link></td>
    <td>${trip.firstName?.encodeAsHTML()}</td>
    <td>${trip.lastName?.encodeAsHTML()}</td>
 
</g:each>
 
    </div>

  </body>
</html>
