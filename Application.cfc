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
		// Implicit Service Calls turned OFF by default as of FW/1 2.0, and must use FW/1 2.0 to get DI/1 
		// variables.framework.suppressImplicitService = true;
	
	public function onRequestEnd() {
		writeoutput('<hr />');
		writedump(var=session, showUDfs=false, expand=false, label='Session');
		writedump(var=request, showUDfs=false, expand=false, label='Request');		
	}	
	
	public function setupApplication() {
	    // DI/1 Bean Factory (bf)
	    variables.bf = new model.ioc( "/fw1toy/model", {strict="true" }); 
		// manage entire application with DI/1:
		setBeanFactory( bf );
		bf.addAlias("sampleuser", "user_sampleData");
	}

	public function setupRequest() {
	    // do the security checks
	    controller( "auth:main.main" );
	}
</cfscript>
</cfcomponent>