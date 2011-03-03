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
	TSO('Test Signed Off'),
	WE('Waiting for External'),
	WI('Waiting for Internal'),
	CLOSED('Closed')
	
	final String id
	
	ProjectStatus(String id){ this.id = id }
	
	static list(){
		[OPEN,ANL,ASSIGNED,BUSO,HLD,PGM,QA,RMA,TSO,WE,WI,CLOSED]
	}
	
	String toString(){ id }
}
