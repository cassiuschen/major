# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Discipline.delete_all

@disciplines = IO.readlines './db/discipline.txt'
@disciplines.each do |d|
	data = d.split('|')
	discipline = Discipline.create(name: data.last.gsub("\n", ''), code: data.first)
end

if Rails.env.development?

	College.delete_all
	University.delete_all
	@universities = {
		cuc: '中国传媒大学',
		pku: '北京大学',
		thu: '清华大学',
		fdu: '复旦大学'
	}

	for k, v in @universities do
		University.create(name: v, short_name: k)
	end

	InviteToken.create(token: 'pkuschool', limit: 99999)
end