<cfcomponent output="false" accessors="true">
	<cfproperty name="mainbean"><cfscript>

	public void function init(fw) {
		variables.fw = fw;
	}

	public void function main(struct rc) {
		rc.anothertest = variables.mainbean.main( );
		writedump (var=variables, showUDFs=false);
	}


</cfscript>\
</cfcomponent>