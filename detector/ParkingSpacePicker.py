import cv2
import pickle
import json
 
width, height = 115, 90
 
try:
    with open('CarParkPos', 'rb') as f:
        # posList = pickle.load(f)
        posList = []
except:
    posList = []

P1_amount = 4
P2_amount = 4
P3_amount = 4

P1 = []
P2 = []
P3 = []

P1_label = [{"label":"P101","pos":{}},{"label":"P102","pos":{}},{"label":"P103","pos":{}},{"label":"P110","pos":{}}]
P2_label = [{"label":"P201","pos":{}},{"label":"P202","pos":{}},{"label":"P203","pos":{}},{"label":"P110","pos":{}}]
P3_label = [{"label":"P301","pos":{}},{"label":"P302","pos":{}},{"label":"P303","pos":{}},{"label":"P210","pos":{}}]


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
        "name": "AEON 2",
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

 
while True:
    img = cv2.imread('parkinglot2.jpeg')
    # ret, img = cap.read()
    img = cv2.resize(img,(1190,842))
    for pos in posList:
        cv2.rectangle(img, pos, (pos[0] + width, pos[1] + height), (255, 0, 255), 2)
 
    cv2.imshow("Image", img)
    cv2.setMouseCallback("Image", mouseClick)
    cv2.waitKey(1)
    groupParking()
    # print(formatParkingToJSON())

    with open('ParkLayout.txt','w') as f:
        f.write(json.dumps((P1_label,P2_label,P3_label)))
