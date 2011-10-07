<!--- A form to simulate login authentication.  Credential checking will be faked (not stored in a db).  
	1) The password will not matter as long as it is not blank. 
	2) The username will need to match one hard-coded inside of a service CFC. 
--->
<form id="myform" class="cssform" action="" method="post">
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