from flask import Flask, jsonify

app = Flask(__name__)

# Mock database of civic contacts matching the iOS App
CONTACTS = {
    "bescom": {"name": "BESCOM Helpline", "phone": "1912"},
    "bbmp": {"name": "BBMP Control Room", "phone": "1533"},
    "police": {"name": "Bengaluru Police", "phone": "112"}
}

@app.route("/")
def home():
    """Returns a welcome message."""
    return jsonify({"message": "Welcome to the Civic Hub API"})

@app.route("/contacts", methods=["GET"])
def get_contacts():
    """Returns the list of civic contacts."""
    return jsonify(CONTACTS)

@app.route("/contacts/<department_id>", methods=["GET"])
def get_contact(department_id):
    """Returns details for a specific department."""
    contact = CONTACTS.get(department_id)
    if contact:
        return jsonify(contact)
    return jsonify({"error": "Department not found"}), 404

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
