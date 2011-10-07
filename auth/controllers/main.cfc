<cfcomponent output="false"><cfscript>
	public any function init(fw) {
		variables.fw = fw;
		return this;
	}

	public void function main(any rc) {
	/* No setup needed to display authentication form for first time or after an error.  
		If user enters bad data, I don't want to persist it.
		Will use this method to validate authentication credentials.
	*/
	}	

</cfscript></cfcomponent>