 curl -X POST \
  https://fcm.googleapis.com/fcm/send \
  -H 'authorization: key=AAAAtxNrXNQ:APA91bHibgCT6yIiyDE94Y6QOKJM_30Q7JPBi9HZKqm08m-c1dCEpf1mAaiqxNCCNdYiHY_hRywlbCGRVVK1JRbocqQFWjUCykb_pDrVgp8N8wOvXUth6s4ddIMNSn_lzMoEWVRDm1v8' \
  -H 'content-type: application/json' \
  -d '{
  "to": "eIVKZQTbSSeTvTXOxcVWnB:APA91bH4bhzsOlGfCAL36wGSxa-xGK2OexZAFt3oFCVgNSNUNig6eI8lPx0aEjnz5jGtaKc7o00UUNG5kFMnBk2i_YAHxKg7Pi8cWMJK4zc3D0R0yEP2bf4Hqfp7_Yh_F-yRy2RfKF2A", 
  "priority": "high",
  "content_available": true,
  "notification": {
    "empty": "body"
  },
  "data": {
    "type": "incoming_call",
    "nameCaller": "John Smith",
    "handle": "123456",
  }
}'

