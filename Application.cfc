<cfcomponent extends="org.corfield.framework"><cfscript>
	// Either put the org folder in your webroot or create a mapping for it!
	
	this.name = 'toyapplication';
	this.sessionManagement = true;

	// FW/1 - configuration:
	variables.framework = {};
		variables.framework.defaultSection = 'main';
		variables.framework.defaultItem = 'main';
		variables.framework.reloadApplicationOnEveryRequest = true;
		// Implicit Service Calls turned OFF by default as of FW/1 2.0, and must use FW/1 2.0 to get DI/1 
		// variables.framework.suppressImplicitService = true;
	
	public function onRequestEnd() {
		writeoutput('<hr />');
		writedump(var=variables, showUDfs=false, expand=false, label='Variables');
		writedump(var=request, showUDfs=false, expand=true, label='Request');		
	}	
	
	public function setupApplication() {
	    // DI/1 Bean Factory (bf)
	    variables.bf = new model.ioc( "/fw1toy/model" ); 
		// manage entire application with DI/1:
		setBeanFactory( bf );
	}
</cfscript>
</cfcomponent>