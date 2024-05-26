create  database project;
use project;

CREATE TABLE Department
(
  department_id INT NOT NULL,
  name VARCHAR(255) NOT NULL,
  manager INT NOT NULL,
  PRIMARY KEY (department_id)
);

CREATE TABLE Staff
(
  staff_id INT NOT NULL,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  position VARCHAR(255) NOT NULL,
  number INT NOT NULL,
  department_id INT NOT NULL,
  PRIMARY KEY (staff_id),
  FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

CREATE TABLE Patient
(
  patient_id INT NOT NULL,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  date_of_birth DATE NOT NULL,
  number INT NOT NULL,
  PRIMARY KEY (patient_id)
);

CREATE TABLE Room
(
  room_id INT NOT NULL,
  number_of_beds INT NOT NULL,
  PRIMARY KEY (room_id)
);

CREATE TABLE Admission
(
  admission_id INT NOT NULL,
  admission_date DATE NOT NULL,
  discharge_date DATE NOT NULL,
  patient_id INT NOT NULL,
  room_id INT NOT NULL,
  PRIMARY KEY (admission_id),
  FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
  FOREIGN KEY (room_id) REFERENCES Room(room_id)
);

CREATE TABLE LaboratoryTest
(
  test_id INT NOT NULL,
  test_name VARCHAR(255) NOT NULL,
  date DATE NOT NULL,
  results VARCHAR(255) NOT NULL,
  patient_id INT NOT NULL,
  PRIMARY KEY (test_id),
  FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);

CREATE TABLE Billing
(
  billing_id INT NOT NULL,
  date DATE NOT NULL,
  total_amount INT NOT NULL,
  patient_id INT NOT NULL,
  PRIMARY KEY (billing_id),
  FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);

CREATE TABLE Doctor
(
  doctor_id INT NOT NULL,
  number INT NOT NULL,
  speciality VARCHAR(255) NOT NULL,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  department_id INT NOT NULL,
  PRIMARY KEY (doctor_id),
  FOREIGN KEY (department_id) REFERENCES Department(department_id),
  UNIQUE (doctor_id)
);

CREATE TABLE Diagnosis
(
  diagnosis_id INT NOT NULL,
  disease_name VARCHAR(255) NOT NULL,
  details VARCHAR(255) NOT NULL,
  doctor_id INT NOT NULL,
  patient_id INT NOT NULL,
  PRIMARY KEY (diagnosis_id),
  FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id),
  FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);

CREATE TABLE Appointment
(
  appointment_id INT NOT NULL,
  appointment_date DATE NOT NULL,
  doctor_id INT NOT NULL,
  patient_id INT NOT NULL,
  PRIMARY KEY (appointment_id),
  FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id),
  FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);

CREATE TABLE Prescription
(
  prescription_id INT NOT NULL,
  prescription_date DATE NOT NULL,
  medication VARCHAR(255) NOT NULL,
  doctor_id INT NOT NULL,
  patient_id INT NOT NULL,
  PRIMARY KEY (prescription_id),
  FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id),
  FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);



INSERT INTO Department VALUES (1, 'Cardiology', 101);
INSERT INTO Department VALUES (2, 'Neurology', 102);
INSERT INTO Department VALUES (3, 'Orthopedics', 103);


INSERT INTO Staff VALUES (1, 'Ahmed', 'Eslam', 'Nurse', 01245678201, 1);
INSERT INTO Staff VALUES (2, 'Adam', 'Mohamed', 'Technician', 01098765202, 2);
INSERT INTO Staff VALUES (3, 'Mazen', 'Ibraheem', 'Receptionist', 01134567203, 3);


INSERT INTO Patient VALUES (1, 'Mohamed', 'Ahmed', '1970-05-15', 01164678301);
INSERT INTO Patient VALUES (2, 'Youmna', 'Ehab', '2012-12-10', 0127654402);
INSERT INTO Patient VALUES (3, 'Farida', 'Hesham', '2011-08-22', 01030398765);


INSERT INTO Room VALUES (1, 10);
INSERT INTO Room VALUES (2, 12);
INSERT INTO Room VALUES (3, 8);


INSERT INTO Admission VALUES (1, '2023-01-10', '2023-01-15', 1, 1);
INSERT INTO Admission VALUES (2, '2023-02-05', '2023-02-10', 2, 2);
INSERT INTO Admission VALUES (3, '2023-03-20', '2023-03-25', 3, 3);


INSERT INTO LaboratoryTest VALUES (1, 'Blood Test', '2023-01-12', 'Normal', 1);
INSERT INTO LaboratoryTest VALUES (2, 'MRI', '2023-02-08', 'Abnormal', 2);
INSERT INTO LaboratoryTest VALUES (3, 'X-ray', '2023-03-22', 'Normal', 3);


INSERT INTO Billing VALUES (1, '2023-01-15', 500, 1);
INSERT INTO Billing VALUES (2, '2023-02-10', 750, 2);
INSERT INTO Billing VALUES (3, '2023-03-25', 600, 3);


INSERT INTO Doctor VALUES (1, 01245678401, 'Cardiologist', 'Dr. Isis', 'Ashraf', 1);
INSERT INTO Doctor VALUES (2, 01045678402, 'Neurologist', 'Dr. Seif', 'Maan', 2);
INSERT INTO Doctor VALUES (3, 01145678403, 'Orthopedic Surgeon', 'Dr. Abdelrahman', 'Abdallah', 3);


INSERT INTO Diagnosis VALUES (1, 'Hypertension', 'High blood pressure', 1, 1);
INSERT INTO Diagnosis VALUES (2, 'Migraine', 'Severe headaches', 2, 2);
INSERT INTO Diagnosis VALUES (3, 'Fractured Leg', 'Broken leg bone', 3, 3);


INSERT INTO Appointment VALUES (1, '2011-01-05', 1, 1);
INSERT INTO Appointment VALUES (2, '2011-02-08', 2, 2);
INSERT INTO Appointment VALUES (3, '2011-03-18', 3, 3);


INSERT INTO Prescription VALUES (1, '2023-01-10', 'Aspirin', 1, 1);
INSERT INTO Prescription VALUES (2, '2023-02-15', 'Panadol', 2, 2);
INSERT INTO Prescription VALUES (3, '2023-03-22', 'Painkillers', 3, 3);
select * from prescription;