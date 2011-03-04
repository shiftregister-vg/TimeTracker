package org.stevegood.timetracking

import grails.test.*

class ProjectIntegrationTests extends GroovyTestCase {
    
	def project
	
	protected void setUp() {
        super.setUp()
		
		if (Project.findByProjectID("ABCTEST123")){
			Project.findByProjectID("ABCTEST123").delete(flush:true)
		}
		
		project = new Project(projectID:"ABCTEST123",title:"An Integration Test Project",status:ProjectStatus.OPEN).save(flush:true,failOnError:true)
		project.addToEntries(new Entry(project:project,hoursSpent:2,minutesSpent:30,description:"Entry 1",dateWorked:new Date()).save(flush:true,failOnError:true))
		project.addToEntries(new Entry(project:project,hoursSpent:5,minutesSpent:0,description:"Entry 2",dateWorked:new Date()).save(flush:true,failOnError:true))
		project.addToEntries(new Entry(project:project,hoursSpent:0,minutesSpent:30,description:"Entry 3",dateWorked:new Date()).save(flush:true,failOnError:true))
		project.addToEntries(new Entry(project:project,hoursSpent:0,minutesSpent:15,description:"Entry 4",dateWorked:new Date()).save(flush:true,failOnError:true))
    }

    protected void tearDown() {
        super.tearDown()
		if (project) project.delete(flush:true)
    }

    void testTotalHours(){
		assertEquals 8, project.totalHours()
    }
	
	void testTotalMinutes(){
		assertEquals 15, project.totalMinutes()
	}
}
