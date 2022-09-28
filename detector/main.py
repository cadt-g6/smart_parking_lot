import json
import pickle
import cvzone
import cv2
import numpy as np
from lib.firebaseConfig import initializeFirebase
from firebase_admin import firestore
initializeFirebase()
from multiprocessing import Process

# Video feed
# cap = cv2.VideoCapture('carPark.mp4')
# cap = cv2.imread('carParkImg.jpeg')

# Open with Webcam
cap = cv2.VideoCapture(0)

with open('CarParkPos', 'rb') as f:
    posList = pickle.load(f)

width, height = 115, 85


with open('ParkLayout.txt', 'r') as f:
    labelpos = f.read()

labelpos = json.JSONDecoder().decode(labelpos)

print(labelpos)


def checkParkingSpace(imgPro):
    spaceCounter = 0
    free = []
    notfree = []
    for pos in posList:
        x, y = pos

        imgCrop = imgPro[y:y + height, x:x + width]
        # cv2.imshow(str(x * y), imgCrop)
        count = cv2.countNonZero(imgCrop)

        if count < 900:  #if parking space available
            # print("Park", x, y)
            color = (0, 255, 0)
            thickness = 5
            spaceCounter += 1
            free.append((x,y))
        else: # if parking space not available
            # print("parking",x, y)
            color = (0, 0, 255)
            thickness = 2
            notfree.append((x, y))

        cv2.rectangle(img, pos, (pos[0] + width,
                      pos[1] + height), color, thickness)
        # cvzone.putTextRect(img, str(count), (x, y + height - 3), scale=1,
        #                    thickness=2, offset=0, colorR=color)

    cvzone.putTextRect(img, f'Free: {spaceCounter}/{len(posList)}', (50, 50), scale=3,
                       thickness=3, offset=20, colorR=(0, 200, 0))
    return notfree, free

def checkLabel(notfree, free):
    notfree_label = []
    free_label = []
    for i in notfree:
        for j in labelpos:
            if i[0] == j[1] and i[1] == j[2]:
                # print(i,j[0])
                notfree_label.append(j[0])
        # print("-------------")
    for i in free:
        for j in labelpos:
            if i[0] == j[1] and i[1] == j[2]:
                # print(i, j[0])
                free_label.append(j[0])
        # print("-------------")

    return {
        "id":1,
        "free":free_label,
        "not_free":notfree_label
    }

def streamToServer(notfree,free):
    layout = checkLabel(notfree,free)
    client = firestore.client();
    ref = client.collection("availibility").document(str(layout["id"]));
    ref.set(layout)

while True:

    if cap.get(cv2.CAP_PROP_POS_FRAMES) == cap.get(cv2.CAP_PROP_FRAME_COUNT):
        cap.set(cv2.CAP_PROP_POS_FRAMES, 0)
    success, img = cap.read()
    # img = cv2.imread('parkinglot_empty.jpg')

    img = cv2.resize(img,(1190,842))
    imgGray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    imgBlur = cv2.GaussianBlur(imgGray, (3, 3), 1)
    imgThreshold = cv2.adaptiveThreshold(imgBlur, 255, cv2.ADAPTIVE_THRESH_GAUSSIAN_C,
                                         cv2.THRESH_BINARY_INV, 25, 16)
    imgMedian = cv2.medianBlur(imgThreshold, 5)
    kernel = np.ones((3, 3), np.uint8)
    imgDilate = cv2.dilate(imgMedian, kernel, iterations=1)

    notfree, free = checkParkingSpace(imgDilate)
    # notfree, free = checkParkingSpace(imgDilate)
    p = Process(target=streamToServer, args=(notfree, free))
    p.start()
    # streamToServer(notfree,free)

    # checkLabel(notfree,free)
    cv2.imshow("Image", img)
    cv2.waitKey(10)
