[Role, User].each do |table|
  ActiveRecord::Base.connection.execute("TRUNCATE #{table.table_name} RESTART IDENTITY CASCADE")
end
Role.create([{ name: :teacher }, { name: :student }])
User.create([{ name: 'Teacher', email: 'teacher@test.com', password: 'admin123', role_ids: '1' }, {name: 'Saqib', email: 'student@test.com', password: 'admin123', role_ids: '2' } ])