<cfcomponent output="false" accessors="true">
	<cfproperty name="mainbean"><cfscript>

	public void function init(fw) {
		variables.fw = fw;
	}

	public void function main(struct rc) {
		rc.anothertest = variables.mainbean.main( );
		rc.test2 = variables.fw.view( "main/main" );
	}


</cfscript>
</cfcomponent>