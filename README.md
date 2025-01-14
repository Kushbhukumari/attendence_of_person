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


## Contribution
Feel free to contribute to this project by submitting a pull request or opening an issue.

---
