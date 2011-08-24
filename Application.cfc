<cfcomponent extends="org.corfield.framework"><cfscript>
	// Either put the org folder in your webroot or create a mapping for it!
	
	this.name = 'toyapplication';
	this.sessionManagement = true;

	// FW/1 - configuration:
	variables.framework = {};
		// setup subsystems
		variables.framework.usingSubsystems = true;
		variables.framework.siteWideLayoutSybsystem = 'common';
		variables.framework.defaultSubsystem = 'toy';
		variables.framework.defaultSection = 'main';
		variables.framework.defaultItem = 'main';
		variables.framework.reloadApplicationOnEveryRequest = true;
		variables.framework.suppressImplicitService = true;
	
	public function onRequestEnd() {
		writeoutput('<hr />');
		writedump(var=variables, showUDfs=false, expand=false, label='Variables');
		writedump(var=request, showUDfs=false, expand=true, label='Request');		
	}	
	
	public function setupApplication() {
	    // instantiate N. Dintenfass bean factory
	    serviceFactory = createObject("component","model.services.servicefactory");
	    serviceFactory.registerService( "main", createObject("component","model.services.main") );
	    setBeanFactory(serviceFactory);		
	}
</cfscript>
</cfcomponent>