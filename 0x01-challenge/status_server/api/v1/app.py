#!/usr/bin/python3
"""
Web server 
"""
from api.v1.views import app_views, status
from flask import Flask, jsonify, make_response

app = Flask(__name__)
app.register_blueprint(app_views)


@app.errorhandler(404)
def not_found(error):
    """ json 404 page """
    return make_response(jsonify({"error": "Not found"}), 404)

app.add_url_rule('/api/v1/status', endpoint='status', view_func=status, methods=['GET'])
app.add_url_rule('/api/v1/status/', endpoint='status/', view_func=status, methods=['GET'])

if __name__ == "__main__":
    # python -m api.v1.app 
    app.run(host="0.0.0.0", port=5000)
