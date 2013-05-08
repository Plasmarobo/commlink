# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create([{username: 'dan', email: 'dmcnamara1@gmail.com', password: 'dicksdicks', password_confirmation: 'dicksdicks'}, {username: 'austen', email: 'plasmarobo@gmail.com', password: 'dicksdicks', password_confirmation: 'dicksdicks'}])


if Rails.env.development?
  @ps_elias, @ps_gwydion, @ps_bob = Programset.create(), Programset.create(), Programset.create()
  

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

  Skillset.find_or_create_by_id(id: elias.id)
  Skillset.find_or_create_by_id(id: gwydion.id)
  Skillset.find_or_create_by_id(id: bob.id)

  Pal.create(user_id: elias.id, pal_id: gwydion.id)
  Pal.create(user_id: gwydion.id, pal_id: elias.id)

  #Create some player nodes
  Node.create(player_id: 1, name: "A Clarinet", desc: "This is actually a woodwind instrument, not a computer.", programset_id: @ps_gwydion.id, system: 1, firewall: 1, response: 1, pilot: 0, signal: 400, gamesession_id: nil)  
  Node.create(player_id: 2, name: "A Comm", desc: "Contains loads of gross Pr0n.", programset_id: @ps_elias.id, system: 3, firewall: 5, response: 4, pilot: 0, signal: 40, gamesession_id: nil)  
  Node.create(player_id: 3, name: "Bob's Comm", desc: "He calls his mom with it.", programset_id: @ps_elias.id, system: 3, firewall: 5, response: 4, pilot: 0, signal: 40, gamesession_id: nil)  

  game1 = Gamesession.create(group_id: 1, gm_id: 1, name: "Epic Game")
  game2 = Gamesession.create(group_id: 2, gm_id: 2, name: "Slightly Less Epic Game")

  #create some gm nodes
  ps_node1, ps_node2, ps_node3, ps_node4 = Programset.create, Programset.create, Programset.create, Programset.create
  Node.create(player_id: nil, name: "Ares Mainframe", desc: "", programset_id: ps_node1.id, system: 6, firewall: 6, response: 6, pilot: 0, signal: 80, gamesession_id: game1.id)  
  Node.create(player_id: nil, name: "Aztchnology Mainframe", desc: "", programset_id: ps_node2.id, system: 6, firewall: 6, response: 6, pilot: 0, signal: 80, gamesession_id: game1.id)  
  Node.create(player_id: nil, name: "Ares Mainframe", desc: "", programset_id: ps_node3.id, system: 6, firewall: 6, response: 6, pilot: 0, signal: 80, gamesession_id: game2.id)  
  Node.create(player_id: nil, name: "Aztehcnology Mainframe", desc: "", programset_id: ps_node4.id, system: 6, firewall: 6, response: 6, pilot: 0, signal: 80, gamesession_id: game2.id)  
  
  Group.create([{gamesession_id: game1.id, player_id: elias.id},{gamesession_id: game1.id, player_id: bob.id},{gamesession_id: game2.id, player_id: gwydion.id},{gamesession_id: game2.id, player_id: elias.id}])
end

