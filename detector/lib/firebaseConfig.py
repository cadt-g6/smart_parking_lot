import firebase_admin
from firebase_admin import credentials
import os
from dotenv import load_dotenv
load_dotenv()


def initializeFirebase():

    cred = credentials.Certificate(os.environ.get('FIREBASE_CRED_PATH'))
    firebase_admin.initialize_app(cred)