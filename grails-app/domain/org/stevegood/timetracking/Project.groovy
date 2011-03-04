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
	
	int totalHours(){
		int minutes = 0
		entries.each{ e ->
			minutes += (((e.hoursSpent ?: 0) * 60)) + (e.minutesSpent ?: 0)
		}
		
		return Math.floor(minutes / 60) as int
	}
	
	int totalMinutes(){
		int calculatedMinutes = 0
		
		entries.each{ e ->
			calculatedMinutes += (((e.hoursSpent ?: 0) * 60)) + (e.minutesSpent ?: 0)
		}
		
		return (calculatedMinutes - (Math.floor(calculatedMinutes / 60) * 60)) as int
		
	}
}
