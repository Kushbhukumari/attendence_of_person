# Attendance Record Project

A user-friendly project designed to manage and track attendance efficiently. Ideal for schools, workplaces, or events, this system allows users to record, view, and manage attendance records with ease.

## Features
- **Record Attendance**: Mark attendance for individuals or groups quickly.
- **Attendance Logs**: View detailed records by date or individual.
- **Editable Records**: Update or delete attendance entries as needed.
- **Download Data**: Export attendance logs in an easy-to-use format (e.g., CSV).
- **Simple Interface**: Straightforward navigation for all users.



- ## Acknowledgements

Acknowledgements

dlib Library – For providing the foundational machine learning models and facial recognition algorithms.

OpenCV – For enabling real-time computer vision capabilities in Python.

NumPy – For efficient numerical operations and data handling.

Scikit-learn – For supporting machine learning techniques used in face comparison.

Python Software Foundation – For maintaining the Python language that powers this project.

Docker – For simplifying deployment across different platforms.

Community Contributors – For continuous improvements, bug fixes, and feature suggestions.


## API Reference

#### Get all items

```http
GET /api/face_recognition
```


| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `api_key` | `string` | **Required**. Your API key |
| `image` | `file` | **Required**. The image file to perform face detection on. |
| `model` | `string` | Optional. Detection model: hog (default) or cnn
 |
| `tolerance` | `string` | Optional. Face comparison tolerance (default 0.6)
|




###  Installation



## Installation: 1.Visit the Teachable Machine Website: Go to Teachable Machine

![image](https://github.com/user-attachments/assets/ef1ebfa4-2020-43fc-a12d-802e30662eba)

## 2.Create a New Project: Click on "Get Started" and select "Image Model" under the "New Project" section 3.Select Model Type: Choose the "Standard Image Model" option. image

![image](https://github.com/user-attachments/assets/7c9d2a31-e40a-4e17-a9b0-54628adfe6de)

## 3.Label Examples: Assign labels to each example image

![image](https://github.com/user-attachments/assets/8729ef01-315c-4470-87a2-b8982fe6a982)

## 4.Export the Model: Once training is complete, click on "Export the Model" and download the model files (a .zip file containing the model weights (.h5) and labels (.txt) files) image


## Implementation in Python 

1.Set Up Your Environment: Ensure you have Python 3.7 or higher installed.
2.Install Required Libraries: Install OpenCV and NumPy using pip: python ->pip install opencv-python numpy
3.Extract Model Files: Extract the downloaded .h5 and .txt files from the .zip archive and save them in your project directory.
4.Write Python Code: Use the following code to load the model and perform face recognition: from keras.models import load_model 


## How to Download and Use
1. **Download the Files**:
   - Click the green **Code** button at the top of the repository.
   - ![image](https://github.com/user-attachments/assets/597b4581-f49a-4c25-bfd2-4d71bf3c902e)

   - Select **Download ZIP** to download the project files.
   - ![image](https://github.com/user-attachments/assets/43d7a272-21c3-4968-a663-2f54fa4c53b3)

   - Extract the ZIP file to your desired location.
   - make sure the keras model and labels are also in the same directory

2. **Run the Project**:
   - Open the attendance_record file ( `code.py`) to launch the application.
   - ![image](https://github.com/user-attachments/assets/b9b03de3-067b-4d7c-8ca6-033c679c71cd)

   - install necessary libraries in the terminal 
   - pip install mysql-connector-python
   - pip install tensorflow==2.10.0
   - pip install opencv-python==4.5.5.64
   - pip install numpy==1.21.6
   - run the code
3. **Customize as Needed**:
   - Edit files to fit your requirements.
   - Add custom branding or functionality.
  


   ## This Python script is a Face Recognition Attendance System that integrates computer vision and a MySQL database to automatically record attendance using a webcam. Here's a step-by-step explanation of how the code works:

## 1. Import Libraries
python 

      import cv2
      import numpy as np
      import mysql.connector
      from tensorflow.keras.models import load_model
      import time
      
cv2: For capturing video from the webcam and handling image processing.

numpy: For numerical operations, especially for image data handling.

mysql.connector: To connect and interact with the MySQL database.

tensorflow.keras.models.load_model: To load the pre-trained face recognition model.

time: To handle timing operations (e.g., cooldown between recognitions).

## 2. Load the Trained Model and Labels

python 
           model = load_model("keras_model.h5", compile=False)
           class_names = open("labels.txt", "r").readlines()

              
keras_model.h5: The pre-trained model (from Google Teachable Machine) used for recognizing faces.

labels.txt: Contains labels (names) corresponding to the model's output classes.


## 3. Connect to MySQL Database
python

    conn = mysql.connector.connect(
         host="localhost",
         user="root",
         password="bishal@11",
         database="attendance_system"
        )
      c = conn.cursor()

      
Connects to the attendance_system database to store and update attendance records.


## 4. Attendance Recording Function
python

def record_attendance(name):
    try:
        c.execute("SELECT * FROM attendance WHERE name = %s", (name,))
        result = c.fetchone()

        if result:
            c.execute("UPDATE attendance SET count = count + 1 WHERE name = %s", (name,))
            conn.commit()
            print(f"Attendance incremented for {name}")
        else:
            c.execute("INSERT INTO attendance (name, count) VALUES (%s, %s)", (name, 1))
            conn.commit()
            print(f"Attendance marked for {name} with count = 1")
    except Exception as e:
        print(f"Error updating attendance: {e}")


Checks if the person already exists in the database.
If the person exists, their attendance count is incremented.
If the person does not exist, they are added with a count of 1.


## 5. Webcam Setup and Recognition Control
python

camera = cv2.VideoCapture(0)
confidence_threshold = 0.95
cooldown_time = 3
last_recognition_time = {}


camera: Starts the webcam feed.

confidence_threshold: Minimum confidence required to record attendance.

cooldown_time: Wait time (3 seconds) before recognizing the same face again
.
last_recognition_time: Tracks when each person was last recognized.

## 6. Main Loop for Real-Time Recognition
python


while True:
    ret, image = camera.read()
    image_resized = cv2.resize(image, (224, 224), interpolation=cv2.INTER_AREA)
    cv2.imshow("Webcam Image", image_resized)

    image_array = np.asarray(image_resized, dtype=np.float32).reshape(1, 224, 224, 3)
    image_array = (image_array / 127.5) - 1

    prediction = model.predict(image_array, verbose=0)
    index = np.argmax(prediction)
    class_name = class_names[index].strip()
    confidence_score = prediction[0][index]

    current_time = time.time()

    if confidence_score >= confidence_threshold:
        last_time = last_recognition_time.get(class_name, 0)

        if current_time - last_time >= cooldown_time:
            print(f"Recognized as: {class_name} with confidence {confidence_score*100:.2f}%")
            record_attendance(class_name)
            last_recognition_time[class_name] = current_time

    if cv2.waitKey(1) == 27:
        break

        
Step-by-step breakdown:

Capture a frame from the webcam.

Resize the image to 224x224 pixels (model input size).

Normalize the image data to the range [-1, 1].

Predict the class (person) using the model.

Check confidence score against the threshold (0.95).

Cooldown logic ensures the same person isn't marked repeatedly within 3 seconds.

Record attendance in the database if recognized.

ESC key (27) breaks the loop to stop the program.

## 7. Cleanup
python
 
    camera.release()
    cv2.destroyAllWindows()
    conn.close()

    
Stops the webcam.

Closes all OpenCV windows.

Disconnects from the database.

Security Consideration
Database password (bishal@11) is hardcoded. It's better to use environment variables for security.


## Contribution
Feel free to contribute to this project by submitting a pull request or opening an issue.

---
