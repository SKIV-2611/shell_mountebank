curl -i -X POST -H 'Content-Type: application/json' http://localhost:2525/imposters --data "{\
    \"protocol\": \"http\",\
    \"port\": 4545,\
    \"recordRequests\": true,\
    \"stubs\": [\
        {\
            \"responses\": [\
                {\
                    \"is\": {\
                        \"statusCode\": 200\
                    }\
                }\
            ],\
            \"predicates\": [\
                {\
                    \"and\": [\
                        {\
                            \"equals\": {\
                                \"path\": \"/api/Payments\",\
                                \"method\": \"POST\",\
                                \"headers\": {\
                                    \"Content-Type\": \"application/json\"\
                                }\
                            }\
                        },\
                        {\
                            \"or\": [\
                                {\
                                    \"contains\": [\
                                        \"paymentDetails\",\
                                        \"test\"\
                                    ]\
                                },\
                                {\
                                    \"contains\": [\
                                        \"paymentDetails\",\
                                        \"!тест\"\
                                    ]\
                                }\
                            ]\
                        }\
                    ]\
                }\
            ]\
        },\
        {\
            \"predicates\": [\
                {\
                    \"and\": [\
                        {\
                            \"equals\": {\
                                \"path\": \"/api/Payments\",\
                                \"method\": \"POST\",\
                                \"Content-Type\": \"application/json\"\
                            }\
                        },\
                        {\
                            \"not\": {\
                                \"contains\": [\
                                    \"!test\"\
                                ]\
                            }\
                        }\
                    ]\
                }\
            ],\
            \"responses\": [\
                {\
                    \"proxy\": {\
                        \"to\": \"http://localhost:54616/api/Payments\",\
                        \"mode\": \"proxyTransparent\"\
                    }\
                }\
            ]\
        }\
    ]\
}"