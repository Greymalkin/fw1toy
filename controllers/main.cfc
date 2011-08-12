<cfcomponent output="false"><cfscript>
	public void function init(fw) {
		variables.fw = fw;
	}

	public void function main(struct rc) {
		rc.testAutowire = main.main();
	}
	
	// Autowired Service Setup
	public void function setMain(any main) {
		variables.main = arguments.main;
	}

</cfscript>
</cfcomponent>