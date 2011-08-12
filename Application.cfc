<cfcomponent extends="org.corfield.framework"><cfscript>
	// Either put the org folder in your webroot or create a mapping for it!
	
	this.name = 'toyapplication';
	this.sessionManagement = true;

	// FW/1 - configuration:
	variables.framework = {};
		variables.framework.defaultSection = 'main';
		variables.framework.defaultItem = 'main';
		variables.framework.reloadApplicationOnEveryRequest = true;
		// Switch OFF Implicit Service Calls
		variables.framework.suppressImplicitService = true;
	
	public function onRequestEnd() {
		writeoutput('<hr />');
		writedump(var=variables, showUDfs=false, expand=false, label='Variables');
		writedump(var=request, showUDfs=false, expand=true, label='Request');		
	}	
	
	public function setupApplication() {
	    // instantiate N. Dintenfass bean factory
	    serviceFactory = createObject("component","model.services.servicefactory");
		// register my service with the factory
	    serviceFactory.registerService( "main", createObject("component","model.services.main") );
	    //set the beanFactory
	    setBeanFactory(serviceFactory);		
	}
</cfscript>
</cfcomponent>