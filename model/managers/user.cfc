<cfcomponent output="false" accessors="true">
	<cfproperty name="sampleuser">

	<cffunction name="hasCurrentUser">
		<cfscript>
			if (structkeyexists(session, "user")) {
				return session.user.auth.loggedin;
			}
			return sampleuser.hasCurrentUser ("notloggedin");
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
			return sampleuser.notloggedin();

		</cfscript>
	</cffunction>

	<cffunction name="setSendMeToAfterLogin" returntype="void" hint="capture only the first page requested. the login form will interrupt delivery of this page.">
		<cfargument name="toAction" type="string" required="true">
		<cfif not isdefined("session.sendMeTo")>
			<cfset session.sendMeToAfterLogin = arguments.toAction>
		</cfif>
	</cffunction>

</cfcomponent>