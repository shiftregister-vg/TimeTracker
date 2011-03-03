package org.stevegood.timetracking

import org.stevegood.util.Note

class Entry {
	
	Date dateCreated
	Date lastUpdated
	
	Project project
	Date dateWorked
	int minutesSpent = 0
	int hoursSpent = 0
	
	String description
	
	static belongsTo = [Project]
	static hasMany = [notes:Note]
	
    static constraints = {
		hoursSpent max:24
		minutesSpent max:1440
		description blank:true,nullable:true
    }
	
	static mapping = {
		description type:"text"
	}
	
	String toString(){
		"$hoursSpent:$minutesSpent - $description"
	}
}
