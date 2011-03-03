import org.stevegood.timetracking.*

class BootStrap {

    def init = { servletContext ->
		new Project(projectID:"WBSPT5650",title:"WR - MO - The element at position X cannot be found Deleting last driver",status:ProjectStatus.QA).save(flush:true)
    }
    def destroy = {
    }
}
