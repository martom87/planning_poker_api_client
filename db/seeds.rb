team1 = CreateTeamWithName.new.call
team1.members_amount = 3
team1.save

team2 = CreateTeamWithName.new.call
team2.members_amount = 3
team2.save


member1 = Member.create!(member_name: 'Marcin', vote: 5, team: team1)
member2 = Member.create!(member_name: 'Marcin2', vote: 3, team: team2)
Member.create!(member_name: 'Marcin3', vote: 8, team: team1)

ticket1 = CreateRandomTicket.new.call
ticket1.team = team1
ticket1.member = member1
ticket1.save

ticket2 = CreateRandomTicket.new.call
ticket2.team = team2
ticket2.member = member2
ticket2.save




