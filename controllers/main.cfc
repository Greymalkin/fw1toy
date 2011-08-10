<cfcomponent output="false"><cfscript>
	public void function init(fw) {
		variables.fw = fw;
	}

	public void function before(struct rc) {
		rc.beforeMethod = 'Before got called';
		rc.setFromController = 'Before';
	}
	
	public void function startMain(struct rc) {
		rc.startMethod = 'Start Item call';
		rc.setFromController = 'Beginning';
		rc.title = 'Start Item Changes the Title';
	}
	
	public void function main(struct rc) {
		rc.theMethod = 'The Item call';				
		rc.setFromController = 'Middle';
		variables.fw.service("main.main", "queued");		// Queue an Implicit Service Call
	}

	// This is the point in the Controller Cycle where an automatic implicit service call should happen
		
	public void function endMain(struct rc) {
		// This is the point in the Controller Cycle where the queued implicit service call should happen.
		rc.endMethod = 'End item call';
		rc.setFromController = 'End';		
	}
	
	public void function after(struct rc) {
		rc.afterMethod = 'After wraps it up';
		rc.SetFromController = 'Denoument';
	}
	
</cfscript>
</cfcomponent>