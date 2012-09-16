<!---  Lets pretend like I have a database and that when I do a login I'm querying actual data.
		Then lets pretend that after all is said and done, I expect a User structure that I will persist.
		This cfc sets up some sample data models that I can call to make the application behave some kind of way.
 --->

<cfcomponent output="false">
<!--- DEV NOTE: Change so that the argument is not required
	* Then if the argument is passed in it can behave this way
	* But if argument is not passed in it looks at the session scope for a user object and returns user.auth.loggedin
  --->
	<cffunction name="hasCurrentUser">
		<cfargument name="sample" type="string" required="true">
		<cfscript>
			var method = this[ arguments.sample];			
			return method().auth.loggedIn;
		</cfscript>
	</cffunction>

	<cffunction name="notloggedin"><cfscript>
	user = {};
	user.auth = { LoggedIn = false,
		username = "",
		password = "",
		role = ""
	};
	user.personnel = { };
	user.security.roles = [ { } ];
	user.security.permissions = [ ];
	user.security.privileges = [ ];

	return user;
	</cfscript></cffunction>


	<cffunction name="admindata"><cfscript>
	user = {};
	user.auth = { LoggedIn = true,
		username = "admin",
		password = "admin",
		role = "Alpha"
	};
	user.personnel = { personnel_id = 1,
		first_name = "Patricia",
		last_name = "Lee"
	};
	user.security.roles = [ {role_id = 1, role = "Alpha", primary = true} ];
	user.security.permissions = ["all"];
	user.security.privileges = ["all"];																																																											

	return user;
	</cfscript></cffunction>

	<cffunction name="workeradata"><cfscript>
	user = {};
	user.auth = { LoggedIn = true,
		username = "workera",
		password = "workera",
		role = "Middle-UserA"
	};
	user.personnel = { personnel_id = 2,
		first_name = "Eric",
		last_name = "Cartman"
	};
	user.security.roles = [ {role_id = 8, role = "Middle-UserA", primary = true} ];
	user.security.permissions = ["AreaA", "AreaB"];
	user.security.privileges = [];

	return user;
	</cfscript></cffunction>

	<cffunction name="visitordata"><cfscript>
	user = {};
	user.auth = { LoggedIn = true,
		username = "visitor",
		password = "visitor",
		role = "Visitor"
	};
	user.personnel = { personnel_id = 2,
		first_name = "John",
		last_name = "Doe"
	};
	user.security.roles = [ {role_id = 6, role = "Visitor", primary = true} ];
	user.security.permissions = [];
	user.security.privileges = [];

	return user;
	</cfscript></cffunction> 	
</cfcomponent>