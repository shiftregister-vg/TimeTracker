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
		"${hoursSpent}h : ${minutesSpent}m - $description"
	}
	
	def beforeInsert = {
		processTimeSpent()
	}
	
	def beforeUpdate = {
		processTimeSpent()
	}
	
	private void processTimeSpent(){
		int calculatedMinutes = 0
		
		calculatedMinutes += (((this.hoursSpent ?: 0) * 60)) + (this.minutesSpent ?: 0)
		
		this.hoursSpent = Math.floor(calculatedMinutes / 60) as int
		this.minutesSpent = (calculatedMinutes - (this.hoursSpent * 60)) as int
	}
}
