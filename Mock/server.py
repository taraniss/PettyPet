#!/usr/bin/env python
# -*- coding: utf-8 -*-

from __future__ import unicode_literals
import random
import datetime
from flask import Flask, request, jsonify


app = Flask(__name__)


@app.route("/cats")
def cats():
    # To get the same list of records everytime, call /cats?seed=something
    seed = request.args.get("seed")
    if seed is not None:
        random.seed(hash(seed))

    cats = []
    owners = []
    records = []

    for i in range(10):
        cats.append({
            "breed": random.choice(["Scottish Fold", "British Shorthair", "Ankara", "Van", "Tekir"]),
            "gender": random.choice(["make", "female", "none"]),
            "photos": ["kittybab%d" % random.randint(1, 10)],
            "city": random.choice(["Istanbul", "Ankara"]),
            "description": random.choice(["cok guzel", "cok cirkin"])
        })

    for i in range(10):
        owners.append({
            "name": random.choice([u"Ayse", u"Fatma", u"Ali", u"Huseyin"]),
            "surname": random.choice([u"Yilmaz", u"Kaya", u"Demir", u"Sahin"]),
            "phone": "053" + (8 * random.choice("0123456789"))
        })

    for i in range(10):
        records.append({
            "cat": cats[i],
            "date": datetime.datetime.today().isoformat(),
            "recordId": i + 1,
            "status": random.choice(["preparing", "active", "soldout"]),
            "owner": owners[i],
            "price": random.randint(10, 20) + round(random.random(), 2)
        })

    return jsonify(success=True, data=records)


if __name__ == "__main__":
    app.run(debug=True)
