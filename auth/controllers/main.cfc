<cfcomponent output="false" accessors="true">
	<cfproperty name="usermanager"><cfscript>
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
    // check user.auth.loggedin value & force login form
    var loggedin = usermanager.hasCurrentUser( );  
    if ( !loggedin ) {
      // loop whitelist
      for ( var unsecured in ListToArray( whitelist ) ) {
        if ( ReFindNoCase( unsecured, fw.getFullyQualifiedAction() ) != 0 ) {
          securearea = false;
          break;
        }
      }
      if ( securearea ) {
        // secure area so redirect to login form
        userManager.setSendMeToAfterLogin(rc.action);
        fw.redirect( "auth:main" );
      }
    }
	}	


	public void function dologin(any rc) {
  	/* Will use this method to validate authentication credentials. */
  	var user = usermanager.getUser( rc.loginid, rc.password);
    if (user.auth.loggedin) {
      try{
        // Login passed
        fw.redirect( session.sendMeToAfterLogin );  
        // If you navigate direct to login page?  Catch that error and redirect to home page.  
        // If session expires before you submit a form, that may throw error too if form data expired (haven't tested)
      }  catch (expression e) {
        fw.redirect ("toy:main.main") ;
      }      
    } 
    // Login failed
    fw.setView("auth:main.main");
    //writedump(var="#local#", label="local@ doLogin()", expand="false");
	}	

  public void function dologout(any rc) {
    structclear(session);
    fw.setView("auth:main.main");
  }

</cfscript></cfcomponent>