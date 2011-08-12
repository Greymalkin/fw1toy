<cfcomponent output="false"><cfscript>
	public void function init(fw) {
		variables.fw = fw;
	}

	public void function main(struct rc) {
		rc.testAutowire = variables.myMainManager.main();
	}

	// Autowired Service Setup
	public void function setMainService(any mainManager) {
		variables.myMainManager = arguments.mainManager;
	}
</cfscript>
</cfcomponent>