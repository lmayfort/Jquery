
<%@ page import="Jquery.New" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'new.label', default: 'New')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'new.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="firstName" title="${message(code: 'new.firstName.label', default: 'First Name')}" />
                        
                            <g:sortableColumn property="lastName" title="${message(code: 'new.lastName.label', default: 'Last Name')}" />
                        
                            <g:sortableColumn property="someDate" title="${message(code: 'new.someDate.label', default: 'Some Date')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                     
                    <g:each in="${newInstanceList}" status="i" var="newInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${newInstance.id}">${fieldValue(bean: newInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: newInstance, field: "firstName")}</td>
                        
                            <td>${fieldValue(bean: newInstance, field: "lastName")}</td>
                        
                            <td>${fieldValue(bean: newInstance, field: "someDate")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${newInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
