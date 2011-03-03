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
		"500"(view:'/error')
	}
}
