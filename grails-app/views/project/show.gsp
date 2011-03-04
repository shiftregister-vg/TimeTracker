
<%@ page import="org.stevegood.timetracking.Project" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
        <title>${ projectInstance?.projectID } - ${ projectInstance?.title }</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1>${ projectInstance?.title }</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                                       
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="project.projectID.label" default="Project ID" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: projectInstance, field: "projectID")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="project.status.label" default="Status" /></td>
                            
                            <td valign="top" class="value">${projectInstance?.status?.encodeAsHTML()}</td>
                            
                        </tr>
                        
                        <tr class="prop">
                        	<td valign="top" class="name"><g:message code="project.timespent.label" default="Total Time" /></td>
                        	<td valign="top" class="value">${ projectInstance.totalHours() } hours, ${ projectInstance.totalMinutes() } minutes</td>
                        </tr>
                    
                    	<tr class="prop">
                            <td valign="top" class="name"><g:message code="project.entries.label" default="Entries" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${projectInstance.entries.sort{ it.dateWorked }}" var="e">
                                    <li>
                                    	<g:link controller="entry" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link>
                                    	<ul>
                                    		<g:each in="${ e.notes.sort{ it.id } }" var="n">
                                    			<li>${n?.encodeAsHTML()}</li>
                                    		</g:each>
                                    	</ul>
                                    </li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form name="btnForm">
                    <g:hiddenField name="projectID" value="${projectInstance?.projectID}" />
                    <span class="button"><g:actionSubmit class="create" controller="entry" action="create" value="${message(code: 'default.add.label', args: [message(code: 'entry.label', default: 'Entry')])}" onclick="document.btnForm.action='${ createLink(controller:'entry', action:'create', params:[projectID:projectInstance?.projectID]) }';" /></span>
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" onclick="document.btnForm.action='/project/edit/${ projectInstance?.projectID }';" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
