package org.stevegood.timetracking

enum ProjectStatus {
	
    OPEN('Open'),
	ANL('Analysis'),
	ASSIGNED('Assigned'),
	BUSO('Business User Sign Off'),
	HLD('Hold'),
	PGM('Programming'),
	QA('QA'),
	RMA('Ready for Approval to Promote'),
	SO('User Sign Off'),
	SOM('Ok to Promote'),
	TSO('Test Signed Off'),
	WE('Waiting for External'),
	WI('Waiting for Internal'),
	WTC('Waiting to Close'),
	WTS('Writing Tech Specs'),
	CLOSED('Closed')
	
	final String id
	
	ProjectStatus(String id){ this.id = id }
	
	static list(){
		[OPEN,ANL,ASSIGNED,BUSO,HLD,PGM,QA,RMA,SO,SOM,TSO,WE,WI,WTC,WTS,CLOSED]
	}
	
	String toString(){ id }
}
