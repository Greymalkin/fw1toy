<cfcomponent output="false"><cfscript>
	public string function main() {
		var setFromService = 'di-1 injected bean: main service: #now()#: #gettickcount()#';
		return setFromService;
	}
</cfscript></cfcomponent>