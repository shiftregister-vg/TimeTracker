

<%@ page import="org.stevegood.timetracking.Entry" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'entry.label', default: 'Entry')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${entryInstance}">
            <div class="errors">
                <g:renderErrors bean="${entryInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="hoursSpent"><g:message code="entry.hoursSpent.label" default="Hours Spent" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: entryInstance, field: 'hoursSpent', 'errors')}">
                                    <g:textField name="hoursSpent" value="${fieldValue(bean: entryInstance, field: 'hoursSpent')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="minutesSpent"><g:message code="entry.minutesSpent.label" default="Minutes Spent" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: entryInstance, field: 'minutesSpent', 'errors')}">
                                    <g:textField name="minutesSpent" value="${fieldValue(bean: entryInstance, field: 'minutesSpent')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="entry.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: entryInstance, field: 'description', 'errors')}">
                                    <g:textField name="description" value="${entryInstance?.description}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dateWorked"><g:message code="entry.dateWorked.label" default="Date Worked" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: entryInstance, field: 'dateWorked', 'errors')}">
                                    <g:datePicker name="dateWorked" precision="day" value="${entryInstance?.dateWorked}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="project"><g:message code="entry.project.label" default="Project" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: entryInstance, field: 'project', 'errors')}">
                                    <g:select name="project.id" from="${org.stevegood.timetracking.Project.list()}" optionKey="id" value="${entryInstance?.project?.id}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
