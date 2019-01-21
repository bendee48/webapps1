require 'json'

data = '{
  "emails": [
    {
      "subject": "Cookies",
      "date": "21/01/2019",
      "from": "me"
      },
      {
        "subject": "More cookies",
        "date": "19/01/2019",
        "from": "Some next guy"
        }
      ]
}'

data = JSON.parse(data)

p data.keys
p data["emails"].first["subject"]
