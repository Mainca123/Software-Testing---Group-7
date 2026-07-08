USE clinic_management;

-- =========================
-- USERS (10 records)
-- Password admin:
-- $2a$12$uVgllUR1e4vUtXxP4E87beSukcR/waQNgXXH.4SGBOdGvKhobrYom
-- =========================

INSERT INTO users
(id, username, password, full_name, phone, email, role, gender, date_of_birth,
 is_verified, token_verified, avatar_url, is_deleted, deleted_at)
VALUES
(1, 'admin', '$2a$12$uVgllUR1e4vUtXxP4E87beSukcR/waQNgXXH.4SGBOdGvKhobrYom',
 'System Administrator', '0901000001', 'admin@clinic.com',
 'ADMIN', 'MALE', '1990-01-01',
 true, NULL, NULL, false, NULL),

(2, 'doctor_an', '$2a$12$uVgllUR1e4vUtXxP4E87beSukcR/waQNgXXH.4SGBOdGvKhobrYom',
 'Nguyen Van An', '0901000002', 'an.doctor@clinic.com',
 'DOCTOR', 'MALE', '1985-05-10',
 true, NULL, NULL, false, NULL),

(3, 'doctor_binh', '$2a$12$uVgllUR1e4vUtXxP4E87beSukcR/waQNgXXH.4SGBOdGvKhobrYom',
 'Tran Thi Binh', '0901000003', 'binh.doctor@clinic.com',
 'DOCTOR', 'FEMALE', '1988-08-20',
 true, NULL, NULL, false, NULL),

(4, 'doctor_cuong', '$2a$12$uVgllUR1e4vUtXxP4E87beSukcR/waQNgXXH.4SGBOdGvKhobrYom',
 'Le Minh Cuong', '0901000004', 'cuong.doctor@clinic.com',
 'DOCTOR', 'MALE', '1982-03-15',
 true, NULL, NULL, false, NULL),

(5, 'patient_hai', '$2a$12$uVgllUR1e4vUtXxP4E87beSukcR/waQNgXXH.4SGBOdGvKhobrYom',
 'Pham Duc Hai', '0901000005', 'hai@gmail.com',
 'PATIENT', 'MALE', '2000-11-12',
 true, NULL, NULL, false, NULL),

(6, 'patient_linh', '$2a$12$uVgllUR1e4vUtXxP4E87beSukcR/waQNgXXH.4SGBOdGvKhobrYom',
 'Do Thu Linh', '0901000006', 'linh@gmail.com',
 'PATIENT', 'FEMALE', '2001-07-01',
 true, NULL, NULL, false, NULL),

(7, 'patient_huong', '$2a$12$uVgllUR1e4vUtXxP4E87beSukcR/waQNgXXH.4SGBOdGvKhobrYom',
 'Nguyen Thi Huong', '0901000007', 'huong@gmail.com',
 'PATIENT', 'FEMALE', '1999-04-22',
 true, NULL, NULL, false, NULL),

(8, 'patient_khanh', '$2a$12$uVgllUR1e4vUtXxP4E87beSukcR/waQNgXXH.4SGBOdGvKhobrYom',
 'Vu Tuan Khanh', '0901000008', 'khanh@gmail.com',
 'PATIENT', 'MALE', '1998-09-14',
 true, NULL, NULL, false, NULL),

(9, 'patient_nam', '$2a$12$uVgllUR1e4vUtXxP4E87beSukcR/waQNgXXH.4SGBOdGvKhobrYom',
 'Hoang Minh Nam', '0901000009', 'nam@gmail.com',
 'PATIENT', 'MALE', '2002-02-28',
 true, NULL, NULL, false, NULL),

(10, 'patient_trang', '$2a$12$uVgllUR1e4vUtXxP4E87beSukcR/waQNgXXH.4SGBOdGvKhobrYom',
 'Pham Thu Trang', '0901000010', 'trang@gmail.com',
 'PATIENT', 'FEMALE', '2003-06-18',
 true, NULL, NULL, false, NULL);


-- =========================
-- DEPARTMENTS (10 records)
-- =========================

INSERT INTO departments
(id, name, description, is_deleted, deleted_at)
VALUES
(1, 'Cardiology', 'Heart and cardiovascular treatment', false, NULL),
(2, 'Neurology', 'Brain and nervous system', false, NULL),
(3, 'Pediatrics', 'Healthcare for children', false, NULL),
(4, 'Dermatology', 'Skin treatment department', false, NULL),
(5, 'Orthopedics', 'Bone and joint treatment', false, NULL),
(6, 'ENT', 'Ear Nose Throat department', false, NULL),
(7, 'Ophthalmology', 'Eye treatment department', false, NULL),
(8, 'Gastroenterology', 'Digestive system treatment', false, NULL),
(9, 'General Medicine', 'General examination', false, NULL),
(10, 'Emergency', 'Emergency treatment department', false, NULL);


-- =========================
-- DOCTORS (10 records)
-- =========================

INSERT INTO doctors
(id, user_id, department_id, specialization, experience_years, is_deleted, deleted_at)
VALUES
(1, 2, 1, 'Cardiologist', 12, false, NULL),
(2, 3, 2, 'Neurologist', 10, false, NULL),
(3, 4, 3, 'Pediatric Specialist', 15, false, NULL);


-- =========================
-- MEDICINES (10 records)
-- =========================

INSERT INTO medicines
(id, name, unit, is_deleted, deleted_at)
VALUES
(1, 'Paracetamol 500mg', 'Box', false, NULL),
(2, 'Amoxicillin 500mg', 'Box', false, NULL),
(3, 'Vitamin C', 'Bottle', false, NULL),
(4, 'Ibuprofen', 'Box', false, NULL),
(5, 'Omeprazole', 'Box', false, NULL),
(6, 'Cetirizine', 'Box', false, NULL),
(7, 'Metformin', 'Bottle', false, NULL),
(8, 'Aspirin', 'Box', false, NULL),
(9, 'Panadol Extra', 'Box', false, NULL),
(10, 'Salonpas Patch', 'Pack', false, NULL);


-- =========================
-- APPOINTMENTS (10 records)
-- =========================

INSERT INTO appointments
(id, patient_id, doctor_id, appointment_date, start_time,
 status, symptoms, is_deleted, deleted_at)
VALUES
(1, 5, 1, '2026-05-14', '08:00:00', 'PENDING', 'Chest pain and dizziness', false, NULL),
(2, 6, 2, '2026-05-14', '09:00:00', 'CONFIRMED', 'Frequent headaches', false, NULL),
(3, 7, 3, '2026-05-15', '10:00:00', 'COMPLETED', 'Child fever and cough', false, NULL),
(4, 8, 1, '2026-05-15', '11:00:00', 'PENDING', 'Skin allergy', false, NULL),
(5, 9, 2, '2026-05-16', '13:00:00', 'CONFIRMED', 'Knee pain', false, NULL),
(6, 10, 3, '2026-05-16', '14:00:00', 'COMPLETED', 'Sore throat', false, NULL),
(7, 5, 1, '2026-05-17', '15:00:00', 'PENDING', 'Blurred vision', false, NULL),
(8, 6, 2, '2026-05-17', '16:00:00', 'CONFIRMED', 'Stomach ache', false, NULL),
(9, 7, 3, '2026-05-18', '08:30:00', 'COMPLETED', 'General health check', false, NULL),
(10, 8, 1, '2026-05-18', '09:30:00', 'CANCELLED', 'Emergency accident', false, NULL);


-- =========================
-- MEDICAL RECORDS (10 records)
-- =========================

INSERT INTO medical_records
(id, appointment_id, diagnosis, treatment_plan,
 reexamination_date, created_at, is_deleted, deleted_at)
VALUES
(1, 1, 'Mild heart arrhythmia', 'Take medicine and reduce stress',
 '2026-06-01', NOW(), false, NULL),

(2, 2, 'Migraine', 'Pain relief medicine and rest',
 '2026-06-05', NOW(), false, NULL),

(3, 3, 'Common flu', 'Use antibiotics for 5 days',
 '2026-05-25', NOW(), false, NULL),

(4, 4, 'Skin dermatitis', 'Apply skin cream twice daily',
 '2026-06-10', NOW(), false, NULL),

(5, 5, 'Joint inflammation', 'Physical therapy and medicine',
 '2026-06-15', NOW(), false, NULL),

(6, 6, 'Throat infection', 'Antibiotics and warm water',
 '2026-05-30', NOW(), false, NULL),

(7, 7, 'Eye strain', 'Reduce screen time',
 '2026-06-12', NOW(), false, NULL),

(8, 8, 'Gastritis', 'Diet control and medicine',
 '2026-06-18', NOW(), false, NULL),

(9, 9, 'Healthy condition', 'Maintain healthy lifestyle',
 '2026-07-01', NOW(), false, NULL),

(10, 10, 'Minor injury', 'Bandage and observation',
 '2026-05-22', NOW(), false, NULL);


-- =========================
-- PRESCRIPTION DETAILS (10 records)
-- =========================

INSERT INTO prescription_details
(id, medical_record_id, medicine_id, quantity, dosage,
 is_deleted, deleted_at)
VALUES
(1, 1, 8, 2, '1 tablet after breakfast', false, NULL),
(2, 2, 1, 1, '2 tablets per day', false, NULL),
(3, 3, 2, 1, '1 tablet morning and evening', false, NULL),
(4, 4, 6, 2, '1 tablet before sleep', false, NULL),
(5, 5, 4, 1, 'After meals', false, NULL),
(6, 6, 2, 1, 'Twice daily', false, NULL),
(7, 7, 3, 1, '1 bottle weekly', false, NULL),
(8, 8, 5, 1, 'Before breakfast', false, NULL),
(9, 9, 9, 2, 'When necessary', false, NULL),
(10, 10, 10, 3, 'Apply to injured area', false, NULL);