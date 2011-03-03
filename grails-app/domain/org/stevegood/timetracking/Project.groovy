package org.stevegood.timetracking

class Project {
	
	Date dateCreated
	Date lastUpdated
	
	String projectID
	String title
	ProjectStatus status = ProjectStatus.OPEN
	
	static hasMany = [entries:Entry]
	
    static constraints = {
		projectID blank:false, unique:true
		title blank:false
		status nullable:false
    }
	
	static mapping = {
		sort "title"
		entries sort:"dateWorked"
	}
	
	String toString(){
		projectID
	}
}
