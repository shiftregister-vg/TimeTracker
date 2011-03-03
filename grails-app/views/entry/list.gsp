
<%@ page import="org.stevegood.timetracking.Entry" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'entry.label', default: 'Entry')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'entry.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="hoursSpent" title="${message(code: 'entry.hoursSpent.label', default: 'Hours Spent')}" />
                        
                            <g:sortableColumn property="minutesSpent" title="${message(code: 'entry.minutesSpent.label', default: 'Minutes Spent')}" />
                        
                            <g:sortableColumn property="description" title="${message(code: 'entry.description.label', default: 'Description')}" />
                        
                            <g:sortableColumn property="dateCreated" title="${message(code: 'entry.dateCreated.label', default: 'Date Created')}" />
                        
                            <g:sortableColumn property="dateWorked" title="${message(code: 'entry.dateWorked.label', default: 'Date Worked')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${entryInstanceList}" status="i" var="entryInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${entryInstance.id}">${fieldValue(bean: entryInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: entryInstance, field: "hoursSpent")}</td>
                        
                            <td>${fieldValue(bean: entryInstance, field: "minutesSpent")}</td>
                        
                            <td>${fieldValue(bean: entryInstance, field: "description")}</td>
                        
                            <td><g:formatDate date="${entryInstance.dateCreated}" /></td>
                        
                            <td><g:formatDate date="${entryInstance.dateWorked}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${entryInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
