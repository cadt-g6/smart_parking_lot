import cv2
import pickle
 
width, height = 115, 90
 
try:
    with open('CarParkPos', 'rb') as f:
        # posList = pickle.load(f)
        posList = []
except:
    posList = []

 
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
while True:
    img = cv2.imread('parkinglot2.jpeg')
    # ret, img = cap.read()
    img = cv2.resize(img,(1190,842))
    for pos in posList:
        cv2.rectangle(img, pos, (pos[0] + width, pos[1] + height), (255, 0, 255), 2)
 
    cv2.imshow("Image", img)
    cv2.setMouseCallback("Image", mouseClick)
    cv2.waitKey(1)