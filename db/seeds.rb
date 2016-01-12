# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

#theatre fields(name, address, city)
theatre = Theatre.create(name: 'City Pride', address: 'Pune', city: 'Pune')

#screen fields(name, capacity, theatre_id)
screen1 = Screen.create(name: 'Screen A', capacity: '50', theatre_id: theatre['_id'])
screen2 = Screen.create(name: 'Screen B', capacity: '80', theatre_id: theatre['_id'])
screen3 = Screen.create(name: 'Screen C', capacity: '80', theatre_id: theatre['_id'])
screen4 = Screen.create(name: 'Screen D', capacity: '120', theatre_id: theatre['_id'])

#movie fields(name, language, genre, duration, movie_format, !poster, trailer_url, rating, release_date, theatre_id, booking_id)
movie = Movie.create(name: 'Bajirao Mastani', language: 'Hindi', genre: 'Drama', duration: '3', movie_format: '2D', trailer_url: 'www.youtube1.com', rating: '10', release_date: "Thu Feb 11 1992 12:00:00 GMT+0530 (IST)", theatre_id: theatre['_id'])
movie = Movie.create(name: 'Chauranga', language: 'Hindi', genre: 'Drama', duration: '2.5', movie_format: '2D', trailer_url: 'www.youtube1.com', rating: '8', release_date: "Thu Feb 12 1992 13:00:00 GMT+0530 (IST)", theatre_id: theatre['_id'])
movie = Movie.create(name: 'Chhota Bheem Himalayan Adventure', language: 'Hindi', genre: 'Kids', duration: '3.2', movie_format: '2D', trailer_url: 'www.youtube1.com', rating: '7', release_date: "Thu Feb 11 1992 13:00:00 GMT+0530 (IST)", theatre_id: theatre['_id'])
movie = Movie.create(name: 'Dilwale', language: 'Hindi', genre: 'Romantic', duration: '3.5', movie_format: '2D', trailer_url: 'www.youtube1.com', rating: '9', release_date: "Thu Feb 13 1992 14:00:00 GMT+0530 (IST)", theatre_id: theatre['_id'])
movie = Movie.create(name: 'Point Break - 3D - Hindi', language: 'Hindi', genre: 'Adventurous', duration: '2.5', movie_format: '2D', trailer_url: 'www.youtube1.com', rating: '7', release_date: "Thu Feb 11 1992 12:00:00 GMT+0530 (IST)", theatre_id: theatre['_id'])
movie = Movie.create(name: 'Star Wars: The Force Awakens Hindi', language: 'Hindi', genre: 'Fiction', duration: '1.8', movie_format: '2D', trailer_url: 'www.youtube1.com', rating: '8', release_date: "Thu Feb 12 1992 13:00:00 GMT+0530 (IST)", theatre_id: theatre['_id'])
movie = Movie.create(name: 'Wazir', language: 'Hindi', genre: 'Drama', duration: '3', movie_format: '2D', trailer_url: 'www.youtube1.com', rating: '6', release_date: "Thu Feb 13 1992 14:00:00 GMT+0530 (IST)", theatre_id: theatre['_id'])
movie = Movie.create(name: "Daddy's Home", language: 'English', genre: 'Drama', duration: '3.2', movie_format: '3D', trailer_url: 'www.youtube1.com', rating: '8', release_date: "Thu Feb 11 1992 12:00:00 GMT+0530 (IST)", theatre_id: theatre['_id'])
movie = Movie.create(name: 'In the Heart of the Sea', language: 'English', genre: 'Romantic', duration: '3.2', movie_format: '3D', trailer_url: 'www.youtube1.com', rating: '6', release_date: "Thu Feb 12 1992 13:00:00 GMT+0530 (IST)", theatre_id: theatre['_id'])
movie = Movie.create(name: 'Our Brand Is Crisis', language: 'English', genre: 'Drama', duration: '2.5', movie_format: '3D', trailer_url: 'www.youtube1.com', rating: '7', release_date: "Thu Feb 13 1992 14:00:00 GMT+0530 (IST)", theatre_id: theatre['_id'])
movie = Movie.create(name: 'Star Wars: The Force Awakens', language: 'English', genre: 'Drama', duration: '2.5', movie_format: '3D', trailer_url: 'www.youtube1.com', rating: '9', release_date: "Thu Feb 11 1992 13:00:00 GMT+0530 (IST)", theatre_id: theatre['_id'])
movie = Movie.create(name: 'The Good Dinosaur', language: 'English', genre: 'Drama', duration: '2.6', movie_format: '3D', trailer_url: 'www.youtube1.com', rating: '8', release_date: "Thu Feb 12 1992 14:00:00 GMT+0530 (IST)", theatre_id: theatre['_id'])
movie = Movie.create(name: '702 Dixits', language: 'Marathi', genre: 'Drama', duration: '2.5', movie_format: '2D', trailer_url: 'www.youtube1.com', rating: '8', release_date: "Thu Feb 13 1992 13:00:00 GMT+0530 (IST)", theatre_id: theatre['_id'])
movie = Movie.create(name: "Lord Of Shingnapur", language: 'Marathi', genre: 'Drama', duration: '2.0', movie_format: '2D', trailer_url: 'www.youtube1.com', rating: '10', release_date: "Thu Feb 11 1992 12:00:00 GMT+0530 (IST)", theatre_id: theatre['_id'])
movie = Movie.create(name: "Katyar Kaljat Ghusali", language: 'Marathi', genre: 'Drama', duration: '3.2', movie_format: '2D', trailer_url: 'www.youtube1.com', rating: '9', release_date: "Thu Feb 12 1992 13:00:00 GMT+0530 (IST)", theatre_id: theatre['_id'])
movie = Movie.create(name: "Natsamrat", language: 'Marathi', genre: 'Drama', duration: '3', movie_format: '2D', trailer_url: 'www.youtube1.com', rating: '9', release_date: "Thu Feb 13 1992 14:00:00 GMT+0530 (IST)", theatre_id: theatre['_id'])

#seat fields(row, seat_number, screen_id)
seat1 = Seat.create(row: 'A', seat_number: 5, screen_id: screen1['_id'])
seat1 = Seat.create(row: 'B', seat_number: 7, screen_id: screen1['_id'])
seat1 = Seat.create(row: 'C', seat_number: 4, screen_id: screen2['_id'])

#show fields(starttime, endtime, screen_id, movie_id)
show1 = Show.create(starttime: 'Thu Feb 11 1992 12:00:00 GMT+0530 (IST)', endtime: 'Thu Feb 11 1992 15:12:12 GMT+0530 (IST)', screen_id: screen1['_id'], movie_id: movie['_id'])

#user fields(first_name, last_name, email, password, mobile, gender, date_of_birth)
user1 = User.create(first_name: 'Chinmay', last_name: 'Joshi', email: 'chinmayj93@gmail.com', encrypted_password: 'password', mobile: '8600983898', gender: 'male', date_of_birth: 'Thu Feb 20 1990 12:00:00 GMT+0530 (IST)')
user2 = User.create(first_name: 'Vikas', last_name: 'Kale', email: 'vikas@gmail.com', encrypted_password: 'password', mobile: '1234567890', gender: 'male', date_of_birth: 'Thu Feb 20 1990 12:00:00 GMT+0530 (IST)')

#booking fields(ticket_numbers, number_of_tickets, amount, payment_mode, card_type, card_number, user_id, movie_id)
booking = Booking.create(ticket_numbers: '1, 2, 3, 4', number_of_tickets: 4, amount: 500, payment_mode: 'Online', card_type: 'Debit Card', card_number: 123456789, user_id: user1['_id'], movie_id: movie['_id'])

#ticket fields(number, type, price, booking_id, seat_id, movie_id)
ticket1 = Ticket.create(number: 'Ticket A', type: "Silver", price: '100', booking_id: booking['_id'], seat_id: seat1['_id'], movie_id: movie['_id'])
ticket2 = Ticket.create(number: 'Ticket B', type: "Gold", price: '120', booking_id: booking['_id'], seat_id: seat1['_id'], movie_id: movie['_id'])
ticket2 = Ticket.create(number: 'Ticket C', type: "Platinum", price: '140', booking_id: booking['_id'], seat_id: seat1['_id'], movie_id: movie['_id'])


###------------------------- Flow Start-------------------------###
#user fields(first_name, last_name, email, password, mobile, gender, date_of_birth, booking_id)
#theatre fields(name, address, city)
#movie fields(anme, language, genere, duration, movie_format, poster, trailer_url, rating, release_date, theatre_id, booking_id)
#show fields(showtime,  screen_id, movie_id)
#screen fields(name, capacity, theatre_id)
#seat fields(row, seat_number, screen_id: nil)
###------------------------- Flow End-------------------------###
