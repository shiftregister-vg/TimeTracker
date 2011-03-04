
<%@ page import="org.stevegood.timetracking.Project" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
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
                        
                            
                        
                            <g:sortableColumn property="projectID" title="${message(code: 'project.projectID.label', default: 'Project ID')}" />
                        
                            <g:sortableColumn property="title" title="${message(code: 'project.title.label', default: 'Title')}" />
                        
                            <g:sortableColumn property="status" title="${message(code: 'project.status.label', default: 'Status')}" />
                        
                            <g:sortableColumn property="lastUpdated" title="${message(code: 'project.lastUpdated.label', default: 'Last Updated')}" />
                            
                            <th>Time Spent</th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${projectInstanceList}" status="i" var="projectInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            
                        
                            <td><g:link action="show" params="[projectID:projectInstance.projectID]">${fieldValue(bean: projectInstance, field: "projectID")}</g:link></td>
                        
                            <td>${fieldValue(bean: projectInstance, field: "title")}</td>
                        
                            <td>${fieldValue(bean: projectInstance, field: "status")}</td>
                        
                            <td><g:formatDate date="${projectInstance.lastUpdated}" format="MM/dd/yyyy" /></td>
                            <td>${ projectInstance.totalHours() }h : ${ projectInstance.totalMinutes() }m</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${projectInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
