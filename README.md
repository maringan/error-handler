error-handler
=============

url: [http://error-receiver.herokuapp.com/](http://error-receiver.herokuapp.com/)

api_key: v1vB22hefsphwdAATXLDoJ79hpvi8IXQw9ujzRuUNKKn7

Example webhook:

```
curl -XPOST -v -H "Content-Type: application/json" -d '{"alert": { "created_at": "2012-11-01T18: 47: 18Z", "application_name": "Applicationname", "account_name": "Accountname", "severity": "critical", "message": "Errorratecrossedthecriticallevelof5.0%", "short_description": "domain.comalertopened", "long_description": "Alertopenedondomain.com: Errorratecrossedthecriticallevelof5.0%", "alert_url": "http: //rpm.newrelic.com/accounts/?????/applications/???????/incidents/???????" }}' http://error-receiver.herokuapp.com/api/v1/newrelic/webhook
```

[poor documentation](http://http://error-receiver.herokuapp.com/api/swagger_doc)