import cv2
import pickle
import json
from lib.firebaseConfig import initializeFirebase
from firebase_admin import firestore
initializeFirebase()

 
width, height = 115, 85
 
try:
    with open('CarParkPos', 'rb') as f:
        posList = pickle.load(f)
        # posList = []
except:
    posList = []

P1_amount = 12
P2_amount = 12
P3_amount = 12

P1 = []
P2 = []
P3 = []

P1_label = [{"label":"P101","pos":{}},{"label":"P102","pos":{}},{"label":"P103","pos":{}},{"label":"P104","pos":{}},{"label":"P105","pos":{}},{"label":"P106","pos":{}},{"label":"P107","pos":{}},{"label":"P108","pos":{}},{"label":"P109","pos":{}},{"label":"P110","pos":{}},{"label":"P111","pos":{}},{"label":"P112","pos":{}}]
P2_label = [{"label":"P201","pos":{}},{"label":"P202","pos":{}},{"label":"P203","pos":{}},{"label":"P204","pos":{}},{"label":"P205","pos":{}},{"label":"P206","pos":{}},{"label":"P207","pos":{}},{"label":"P208","pos":{}},{"label":"P209","pos":{}},{"label":"P210","pos":{}},{"label":"P211","pos":{}},{"label":"P212","pos":{}}]
P3_label = [{"label":"P301","pos":{}},{"label":"P303","pos":{}},{"label":"P304","pos":{}},{"label":"P305","pos":{}},{"label":"P306","pos":{}},{"label":"P307","pos":{}},{"label":"P308","pos":{}},{"label":"P309","pos":{}},{"label":"P310","pos":{}},{"label":"P311","pos":{}},{"label":"P312","pos":{}}]


def getLabelByPosition(x,y):
    find = (x,y)
    for data in P1_label:
        if data["pos"] == find:
            return data["label"]
    for data in P2_label:
        if data["pos"] == find:
            return data["label"]
    for data in P3_label:
        if data["pos"] == find:
            return data["label"]  
    return "Not Found"

def writePositionToFile():
    pass
 
def mouseClick(events, x, y, flags, params):
    check = 0
    if events == cv2.EVENT_LBUTTONDOWN:
        if len(posList) == 0:
            posList.append((x,y))
        elif len(posList) > 0 :
            for i, pos in enumerate(posList):
                x1, y1 = pos
                if x1 < x < x1 + width and y1 < y < y1 + height:
                    print("cannot add the lot.")
                    check = 1
                    break
            if check == 0:
                posList.append((x, y))

    if events == cv2.EVENT_RBUTTONDOWN:
        for i, pos in enumerate(posList):
            x1, y1 = pos
            if x1 < x < x1 + width and y1 < y < y1 + height:
                posList.pop(i)

    with open('CarParkPos', 'wb') as f:
        pickle.dump(posList, f)


cap = cv2.VideoCapture(0)
def getParkingLabel(data):
    labels = []
    for x in data:
        labels.append(x["label"])
    return labels


def groupParking():
    P1 = []
    P2 = []
    P3 = []
    for i, pos in enumerate(posList):
        if P1_amount != len(P1):
            P1_label[len(P1)]["pos"] = pos
            P1.append(pos)

        elif P2_amount != len(P2):
            P2_label[len(P2)]["pos"] = pos
            P2.append(pos)
        else:
            P3_label[len(P3)]["pos"] = pos
            P3.append(pos)

def formatParkingToJSON():
    return {
        "id": 1,
        "name": "CS04",
        "data": [
            {
                "name": "P1",
                "lots": getParkingLabel(P1_label),
            },
            {
                "name": "P2",
                "lots": getParkingLabel(P2_label),
            },
            {
                "name": "P3",
                "lots": getParkingLabel(P3_label),
            }

        ],
        
    }

label_pos = []
 
while True:
    img = cv2.imread('parkinglot2.jpeg')
    # ret, img = cap.read()
    img = cv2.resize(img,(1190,842))
    for pos in posList:
        cv2.rectangle(img, pos, (pos[0] + width, pos[1] + height), (255, 0, 255), 2)
 
    cv2.imshow("Image", img)
    cv2.setMouseCallback("Image", mouseClick)
    groupParking()

    layout = formatParkingToJSON();
    client = firestore.client();
    ref = client.collection("layouts").document(str(layout["id"]));
    ref.set(layout)

    if cv2.waitKey(1) & 0xFF == ord('c'):
        try:
            for i in P1_label:
                print(i['label'],i['pos'][0],i['pos'][1])
                print(len(i['pos']))
                if len(i['pos']) > 0:
                    label_pos.append([i['label'],i['pos'][0],i['pos'][1]])
        except:
            pass
        try:
            for i in P2_label:
                print(i['label'],i['pos'][0],i['pos'][1])
                print(len(i['pos']))
                if len(i['pos']) > 0:
                    label_pos.append([i['label'],i['pos'][0],i['pos'][1]])
        except:
            pass
        try:
            for i in P3_label:
                print(i['label'],i['pos'][0],i['pos'][1])
                print(len(i['pos']))
                if len(i['pos']) > 0:
                    label_pos.append([i['label'],i['pos'][0],i['pos'][1]])
        except:
            pass

    if cv2.waitKey(1) & 0xFF == ord('s'):
        print(label_pos)
        with open('ParkLayout.txt','w') as f:
            f.write(json.dumps(label_pos))

