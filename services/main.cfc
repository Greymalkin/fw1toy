<cfcomponent output="false"><cfscript>
	public string function main() {
		var setFromService = 'convention: implicitly executed service: #now()#: #gettickcount()#';
		return setFromService;
	}
</cfscript></cfcomponent>