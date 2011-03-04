class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}
		
		"/"(controller:"project",action:"list")
		"/project/$action?/$projectID?"(controller:"project")
		"/entry/create/$projectID?"(controller:"entry",action:"create")
		"/entry/addNote/$id"(controller:"entry",action:"addNote")
		"500"(view:'/error')
	}
}
