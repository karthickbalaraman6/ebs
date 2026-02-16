from flask import Flask
import socket

application = Flask(__name__)

@application.route('/')
def home():
    hostname = socket.gethostname()
    return f"""
    <h1>Elastic Beanstalk CI/CD Demo</h1>
    <p>Successfully Deployed using CodePipeline + GitHub</p>
    <p>Running on Instance: {hostname}</p>
    """

@application.route('/health')
def health():
    return "Application is Healthy!"

if __name__ == '__main__':
    application.run(debug=True)

