<cfcomponent output="false"><cfscript>
	public string function main() {
		var setFromService = 'main service: #now()#: #gettickcount()#';
		return setFromService;
	}
</cfscript></cfcomponent>