curl -i -X POST -H 'Content-Type: application/json' http://localhost:2525/imposters --data "{\
  \"port\": 4545,\
  \"protocol\":\"http\",\
  \"stubs\": [\
    {\
      \"responses\": [\
	    { \"is\": { \"statusCode\": 200 }}\
	  ],\
	  \"predicates\": [\
	  {\
	    \"and\": [\
		  {\
		    \"equals\": {\
			  \"path\": \"/api/Payments\",\
			  \"method\": \"POST\",\
			  \"headers\": { \"Content-Type\": \"application/json\" }\
		    }\
	      },\
		{\
		  \"or\": [\
		    {\"contains\": [\"paymentDetails\",\"test\"]},\
			{\"contains\": [\"paymentDetails\", \"!тест\"]}\
		  ]}]}]},{\"responses\": [{\"proxy\": {\"to\": \"http://localhost:54616/api/Payments\",\"mode\": \"proxyTransparent\"}}]}]}"