#!/bin/bash
burp=$(find / -name burp*.jar 2>/dev/null | tail -1)
java_cmd=$(which java || echo "/usr/bin/java")
timeout 45 "$java_cmd" -Djava.awt.headless=true -jar "$burp" < <(echo y) &
sleep 30
curl http://localhost:8080/cert -o /tmp/cacert.der
exit