# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create([{username: 'dan', email: 'dmcnamara1@gmail.com', password: 'dicksdicks', password_confirmation: 'dicksdicks'}, {username: 'austen', email: 'plasmarobo@gmail.com', password: 'dicksdicks', password_confirmation: 'dicksdicks'}])

@ps_elias, @ps_gwydion, @ps_bob = Programset.create(), Programset.create(), Programset.create()
@ss_elias, @ss_gwydion, @ss_bob = Skillset.create(), Skillset.create(), Skillset.create()

if Rails.env.development?
  elias = {
    user_id: 2,
    name: "Elias",
    programset_id: @ps_elias.id,
    skillset_id: @ss_elias.id,
    condition: 6,
    stun: 6
  }

  gwydion = {
    user_id: 1,
    name: "Gwydion",
    programset_id: @ps_gwydion.id,
    skillset_id: @ss_gwydion.id,
    condition: 0,
    stun: 0
  }

  bob = {
    user_id: 2,
    name: "Bob",
    programset_id: @ps_bob.id,
    skillset_id: @ss_bob.id,
    condition: 1,
    stun: 3
  }
  elias = Player.create(elias)
  gwydion = Player.create(gwydion)
  bob = Player.create(bob)

  Pal.create(user_id: 1, pal_id: 2)
  Pal.create(user_id: 2, pal_id: 1)

  #Create some player nodes
  Node.create(player_id: 1, name: "A Clarinet", desc: "This is actually a woodwind instrument, not a computer.", programset_id: @ps_gwydion.id, system: 1, firewall: 1, response: 1, pilot: 0, signal: 400, gm_id: nil)  
  Node.create(player_id: 2, name: "A Comm", desc: "Contains loads of gross Pr0n.", programset_id: @ps_elias.id, system: 3, firewall: 5, response: 4, pilot: 0, signal: 40, gm_id: nil)  
  Node.create(player_id: 3, name: "Bob's Comm", desc: "He calls his mom with it.", programset_id: @ps_elias.id, system: 3, firewall: 5, response: 4, pilot: 0, signal: 40, gm_id: nil)  

  #create some gm nodes
  ps_node = Programset.create()
  Node.create(player_id: nil, name: "Ares Mainframe", desc: "", programset_id: ps_node.id, system: 6, firewall: 6, response: 6, pilot: 0, signal: 80, gm_id: 1)  
  Node.create(player_id: nil, name: "Aztchnology Mainframe", desc: "", programset_id: ps_node.id, system: 6, firewall: 6, response: 6, pilot: 0, signal: 80, gm_id: 1)  
  Node.create(player_id: nil, name: "Ares Mainframe", desc: "", programset_id: ps_node.id, system: 6, firewall: 6, response: 6, pilot: 0, signal: 80, gm_id: 2)  
  Node.create(player_id: nil, name: "Aztehcnology Mainframe", desc: "", programset_id: ps_node.id, system: 6, firewall: 6, response: 6, pilot: 0, signal: 80, gm_id: 2)  

  game1 = Gamesession.create(group_id: 1, gm_id: 1, name: "Epic Game")
  game2 = Gamesession.create(group_id: 2, gm_id: 2, name: "Slightly Less Epic Game")
  Group.create([{gamesession_id: game1.id, player_id: elias.id},{gamesession_id: game1.id, player_id: bob.id},{gamesession_id: game2.id, player_id: gwydion.id},{gamesession_id: game2.id, player_id: elias.id}])
end

