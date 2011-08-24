<cfcomponent output="false"><cfscript>
	public void function init(fw) {
		variables.fw = fw;
	}

	public void function main(struct rc) {
		rc.testAutowire = variables.mainService.main();
	}

	// Autowired Service Setup
	public void function setMainService(any mainService) {
		variables.mainService = arguments.mainService;
	}

</cfscript>
</cfcomponent>