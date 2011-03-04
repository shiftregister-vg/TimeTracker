package org.stevegood.util

class Note {
	
	Date dateCreated
	Date lastUpdated
	
	String body
	
    static constraints = {
		body blank:false
    }
	
	static mapping = {
		body type:"text"
	}
	
	String toString(){
		"$body [${ dateCreated.format('MM/dd/yyyy') }]"
	}
}
