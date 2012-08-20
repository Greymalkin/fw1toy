<cfcomponent output="false" accessors="true">
	<cfproperty name="sampleuser"><cfscript>
	public any function init(fw) {
		variables.fw = fw;
		return this;
	}

	public void function main(any rc) {
	// An implementation of http://www.aliaspooryorik.com/blog/index.cfm/e/posts.details/post/simple-security-in-fw-1-336
    // security check, assume everything is secured apart from the whitelist
    var securearea = true; 
    // white list is a comma delimited list of regular expressions to match unsecure actions
    // NOTE: I don't have a Public subsection yet but it is an idea I may pursue at some point
    var whitelist = "^public:,^auth:";
    var loggedin = variables.sampleuser.hasCurrentUser( "notloggedin" );
    
    if ( !loggedin ) {
      // loop whitelist
      for ( var unsecured in ListToArray( whitelist ) ) {
        if ( ReFindNoCase( unsecured, variables.fw.getFullyQualifiedAction() ) != 0 ) {
          securearea = false;
          break;
        }
      }
      if ( securearea ) {
        // secure area so redirect to login form
        variables.fw.redirect( "auth:main" );
      }
    }
// DEBUG    writeDump(var="#local#");    request.layout = false;
	}	


	public void function dologin(any rc) {
	/* Will use this method to validate authentication credentials. */

	var user = variables.sampleuser.getUser( rc.loginid, rc.password);
	writedump(var="#local#", abort="true", label="local@ doLogin()");


	}	

</cfscript></cfcomponent>