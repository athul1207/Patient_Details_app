from flask import Flask, render_template, request

app = Flask(__name__)

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/submit", methods=["POST"])
def submit():
    consulting_nurse_first = request.form.get("consulting_nurse_first")
    consulting_nurse_last = request.form.get("consulting_nurse_last")
    patient_first = request.form.get("patient_first")
    patient_last = request.form.get("patient_last")
    health_issue = request.form.get("health_issue")
    medication_response = request.form.get("medication_response")
    # Process the form data (e.g., save to database)
    return f"Form submitted! {consulting_nurse_first} {consulting_nurse_last} recorded patient {patient_first} {patient_last}'s details."

if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port=5000)
