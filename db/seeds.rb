# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Job.create(name: "国語")
Job.create(name: "数学")
Job.create(name: "英語")
Job.create(name: "理科")
Job.create(name: "社会")
Job.create(name: "事務")
User.create(name: "admin_user", email: "admin@example.com", password: "password", admin: true, job: Job.first)
User.create(name: "guest_user", email: "guest@example.com", password: "password", admin: false, job: Job.first)
User.create(name: "test_user", email: "test@example.com", password: "password", admin: false, job: Job.first)
Group.create(school_year: 1, number: 1, user: User.first)
Group.create(school_year: 1, number: 2, user: User.second)
Group.create(school_year: 2, number: 1, user: User.third)
Student.create(firstname: "田中", lastname: "太郎", birthdate: '2010/01/01')
Student.create(firstname: "鈴木", lastname: "ゆうき", birthdate: '2010/01/01')
Student.create(firstname: "佐藤", lastname: "大地", birthdate: '2010/01/01')
GroupNumberStudent.create(group: Group.first, student: Student.first, number: 1)
GroupNumberStudent.create(group: Group.second, student: Student.second, number: 1)
GroupNumberStudent.create(group: Group.third, student: Student.third, number: 1)