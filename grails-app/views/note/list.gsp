
<%@ page import="org.stevegood.util.Note" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'note.label', default: 'Note')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'note.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="body" title="${message(code: 'note.body.label', default: 'Body')}" />
                        
                            <g:sortableColumn property="dateCreated" title="${message(code: 'note.dateCreated.label', default: 'Date Created')}" />
                        
                            <g:sortableColumn property="lastUpdated" title="${message(code: 'note.lastUpdated.label', default: 'Last Updated')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${noteInstanceList}" status="i" var="noteInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${noteInstance.id}">${fieldValue(bean: noteInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: noteInstance, field: "body")}</td>
                        
                            <td><g:formatDate date="${noteInstance.dateCreated}" /></td>
                        
                            <td><g:formatDate date="${noteInstance.lastUpdated}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${noteInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
