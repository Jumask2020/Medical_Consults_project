class FakeData {
  Map<String, dynamic> data = {
    "Users": [
      {
        "User_ID": 1,
        "name": "Dr. Ahmed Ali",
        "Email": "ahmed.ali@clinic.com",
        "Password": "hashed_password1",
        "User_type": "Doctor",
        "phone": "+966501234567",
        "address": "Riyadh, Saudi Arabia",
        "Registration_date": "2020-05-15"
      },
      {
        "User_ID": 2,
        "name": "Dr. Sarah Saleh",
        "Email": "sarah.saleh@hospital.com",
        "Password": "hashed_password2",
        "User_type": "Doctor",
        "phone": "+966509876543",
        "address": "Jeddah, Saudi Arabia",
        "Registration_date": "2021-03-12"
      },
      {
        "User_ID": 3,
        "name": "Mohammed Saud",
        "Email": "mohammed.saud@patient.com",
        "Password": "hashed_password3",
        "User_type": "Patient",
        "phone": "+966501112233",
        "address": "Mecca, Saudi Arabia",
        "Registration_date": "2022-01-20"
      },
      {
        "User_ID": 4,
        "name": "Aisha Hassan",
        "Email": "aisha.hassan@patient.com",
        "Password": "hashed_password4",
        "User_type": "Patient",
        "phone": "+966502223344",
        "address": "Dammam, Saudi Arabia",
        "Registration_date": "2022-04-15"
      },
      {
        "User_ID": 5,
        "name": "Omar Nasser",
        "Email": "omar.nasser@patient.com",
        "Password": "hashed_password5",
        "User_type": "Patient",
        "phone": "+966503334455",
        "address": "Medina, Saudi Arabia",
        "Registration_date": "2022-06-30"
      }
    ],
    "Doctors": [
      {
        "Doctor_ID": 1,
        "User_ID": 1,
        "Specialization": "Cardiology",
        "degree": "MD",
        "university": "King Saud University",
        "graduation_year": 2015,
        "image": "doctor_ahmed_profile.jpg",
        "nationality": "Saudi",
        "experience": 8
      },
      {
        "Doctor_ID": 2,
        "User_ID": 2,
        "Specialization": "Dermatology",
        "degree": "MD",
        "university": "King Abdulaziz University",
        "graduation_year": 2016,
        "image": "doctor_sarah_profile.jpg",
        "nationality": "Saudi",
        "experience": 7
      }
    ],
    "Patients": [
      {
        "Patient_ID": 1,
        "User_ID": 3,
        "Date_of_Birth": "1990-02-15",
        "weight": 75.0,
        "height": 175.0,
        "Medical_history": "No known allergies, mild hypertension"
      },
      {
        "Patient_ID": 2,
        "User_ID": 4,
        "Date_of_Birth": "1985-06-10",
        "weight": 60.0,
        "height": 160.0,
        "Medical_history": "Asthma, allergy to penicillin"
      },
      {
        "Patient_ID": 3,
        "User_ID": 5,
        "Date_of_Birth": "1995-11-05",
        "weight": 82.0,
        "height": 180.0,
        "Medical_history": "Diabetes Type 2"
      }
    ],
    "Paid_Consultations": [
      {
        "Paid_Consultation_ID": 1,
        "Doctor_ID": 1,
        "Patient_ID": 1,
        "description": "Cardiology consultation for chest pain",
        "File": "consultation_file_1.pdf",
        "Consult_state": "Completed"
      },
      {
        "Paid_Consultation_ID": 2,
        "Doctor_ID": 1,
        "Patient_ID": 2,
        "description": "Cardiology follow-up",
        "File": "consultation_file_2.pdf",
        "Consult_state": "Pending"
      },
      {
        "Paid_Consultation_ID": 3,
        "Doctor_ID": 2,
        "Patient_ID": 1,
        "description": "Dermatology consultation for skin rash",
        "File": "consultation_file_3.pdf",
        "Consult_state": "In Progress"
      },
      {
        "Paid_Consultation_ID": 4,
        "Doctor_ID": 2,
        "Patient_ID": 3,
        "description": "Dermatology follow-up for acne treatment",
        "File": "consultation_file_4.pdf",
        "Consult_state": "Completed"
      },
      {
        "Paid_Consultation_ID": 5,
        "Doctor_ID": 1,
        "Patient_ID": 3,
        "description": "Cardiology consultation for hypertension",
        "File": "consultation_file_5.pdf",
        "Consult_state": "Pending"
      }
    ],
    "Messages": [
      {
        "Message_ID": 1,
        "Paid_Consultation_ID": 1,
        "Sender_ID": 1,
        "Message_Text":
            "Hello Mohammed, can you describe the chest pain you're feeling?",
        "Sent_DateTime": "2023-09-01T10:45:00",
        "Message_File": null
      },
      {
        "Message_ID": 2,
        "Paid_Consultation_ID": 1,
        "Sender_ID": 3,
        "Message_Text":
            "Hi Doctor, it's a sharp pain that happens occasionally.",
        "Sent_DateTime": "2023-09-01T11:00:00",
        "Message_File": null
      },
      {
        "Message_ID": 3,
        "Paid_Consultation_ID": 1,
        "Sender_ID": 1,
        "Message_Text": "Do you feel any shortness of breath?",
        "Sent_DateTime": "2023-09-01T11:05:00",
        "Message_File": null
      },
      {
        "Message_ID": 4,
        "Paid_Consultation_ID": 2,
        "Sender_ID": 1,
        "Message_Text": "Hi Aisha, I hope you're feeling better.",
        "Sent_DateTime": "2023-09-05T11:15:00",
        "Message_File": null
      },
      {
        "Message_ID": 5,
        "Paid_Consultation_ID": 2,
        "Sender_ID": 4,
        "Message_Text": "Thank you Doctor, I'm feeling much better now.",
        "Sent_DateTime": "2023-09-05T11:30:00",
        "Message_File": null
      },
      {
        "Message_ID": 6,
        "Paid_Consultation_ID": 3,
        "Sender_ID": 2,
        "Message_Text":
            "Hi Mohammed, I've reviewed your case. Please avoid the following products for the next two weeks.",
        "Sent_DateTime": "2023-09-07T14:45:00",
        "Message_File": "advice_list.pdf"
      },
      {
        "Message_ID": 7,
        "Paid_Consultation_ID": 3,
        "Sender_ID": 3,
        "Message_Text": "Thank you, Doctor. I will follow your advice.",
        "Sent_DateTime": "2023-09-07T15:00:00",
        "Message_File": null
      },
      {
        "Message_ID": 8,
        "Paid_Consultation_ID": 4,
        "Sender_ID": 2,
        "Message_Text": "Hi Omar, how is your skin treatment going?",
        "Sent_DateTime": "2023-09-10T13:00:00",
        "Message_File": null
      },
      {
        "Message_ID": 9,
        "Paid_Consultation_ID": 4,
        "Sender_ID": 5,
        "Message_Text": "It's improving, thanks Doctor.",
        "Sent_DateTime": "2023-09-10T13:15:00",
        "Message_File": null
      },
      {
        "Message_ID": 10,
        "Paid_Consultation_ID": 5,
        "Sender_ID": 1,
        "Message_Text":
            "Hi Omar, make sure to take your blood pressure medicine daily.",
        "Sent_DateTime": "2023-09-12T13:45:00",
        "Message_File": null
      }
    ],
    "Payments": [
      {
        "Payment_ID": 1,
        "Paid_Consultation_ID": 1,
        "Amount": 200.0,
        "Payment_Method": "Credit Card",
        "Payment_DateTime": "2023-09-01T10:30:00",
        "Payment_Status": "Paid",
        "Payment_image": "receipt_1.jpg",
        "Transaction_ID": "TXN123456"
      },
      {
        "Payment_ID": 2,
        "Paid_Consultation_ID": 2,
        "Amount": 150.0,
        "Payment_Method": "Credit Card",
        "Payment_DateTime": "2023-09-05T11:00:00",
        "Payment_Status": "Paid",
        "Payment_image": "receipt_2.jpg",
        "Transaction_ID": "TXN234567"
      },
      {
        "Payment_ID": 3,
        "Paid_Consultation_ID": 3,
        "Amount": 220.0,
        "Payment_Method": "Credit Card",
        "Payment_DateTime": "2023-09-07T14:30:00",
        "Payment_Status": "Paid",
        "Payment_image": "receipt_3.jpg",
        "Transaction_ID": "TXN345678"
      },
      {
        "Payment_ID": 4,
        "Paid_Consultation_ID": 4,
        "Amount": 180.0,
        "Payment_Method": "Credit Card",
        "Payment_DateTime": "2023-09-10T12:45:00",
        "Payment_Status": "Paid",
        "Payment_image": "receipt_4.jpg",
        "Transaction_ID": "TXN456789"
      },
      {
        "Payment_ID": 5,
        "Paid_Consultation_ID": 5,
        "Amount": 250.0,
        "Payment_Method": "Credit Card",
        "Payment_DateTime": "2023-09-12T13:30:00",
        "Payment_Status": "Paid",
        "Payment_image": "receipt_5.jpg",
        "Transaction_ID": "TXN567890"
      }
    ],
    "Hospital_Clinics": [
      {
        "Hospital_Clinic_ID": 1,
        "name": "Riyadh General Hospital",
        "address": "King Fahd Road, Riyadh",
        "phone": "+966112223344",
        "type": "Hospital"
      },
      {
        "Hospital_Clinic_ID": 2,
        "name": "Jeddah Medical Clinic",
        "address": "Al Hamra District, Jeddah",
        "phone": "+966125678901",
        "type": "Clinic"
      },
      {
        "Hospital_Clinic_ID": 3,
        "name": "Mecca Specialized Clinic",
        "address": "Al Aziziyah, Mecca",
        "phone": "+966125555555",
        "type": "Clinic"
      }
    ],
    "Doctor_Working_Hours": [
      {
        "Working_Hour_ID": 1,
        "Doctor_ID": 1,
        "Day": "Sunday",
        "start_time": "09:00",
        "end_time": "13:00"
      },
      {
        "Working_Hour_ID": 2,
        "Doctor_ID": 1,
        "Day": "Tuesday",
        "start_time": "09:00",
        "end_time": "13:00"
      },
      {
        "Working_Hour_ID": 3,
        "Doctor_ID": 1,
        "Day": "Thursday",
        "start_time": "09:00",
        "end_time": "13:00"
      },
      {
        "Working_Hour_ID": 4,
        "Doctor_ID": 2,
        "Day": "Monday",
        "start_time": "10:00",
        "end_time": "14:00"
      },
      {
        "Working_Hour_ID": 5,
        "Doctor_ID": 2,
        "Day": "Wednesday",
        "start_time": "10:00",
        "end_time": "14:00"
      },
      {
        "Working_Hour_ID": 6,
        "Doctor_ID": 2,
        "Day": "Friday",
        "start_time": "11:00",
        "end_time": "15:00"
      }
    ]
  };
}
