<cfcomponent output="false" accessors="true">
	<cfproperty name="sampleuser">

	<cffunction name="hasCurrentUser">
		<cfargument name="sample" type="string" required="true">
		<cfscript>
			if (structkeyexists(session, "user")) {
				return true;
			}
			return variables.sampleuser.hasCurrentUser( arguments.sample ); 
		</cfscript>
	</cffunction>

	<cffunction name="persistUser" returntype="void">
		<cfargument name="sample" type="string" required="true"/>
		<cfscript>
			var getData = variables.sampleuser [ arguments.sample];			
//DEBUG  	var userData = getData();	writedump(var="#local#", abort="true");
		</cfscript>
		<cfset session.user = getData()>			
	</cffunction>
</cfcomponent>