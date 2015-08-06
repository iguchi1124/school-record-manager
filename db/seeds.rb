user = User.new(email: "staff@example.com", password: '1234abcd', role: 'staff')
school = School.new(name: "高知工業高等専門学校", prefecture: 'kochi')

user.save!
school.save!
