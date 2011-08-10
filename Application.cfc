<cfcomponent extends="org.corfield.framework"><cfscript>
	// Either put the org folder in your webroot or create a mapping for it!
	
	this.name = 'toyapplication';
	this.sessionManagement = true;

	// FW/1 - configuration:
	variables.framework = {};
		variables.framework.defaultSection = 'main';
		variables.framework.defaultItem = 'main';
		variables.framework.reloadApplicationOnEveryRequest = true;
		// Switch ON Implicit Service Calls
		variables.framework.suppressImplicitService = false;
	
	public function onRequestEnd() {
		writeoutput('<hr />');
		writedump(var=variables, showUDfs=false, expand=false, label='Variables');
		writedump(var=request, showUDfs=false, expand=true, label='Request');		
	}	
</cfscript>
</cfcomponent>