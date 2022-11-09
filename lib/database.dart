var movies = [
  {
    'poster':
    'https://m.media-amazon.com/images/M/MV5BNWM0ZGJlMzMtZmYwMi00NzI3LTgzMzMtNjMzNjliNDRmZmFlXkEyXkFqcGdeQXVyMTM1MTE1NDMx._V1_FMjpg_UX1000_.jpg',
    'title': 'Dr. Strange in the Multiverse of Madness',
    'genre': 'Action, Adventure, Superhero, Fantasy, Horror, Sci-Fi',
    'rating': '7.0',
    'release': '2022',
    'runtime': '2h 06m',
    'type': 'movie',
    'size': '1.4 GB',
  },
  {
    'poster':
    'https://m.media-amazon.com/images/M/MV5BMTYwOTEwNjAzMl5BMl5BanBnXkFtZTcwODc5MTUwMw@@._V1_FMjpg_UX1000_.jpg',
    'title': 'Avatar',
    'genre': 'Action, Adventure, Fantasy, Sci-Fi, Mystery',
    'rating': '7.8',
    'release': '2009',
    'runtime': '2h 41m',
    'type': 'movie',
    'size': '1.4 GB',
  },
  {
    'poster':
    'https://m.media-amazon.com/images/M/MV5BOWQwOTA1ZDQtNzk3Yi00ZmVmLWFiZGYtNjdjNThiYjJhNzRjXkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_FMjpg_UX1000_.jpg',
    'title': 'Top Gun: Maverick',
    'genre': 'Action, Adventure, Drama',
    'rating': '8.5',
    'release': '2022',
    'runtime': '2h 11m',
    'type': 'movie',
    'size': '1.4 GB',
  },
  {
    'poster':
    'https://starwarsblog.starwars.com/wp-content/uploads/2017/05/1-star-wars-poster.jpg',
    'title': 'Star Wars: A New Hope (Episode IV)',
    'genre': 'Sci-Fi, Action, Fantasy, Adventure, Space Opera',
    'rating': '8.6',
    'release': '1978',
    'runtime': '2h 1m',
    'type': 'movie',
    'size': '1.4 GB',
  },
  {
    'poster':
    'https://sportshub.cbsistatic.com/i/2022/01/21/6c422820-0c68-41e2-8496-ccc76599f26a/spider-man-no-way-home-multiverse-poster.jpg?auto=webp&width=928&height=1374&crop=0.675:1,smart',
    'title': 'Spider-Man: No Way Home',
    'genre': 'Action, Superhero, Comedy, Sci-Fi, Fantasy, Adventure',
    'rating': '8.3',
    'release': '2021',
    'runtime': '2h 28m',
    'type': 'movie',
    'size': '1.4 GB',
  },
  {
    'poster':
    'https://m.media-amazon.com/images/M/MV5BOTBjMjA4NmYtN2RjMi00YWZlLTliYTktOTIwMmNkYjYxYmE1XkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_FMjpg_UX1000_.jpg',
    'title': 'Jurassic World Dominion',
    'genre': 'Action, Sci-Fi, Adventure, Fantasy, Monster',
    'rating': '5.7',
    'release': '2022',
    'runtime': '2h 27m',
    'type': 'movie',
    'size': '1.4 GB',
  },
  {
    'poster':
    'https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_.jpg',
    'title': 'Inception',
    'genre': 'Action, Sci-Fi, Thriller, Adventure, Heist, Drama',
    'rating': '8.8',
    'release': '2010',
    'runtime': '2h 28m',
    'type': 'movie',
    'size': '1.4 GB',
  },
  {
    'poster':
    'https://m.media-amazon.com/images/M/MV5BMzkyZGFlOWQtZjFlMi00N2YwLWE2OWQtYTgxY2NkNmM1NjMwXkEyXkFqcGdeQXVyNjY1NTM1MzA@._V1_UY1200_CR90,0,630,1200_AL_.jpg',
    'title': 'Harry Potter and the Philosopher\'s Stone',
    'genre': 'Adventure, Fantasy, Narrative',
    'rating': '7.6',
    'release': '2002',
    'runtime': '2h 32m',
    'type': 'movie',
    'size': '1.4 GB',
  },
];

var shows = [
  {
    'poster':
    'https://m.media-amazon.com/images/M/MV5BYTRiNDQwYzAtMzVlZS00NTI5LWJjYjUtMzkwNTUzMWMxZTllXkEyXkFqcGdeQXVyNDIzMzcwNjc@._V1_FMjpg_UX1000_.jpg',
    'title': 'Game of Thrones',
    'genre':
    'Serial, Action, Drama, Thriller, Suspense, Adventure, Tragedy, Medieval Fantasy',
    'rating': '9.2',
    'release': '2008',
    'type': 'show',
    'numberOfSeasons': '8',
  },
  {
    'poster':
    'https://m.media-amazon.com/images/M/MV5BZTY5YjQwYmEtOWJiNy00NDBmLTgxM2YtMmVkMmI0NzE1N2FjXkEyXkFqcGdeQXVyMjg1NDcxNDE@._V1_.jpg',
    'title': 'Lost in Space',
    'genre': 'Adventure, Drama, Family',
    'rating': '7.3',
    'release': '2016',
    'type': 'show',
    'numberOfSeasons': '3',
  },
  {
    'poster':
    'https://m.media-amazon.com/images/M/MV5BODI0ZTljYTMtODQ1NC00NmI0LTk1YWUtN2FlNDM1MDExMDlhXkEyXkFqcGdeQXVyMTM0NTUzNDIy._V1_FMjpg_UX1000_.jpg',
    'title': 'Moeny Heist',
    'genre': 'Heist, Drama, Thriller, Crime Film',
    'rating': '8.2',
    'release': '2016',
    'type': 'show',
    'numberOfSeasons': '5',
  },
  {
    'poster':
    'https://m.media-amazon.com/images/M/MV5BMWY3NTljMjEtYzRiMi00NWM2LTkzNjItZTVmZjE0MTdjMjJhL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyNTQ4NTc5OTU@._V1_.jpg',
    'title': 'Sherlock',
    'genre': 'Mystery, Drama, Thriller, Comedy',
    'rating': '9.1',
    'release': '2013',
    'type': 'show',
    'numberOfSeasons': '4',
  },
  {
    'poster':
    'https://m.media-amazon.com/images/M/MV5BMDRjYWI5NTMtZTYzZC00NTg4LWI3NjMtNmI3MTdhMWQ5MGJlXkEyXkFqcGdeQXVyNTg4MDc4Mg@@._V1_.jpg',
    'title': 'Stranger Things',
    'genre': 'Horror, Drama, Thriller, Supernatural',
    'rating': '8.3',
    'release': '2017',
    'type': 'show',
    'numberOfSeasons': '4',
  },
  {
    'poster':
    'https://m.media-amazon.com/images/M/MV5BNTkwOTE1ZDYtODQ3Yy00YTYwLTg0YWQtYmVkNmFjNGZlYmRiXkEyXkFqcGdeQXVyNTc4MjczMTM@._V1_.jpg',
    'title': 'Loki',
    'genre': 'Superhero Fiction, Procedural Drama, Fantasy Television',
    'rating': '8.2',
    'release': '2021',
    'type': 'show',
    'numberOfSeasons': '1',
  },
  {
    'poster':
    'https://m.media-amazon.com/images/M/MV5BZDhlMzY0ZGItZTcyNS00ZTAxLWIyMmYtZGQ2ODg5OWZiYmJkXkEyXkFqcGdeQXVyODkzNTgxMDg@._V1_.jpg',
    'title': 'The Mandalorian',
    'genre': 'Space Western, Adventure Fiction',
    'rating': '8.7',
    'release': '2019',
    'type': 'show',
    'numberOfSeasons': '2',
  },
  {
    'poster':
    'https://pbs.twimg.com/media/FZpsF6sWAAEZkQA?format=jpg&name=900x900',
    'title': 'The Lord of the Rings: The Rings of Power',
    'genre': 'Drama, Fantasy Television, Action Fiction, Adventure',
    'rating': '6.8',
    'release': '2022',
    'type': 'show',
    'numberOfSeasons': '1',
  },
];

// var myList = [];

var myList = [
  {
    'poster':
    'https://pbs.twimg.com/media/FZpsF6sWAAEZkQA?format=jpg&name=900x900',
    'title': 'The Lord of the Rings: The Rings of Power',
    'genre': 'Drama, Fantasy Television, Action Fiction, Adventure',
    'rating': '6.8',
    'release': '2022',
    'type': 'show',
    'numberOfSeasons': '1',
  },
  {
    'poster':
    'https://m.media-amazon.com/images/M/MV5BMDRjYWI5NTMtZTYzZC00NTg4LWI3NjMtNmI3MTdhMWQ5MGJlXkEyXkFqcGdeQXVyNTg4MDc4Mg@@._V1_.jpg',
    'title': 'Stranger Things',
    'genre': 'Horror, Drama, Thriller, Supernatural',
    'rating': '8.3',
    'release': '2017',
    'type': 'show',
    'numberOfSeasons': '4',
  },
  {
    'poster':
    'https://m.media-amazon.com/images/M/MV5BOWQwOTA1ZDQtNzk3Yi00ZmVmLWFiZGYtNjdjNThiYjJhNzRjXkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_FMjpg_UX1000_.jpg',
    'title': 'Top Gun: Maverick',
    'genre': 'Action, Adventure, Drama',
    'rating': '8.5',
    'release': '2022',
    'runtime': '2h 11m',
    'type': 'movie'
  },
  {
    'poster':
    'https://starwarsblog.starwars.com/wp-content/uploads/2017/05/1-star-wars-poster.jpg',
    'title': 'Star Wars: A New Hope (Episode IV)',
    'genre': 'Sci-Fi, Action, Fantasy, Adventure, Space Opera',
    'rating': '8.6',
    'release': '1978',
    'runtime': '2h 1m',
    'type': 'movie'
  },
  {
    'poster':
    'https://m.media-amazon.com/images/M/MV5BNWM0ZGJlMzMtZmYwMi00NzI3LTgzMzMtNjMzNjliNDRmZmFlXkEyXkFqcGdeQXVyMTM1MTE1NDMx._V1_FMjpg_UX1000_.jpg',
    'title': 'Dr. Strange in the Multiverse of Madness',
    'genre': 'Action, Adventure, Superhero, Fantasy, Horror, Sci-Fi',
    'rating': '7.0',
    'release': '2022',
    'runtime': '2h 06m',
    'type': 'movie'
  },
  {
    'poster':
    'https://m.media-amazon.com/images/M/MV5BMTYwOTEwNjAzMl5BMl5BanBnXkFtZTcwODc5MTUwMw@@._V1_FMjpg_UX1000_.jpg',
    'title': 'Avatar',
    'genre': 'Action, Adventure, Fantasy, Sci-Fi, Mystery',
    'rating': '7.8',
    'release': '2009',
    'runtime': '2h 41m',
    'type': 'movie'
  },
  {
    'poster':
    'https://m.media-amazon.com/images/M/MV5BYTRiNDQwYzAtMzVlZS00NTI5LWJjYjUtMzkwNTUzMWMxZTllXkEyXkFqcGdeQXVyNDIzMzcwNjc@._V1_FMjpg_UX1000_.jpg',
    'title': 'Game of Thrones',
    'genre':
    'Serial, Action, Drama, Thriller, Suspense, Adventure, Tragedy, Medieval Fantasy',
    'rating': '9.2',
    'release': '2008',
    'type': 'show',
    'numberOfSeasons': '8',
  },
  {
    'poster':
    'https://m.media-amazon.com/images/M/MV5BZTY5YjQwYmEtOWJiNy00NDBmLTgxM2YtMmVkMmI0NzE1N2FjXkEyXkFqcGdeQXVyMjg1NDcxNDE@._V1_.jpg',
    'title': 'Lost in Space',
    'genre': 'Adventure, Drama, Family',
    'rating': '7.3',
    'release': '2016',
    'type': 'show',
    'numberOfSeasons': '3',
  },
];

var notifications = [
  {
    'image':
    'https://m.media-amazon.com/images/M/MV5BYTRiNDQwYzAtMzVlZS00NTI5LWJjYjUtMzkwNTUzMWMxZTllXkEyXkFqcGdeQXVyNDIzMzcwNjc@._V1_FMjpg_UX1000_.jpg',
    'title': 'Game of Thrones',
    'message':
    'Winter is here! Watch the most awaited final season of Game of Thrones',
    'time': '2 seconds ago',
  },
  {
    'image':
    'https://pbs.twimg.com/media/FZpsF6sWAAEZkQA?format=jpg&name=900x900',
    'title': 'Rings of Power',
    'message':
    'Let\' head back into Middle Earth with the brand new TV Show from Amazon.',
    'time': '5 minutes ago',
  },
  {
    'image':
    'https://m.media-amazon.com/images/M/MV5BMTYwOTEwNjAzMl5BMl5BanBnXkFtZTcwODc5MTUwMw@@._V1_FMjpg_UX1000_.jpg',
    'title': 'Avatar',
    'message':
    'Revisit the old classic before Avatar 2 heads into theatres in December',
    'time': '2 hours ago',
  },
  {
    'image':
    'https://sportshub.cbsistatic.com/i/2022/01/21/6c422820-0c68-41e2-8496-ccc76599f26a/spider-man-no-way-home-multiverse-poster.jpg?auto=webp&width=928&height=1374&crop=0.675:1,smart',
    'title': 'Spider-Man: No Way Home',
    'message': 'You Friendly neighbourhood Spider-Man is back!!',
    'time': '3 days ago',
  },
  {
    'image':
    'https://m.media-amazon.com/images/M/MV5BODI0ZTljYTMtODQ1NC00NmI0LTk1YWUtN2FlNDM1MDExMDlhXkEyXkFqcGdeQXVyMTM0NTUzNDIy._V1_FMjpg_UX1000_.jpg',
    'title': 'Money Heist',
    'message': 'An all new heist awaits',
    'time': '7 days ago',
  },
  {
    'image':
    'https://m.media-amazon.com/images/M/MV5BMWY3NTljMjEtYzRiMi00NWM2LTkzNjItZTVmZjE0MTdjMjJhL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyNTQ4NTc5OTU@._V1_.jpg',
    'title': 'Sherlock',
    'message':
    'Will Dr.Watson be able to save holmes from the new trouble he has got himself into? Find out as the new episode is out.',
    'time': '1 month ago',
  },
  {
    'image':
    'https://m.media-amazon.com/images/M/MV5BOWQwOTA1ZDQtNzk3Yi00ZmVmLWFiZGYtNjdjNThiYjJhNzRjXkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_FMjpg_UX1000_.jpg',
    'title': 'Top Gun: Maverick',
    'message': 'Check out Tom Cruise in his new action thriller',
    'time': '2 months ago',
  },
  {
    'image':
    'https://m.media-amazon.com/images/M/MV5BNTkwOTE1ZDYtODQ3Yy00YTYwLTg0YWQtYmVkNmFjNGZlYmRiXkEyXkFqcGdeQXVyNTc4MjczMTM@._V1_.jpg',
    'title': 'Loki',
    'message': 'The God is Mischief is back in the brand new season of Loki',
    'time': '6 months ago',
  },
  {
    'image':
    'https://starwarsblog.starwars.com/wp-content/uploads/2017/05/1-star-wars-poster.jpg',
    'title': 'Star Wars: A New Hope (Episode IV)',
    'message': 'A long time ago in a galaxy far far away..',
    'time': '1 year ago',
  },
];

List<String> category = [
  'All',
  'Movies',
  'TV Shows',
  'Anime',
  'K-Drama',
  'Sitcom',
  'Reality Show',
];

List<String> genre = [
  'Adventure',
  'Action',
  'Horror',
  'Drama',
  'Comedy',
  'Romance',
  'Fantasy',
  'Sci-Fi',
  'Animation',
  'Music',
  'Narrative',
  'Crime',
  'Gangster'
];

List<String> region = [
  'All Regions',
  'US',
  'South Korea',
  'China',
  'India',
  'UK',
  'France',
  'South Pacific'
];

List<String> timePeriods = [
  'Any',
  '2022',
  '2021',
  '2020',
  '2011-19',
  '2001-10',
  '1990s',
  '1980s',
  '1970s',
  '1960s'
];

List<String> sort = [
  'Latest Release',
  'Popularity',
];

List<String> selectedListFinal = [];
List<String> selectedListCurrent = [];
// The searched term to pass to next screen
String searchedTerm = "";

var cast = [
  {
    'name': 'Stan Lee',
    'profile':
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGJYDIo32NbMSjZKy4bnuXtlgi0b8MGSjo_w&usqp=CAU',
    'role': 'Legend'
  }
];