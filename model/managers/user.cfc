<cfcomponent output="false" accessors="true">
	<cfproperty name="sampleuser">

	<cffunction name="hasCurrentUser">
		<cfargument name="sample" type="string" required="true">
		<cfscript>
			if (structkeyexists(session, "user")) {
				return true;
			}
			return variables.sampleuser.hasCurrentUser ("notloggedin");		//( arguments.sample ); 
		</cfscript>
	</cffunction>

	<cffunction name="persistUser" returntype="void">
		<cfargument name="sample" type="struct" required="true"/>
		<cfset session.user = sample>			
	</cffunction>

	<cffunction name="getUser">
		<cfargument name="username" type="string" required="true">
		<cfargument name="password" type="string" required="true">
		<cfscript>
			var userData = structnew();
			if (username eq "admin" and password eq "admin") {
				userData =  variables.sampleuser.admindata();
			}
			if (username eq "workera" and password eq "workera") {
				userData = variables.sampleuser.workeradata();
			}
			if (username eq "visitor" and password eq "visitor") {
				userData = variables.sampleuser.visitordata();
			}
			if (not structisempty(userData)) {
				persistUser(userData);
				return userData;
			}
			return variables.sampleuser.notloggedin();

		</cfscript>
	</cffunction>

</cfcomponent>