admin = User.create!(
  email: 'admin@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  role: 'admin',
  full_name: 'Admin User',
  dob: '2000-05-10'
)

doctor = User.create!(
  email: 'doctor@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  role: 'doctor',
  full_name: 'Dr. John Doe',
  dob: '1999-03-15'
)


receptionist = User.create!(
  email: 'receptionist@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  role: 'receptionist',
  full_name: 'Jane Smith',
  dob: '2001-11-25'
)
