# SCHEME.js

_[Rick Ross - Stay Schemin](http://www.youtube.com/watch?v=-6ebutx-Fww)_

### Synopsys

This was created originally to help construct `request` URI's, by building each part of the URI separately I could easily have variables in the URI. This helps for oAuth.

### Build from object / json

	var build = scheme.build({
	    scheme: 'http',
	    host: 'localhost',
	    port: '3000',
	    path: [ 'application', 'login' ],
	    query: { user: 'github' }
	});
	console.log(build);

Return


	http://localhost:3000/application/login?user=github

### Synonyms

I realize that a lot of people (including myself) struggle with the names of each piece of a URI, knowing this, I made multiple things map to the same, using synonyms.

	["url","uri"],
	["scheme","protocol"],
	["username","user"],
	["password","pass"],
	["domain","host","domains","hostname"],
	["port"],
	["path","pathname","paths","pathnames"],
	["query","parameters","queries","search"],
	["hash","fragment","anchor"]
	
These only work for the input object, the output object is bound by the [parse_url](http://phpjs.org/functions/parse_url/) function from php.js.

	["scheme","host","user","pass","path","query","fragment"]
	
### Build from string

	var build = scheme.build("http://localhost:3000/application/login?user=github");
	console.log(build);	

Return 

	{
	  scheme: 'http',
	  host: 'localhost',
	  port: '3000',
	  path: [
	    'application',
	    'login'
	  ],
	  query: {
	    user: 'github'
	  }
	}

### Nesting

	var build = scheme.build({
	    "scheme": "https://",
	    "domain": "domain.com",
	    "path": "/login",
	    "query":{
	        "user":"thomasreggi",
	        "from":scheme.build({
	            "scheme": "https://",
	            "domain": "redirect.com",
	            "path": "/funstuff",
	        }),
	    }
	});
	console.log(build);

Return

	https://domain.com/login?user=thomasreggi&from=https%3A%2F%2Fredirect.com%2Ffunstuff

### Origin

* [stackoverflow.com - 13498417](http://stackoverflow.com/questions/13498417/build-urls-from-json)
* [stackoverflow.com - 13506460](http://stackoverflow.com/questions/13506460/how-to-extract-the-host-from-a-url-in-javascript/13506482#13506482)
