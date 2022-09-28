import cv2

cap = cv2.VideoCapture(0)
path = "/home/rotsarakkang/Documents/development/datascience/smart_parking/smart_parking_lot/detector"
while True:
    ret, frame = cap.read()
    frame = cv2.resize(frame,(1190,842))
    cv2.imshow('frame',frame)

    if cv2.waitKey(1) & 0xFF == ord('c'):
        cv2.imwrite("parking_lot.jpg",frame)

vid.release()
cv2.destroyAllWindows()
