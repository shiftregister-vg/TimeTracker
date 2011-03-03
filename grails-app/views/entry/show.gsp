
<%@ page import="org.stevegood.timetracking.Entry" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'entry.label', default: 'Entry')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="entry.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: entryInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="entry.hoursSpent.label" default="Hours Spent" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: entryInstance, field: "hoursSpent")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="entry.minutesSpent.label" default="Minutes Spent" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: entryInstance, field: "minutesSpent")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="entry.description.label" default="Description" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: entryInstance, field: "description")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="entry.dateCreated.label" default="Date Created" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${entryInstance?.dateCreated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="entry.dateWorked.label" default="Date Worked" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${entryInstance?.dateWorked}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="entry.lastUpdated.label" default="Last Updated" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${entryInstance?.lastUpdated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="entry.notes.label" default="Notes" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${entryInstance.notes}" var="n">
                                    <li><g:link controller="note" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="entry.project.label" default="Project" /></td>
                            
                            <td valign="top" class="value"><g:link controller="project" action="show" params="[projectID:entryInstance?.project?.projectID]">${entryInstance?.project?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form name="btnForm">
                    <g:hiddenField name="id" value="${entryInstance?.id}" />
                    <span class="button"><g:actionSubmit class="create" controller="note" action="create" value="${message(code: 'default.add.label', args: [message(code: 'note.label', default: 'Note')])}" onclick="document.btnForm.action='${ createLink(action:'addNote', id:entryInstance?.id) }';" /></span>
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
