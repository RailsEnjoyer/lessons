all_tickets = [
  ticket1 = 
  {
    ticket_number: "РМ2010398050298",
    start_point: "Warsawa",
    end_point: "Minsk",
    passenger_name: "Bogdan",
    passenger_surname: "Davidovich",
    passport: 4599505281
  },

  ticket2 = 
  {
    ticket_number: "РМ1924062279368",
    start_point: "Samara",
    end_point: "Moscov",
    passenger_name: "Denis",
    passenger_surname: "Sukhachev",
    passport: 6372267727
  },

  ticket3 = 
  {
    ticket_number: "РМ0235828726654",
    start_point: "Paris",
    end_point: "Berlin",
    passenger_name: "Ilia",
    passenger_surname: "Ismailau",
    passport: 2586525634
  }
]

all_tickets.each do |ticket|
  puts "\n  Ticket number: #{ticket[:ticket_number]}\n 
  Started from: #{ticket[:start_point]}\n 
  Arrival at: #{ticket[:end_point]}\n 
  Passenger Name&Surname: #{ticket[:passenger_name]} #{ticket[:passenger_surname]}\n 
  Passport number: #{ticket[:passport]}\n
  ===================================================
"
end