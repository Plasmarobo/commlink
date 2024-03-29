# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@dan    = User.find_or_create_by_email(username: 'dan', email: 'dmcnamara1@gmail.com', password: 'dicksdicks', password_confirmation: 'dicksdicks')
@austen = User.find_or_create_by_email(username: 'austen', email: 'plasmarobo@gmail.com', password: 'dicksdicks', password_confirmation: 'dicksdicks')

if Rails.env.development?
  elias = {
    user_id: 2,
    name: "Elias",
    condition: 6,
    stun: 6
  }
  
  gwydion = {
    user_id: 1,
    name: "Gwydion",
    condition: 0,
    stun: 0
  }

  bob = {
    user_id: 2,
    name: "Bob",
    condition: 1,
    stun: 3
  }
  
  elias = Player.find_or_create_by_name(elias)
  gwydion = Player.find_or_create_by_name(gwydion)
  bob = Player.find_or_create_by_name(bob)

  Friend.find_or_create_by_user_id(user_id: elias.id, friend_id: gwydion.id)
  Friend.find_or_create_by_user_id(user_id: gwydion.id, friend_id: elias.id)

  elias.skillset = Skillset.find_or_create_by_id(id: elias.id, datasearch: 1)
  gwydion.skillset = Skillset.find_or_create_by_id(id: gwydion.id, datasearch: 10)
  bob.skillset = Skillset.find_or_create_by_id(id: bob.id, datasearch: 1)

  @ps_elias, @ps_gwydion, @ps_bob = Programset.create(), Programset.create(), Programset.create()
  #Create some player nodes
  node_gwy = Node.create(player_id: gwydion.id, name: "A Flute", desc: "This is actually a woodwind instrument, not a computer.", programset_id: @ps_gwydion.id, system: 1, firewall: 1, response: 1, pilot: 0, signal: 400, gamesession_id: nil)  
  node_els = Node.create(player_id: elias.id, name: "A Comm", desc: "Contains loads of gross Pr0n.", programset_id: @ps_elias.id, system: 3, firewall: 5, response: 4, pilot: 0, signal: 40, gamesession_id: nil)  
  node_bob = Node.create(player_id: bob.id, name: "Bob's Comm", desc: "He calls his mom with it.", programset_id: @ps_bob.id, system: 3, firewall: 5, response: 4, pilot: 0, signal: 40, gamesession_id: nil)  
  
  #set program sets for those nodes:
  node_gwy.programset = @ps_gwydion
  node_els.programset = @ps_elias
  node_bob.programset = @ps_bob

  #create some games
  game1 = @dan.gamesessions.create(name: "Epic Game")
  game2 = @austen.gamesessions.create(name: "Slightly Less Epic Game")

  #create some gm nodes
  ps_node1, ps_node2, ps_node3, ps_node4 = Programset.create, Programset.create, Programset.create, Programset.create
  n1 = Node.find_or_create_by_name(player_id: nil, name: "Ares Mainframe Alpha", desc: "", programset_id: ps_node1.id, system: 6, firewall: 6, response: 6, pilot: 0, signal: 80, gamesession_id: game1.id)  
  n2 = Node.find_or_create_by_name(player_id: nil, name: "Aztchnology Mainframe Alpha", desc: "", programset_id: ps_node2.id, system: 6, firewall: 6, response: 6, pilot: 0, signal: 80, gamesession_id: game1.id)  
  n3 = Node.find_or_create_by_name(player_id: nil, name: "Ares Mainframe Beta", desc: "", programset_id: ps_node3.id, system: 6, firewall: 6, response: 6, pilot: 0, signal: 80, gamesession_id: game2.id)  
  n4 = Node.find_or_create_by_name(player_id: nil, name: "Aztehcnology Mainframe Beta", desc: "", programset_id: ps_node4.id, system: 6, firewall: 6, response: 6, pilot: 0, signal: 80, gamesession_id: game2.id)  
  
  n1.programset, n2.programset, n3.programset, n4.programset = ps_node1, ps_node2, ps_node3, ps_node4

  game1.groups.create([{player_id: elias.id},{player_id: bob.id}])
  game2.groups.create([{player_id: gwydion.id},{player_id: elias.id}])

end

