#!/bin/bash
if [ ! -z "$2"]; then
    format='{
        "name":  "Microsoft.ApplicationInsights.Event",
        "time":  "#datetime",
        "iKey":  "#aiInstrumentationKey",
        "tags":  {
                    "ai.cloud.roleInstance":  "#hostname",
                    "ai.internal.sdkVersion":  "dotnet:2.3.0-32439"
                },
        "data":  {
                    "baseType":  "EventData",
                    "baseData":  {
                                    "ver":  2,
                                    "name":  "myStartLinuxEvent",
                                    "properties":  {
                                                        "correlationid":  "#correlationid"
                                                    }
                                }
                }
    }';
    datetime=`date -Iseconds`;
    hostnameValue=`hostname`;
    format=${format/\#datetime/$datetime};
    format=${format/\#hostname/$hostnameValue};
    format=${format/\#correlationid/$1};
    format=${format/\#aiInstrumentationKey/$2};    
    curl -H "Content-Type: application/json" -X POST -d "$format" https://dc.services.visualstudio.com/v2/track
fi