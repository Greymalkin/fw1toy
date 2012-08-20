<!--- A form to simulate login authentication.  Credential checking will be faked (not stored in a db).  --->
<cfset rc.title = "Login : Authentication Form">
<form id="myform" class="cssform" action="<cfoutput>#buildURL("main.dologin")#</cfoutput>" method="post">
	<div id="form-wrapper">
		<p>
			<label for="loginid"><span class="required">*</span> Username: </label>
			<input name="loginid" type="text" id="loginid" value="" />
		</p>
		<p>
			<label for="password"><span class="required">*</span> Password: </label>
			<input name="password" type="text" id="password" value="Whatever you want this to be" />
		</p>
		<p><input type="submit" value="Continue" name="continue"/></p>
	</div>	
</form>

