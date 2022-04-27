import 'package:progit_activity_booker/models/profile.dart';

Map<String, Profile> USERS = {
  '1': Profile(
      uid: '1',
      shortName: 'Abrha A.',
      firstName: 'Abrha',
      name: 'Abrha Abrha',
      imageUrl:
          'https://storage.googleapis.com/progit-social.appspot.com/images/abrha.webp?GoogleAccessId=firebase-adminsdk-b8qw4%40progit-social.iam.gserviceaccount.com&Expires=16447014000&Signature=a7Lm%2FsVyBj84AV5Ykr42OYi6vfHCAXFdybA5a77s8%2FVbDG%2Fiz2DY0cagblgDro%2BXRqeWnfpT5fxkrhuInY7mD7U9OVEOJF0nh0xz9Li7Smbygnwx9xxFfK8lC1LO%2B0IqKfzBayyV9LcIHQ7iAtsQASGEdP56wYzoelAWZDvCcez6YC29b3LIwi9vWYRF83U0ZvxUxXq%2F0FeH%2B1g4%2Fdv4P1QnkmnFmYlCjU%2Bgmd3%2BCSPlGZqnRM%2BOQ%2B%2BqaYm0APh3QCo9BF6%2BVMMpM8qZa8vOcD%2F4afNnkSeTGmqLkJ4aULFrtBvcokxi3p64bnmUayO8lJJQzHrjILIc7gOcBVSj3Q%3D%3D'),
  '2': Profile(
      uid: '2',
      shortName: 'Emil S.',
      firstName: 'Emil',
      name: 'Emil Schrøder',
      imageUrl:
          'https://storage.googleapis.com/progit-social.appspot.com/images/emil.webp?GoogleAccessId=firebase-adminsdk-b8qw4%40progit-social.iam.gserviceaccount.com&Expires=16447014000&Signature=Pspu%2B2EyrOwYYhvMP0mfw1f4bA%2FTkeHRRvrtbCL6y6Iv54bMmEZ01Qo668ydbG2IFjQnM3rjt3UuREscBfeCV%2BPpJKVludoVHgn65urFrlWJogUWRhoCems8XoqzDoHTQdtmikdoMh9gPpdnvth2J63ghJ4tH0Av8gznd4Cjz3CBxaqf8TyhSFc8JUP8kfhiGLZYX5RaYHmlj7k%2FOdZhaqGLoCob2Hs9YdlWi%2BkduR8dZkC0s7d8B1VGupQjOjL%2F%2F7uZEo8r33CrNNJ0j%2F9nsL3OeGP7EicPAJN%2BTCRK4LG%2FNsjmmvcvIAgg6ka%2B2MWwf7APpR7cn8O0nUCq77rxRQ%3D%3D'),
  '3': Profile(
      uid: '3',
      shortName: 'Endre S.',
      firstName: 'Endre',
      name: 'Endre Skogen',
      imageUrl:
          'https://storage.googleapis.com/progit-social.appspot.com/images/endre.webp?GoogleAccessId=firebase-adminsdk-b8qw4%40progit-social.iam.gserviceaccount.com&Expires=16447014000&Signature=UM0MKmW9idCRalJ9q%2BC%2FgfJdeQlbKxmbmKVi5SADNJapJukGebN8YYgUj3oxfPQ%2BQW3SVpnRTPJSnDR7Nfd8TgK7sGSIVJ5HVYTkNXOHhi4tvTt9HURapVb%2BxVGH7g8N7yWmZZSrkNnSbbaLfQCg9TSlAKX%2BDrNuUJphJ3I0iwfrdWs8906L5ZPlUdFi2pc2jUaQGjVAaCTk8UW8ziFz07x5r37%2FgC%2Bn104h5JHd%2BlCKIPp1A%2FTWiMYrJNf7sq5ollRCFCXTl7Ia7W1SPZ0%2FVY07UdJECC9Suxjd5idqDz%2F8lH7hswQl2purlA8YWfuNTKcGN%2BLZag16xgypLDZDAA%3D%3D'),
  '4': Profile(
      uid: '4',
      shortName: 'Håvard H.',
      firstName: 'Håvard',
      name: 'Håvard Hunshamar',
      imageUrl:
          'https://storage.googleapis.com/progit-social.appspot.com/images/havard.webp?GoogleAccessId=firebase-adminsdk-b8qw4%40progit-social.iam.gserviceaccount.com&Expires=16447014000&Signature=Yaax%2FxEabjVikTBZjCV36QUsEnNc%2FEn8D3s18oQ2yZ5TWsJzg1E9472vbp3lnkfFSKPZ4zYkXLWZCtx6FV8VAlvEiCObB1jI4YmiPAqZkX7p2YpyRnudiYm%2FBI2fOrc%2BUgLwK%2FqC0K%2FFtwollyvotgIRH7qThsyP4iYjEs5XJBNZpx6PoPrhsqVMeOZvo%2FdYE2yyFtEygtBxrFgq6%2BbYPqJdBuFKPokme7LJwEw1OnOgYaMtipVXHAzt%2B3VK4qjFWXPMYt98Lz%2BU%2BRAJ9FWmajYOFB%2Bc5VLLeWBpqdTV9iDoobk1Qc3HwlCjptnaMOTYTZsBRWeaNfNcG04bkk0mrA%3D%3D'),
  '5': Profile(
      uid: '5',
      shortName: 'Jesper P.',
      firstName: 'Jesper',
      name: 'Jesper Paulsen',
      imageUrl:
          'https://storage.googleapis.com/progit-social.appspot.com/images/jesper.webp?GoogleAccessId=firebase-adminsdk-b8qw4%40progit-social.iam.gserviceaccount.com&Expires=16447014000&Signature=Bj2dQEF3xUJrV8ZYdk162ETjg40tgQqd5imk982NmT9QmJptTFdA9Uib%2BMJ%2Fm6n72pgOZJSEiIo073aiQLTzCff%2BGtV4lEddeAtfqx%2F89x4GdNV8%2BCpgA7XL%2B6aaGe7iO5J0cMQ6gvY4cQGBj%2BZN%2BtOWJaCD0dFBv6w4YabjBYlLReQQGGBusOUnNoDV71XAxIpi%2BZkyFdIMeEL8gBMlyvGsBO%2BXcVAh%2FMq2UmIEvU4EI5%2BT6QjDjz6DKAv2GGZ9YujL%2BJl9ffeV9g%2FLXec0%2BMyLTCRQQxQI9%2Bx6LRS2toOGITjT3qroxNUBu4jHK6qdr6IzJdKQwP2R2j2Z0OteRw%3D%3D'),
  '6': Profile(
      uid: '6',
      shortName: 'Martin F.',
      firstName: 'Martin',
      name: 'Martin Farstad',
      imageUrl:
          'https://storage.googleapis.com/progit-social.appspot.com/images/martin.webp?GoogleAccessId=firebase-adminsdk-b8qw4%40progit-social.iam.gserviceaccount.com&Expires=16447014000&Signature=Vx10FKL7IfZozJRvqPxLUkHe1QjV6qAtqXlHI4f7hYJVcc%2B1KBqVdFJiKElYV7VexnoZ3XwpDC34x5h%2FLH4E71mb7JjoAf5CsPlLi9xt7yDgYQjeyQKGLhHcmF%2BBi6ev%2FrtRDeQEGAObxzdN3QHbF79EKXaVIc2WSGH2u%2FcoRDspobmJmvEOBtsBoWJKzeQHXWssokZEN50g%2FRFr82nCxevD%2FxKWSnefg57Dx5PHUGdZzHky5BbNP4VfXE3JcZjVNpm62uAoVq9Pg5VTj89te%2BbswTXnImQQRnuD3rNnRELto1qdYKHZN7sI4AbYW6s9ECLzzYAYuqLNxXrm7K8miQ%3D%3D'),
  '7': Profile(
      uid: '7',
      shortName: 'Mathias I.',
      firstName: 'Mathias',
      name: 'Mathias Iden',
      imageUrl:
          'https://storage.googleapis.com/progit-social.appspot.com/images/mathias.webp?GoogleAccessId=firebase-adminsdk-b8qw4%40progit-social.iam.gserviceaccount.com&Expires=16447014000&Signature=Oo2KWEx%2Fqj7rBrOsjJzefYlxAz2W5bCGKRmDHEZAXJPOrzMaMAoQFTmBAfJ0Tx3MoLnHeHzwb34BrkhQ8mkElD2JQyJtLVU6x5SZYvp40m5taSd3AGBdeDIJ6VgSZ1ozIvZUh6QvPEE1G%2BByhE1rpasJDa6s51eO4XRCukeKyy71j34JH%2F07LsE%2FQw1I9owg9UUjcH9mnBCJq1kHZf2eVgfAE%2FFa%2BouyL4dNtwj%2BWnsX9QqxPjY%2FjRY9XL1MOq8tjB4dJSMrm4f%2BfAu69H9X2f2J4nciymP8Thmpy1JAggwfGbOAK1vKhnYnvZEY57fe6iEBhencAFGMsv23BpVnrA%3D%3D'),
  '8': Profile(
      uid: '8',
      shortName: 'Morten B.',
      firstName: 'Morten',
      name: 'Morten Bujordet',
      imageUrl:
          'https://storage.googleapis.com/progit-social.appspot.com/images/morten.webp?GoogleAccessId=firebase-adminsdk-b8qw4%40progit-social.iam.gserviceaccount.com&Expires=16447014000&Signature=NaeIPWBa1IbYVTNAjDLU2B4G7FCe3Czm5x1ol95sTM1wx4%2BNNr1VXwjdaj1116x2d5WctLzShe0obF31UXhG9a4zWS%2FLUAeJDlLLYdt3vd6LQO%2FJhz78iMSBY%2F6lrrnrx%2Bz3DmnDdLPH4QCD8FUtiE9G%2BDSQxtQO5Y%2Bvvhy6l5fLL%2F1kjPK8vI8RoZH8o9fFI0dsS5O2VXn%2F9HJu6MIBejREXiiTa%2BXqi%2FtB1dfGsdpZu6mWS%2BkZoy0izxIhxFt%2BuwSkaHJ78IBzBW1J6OxmHBfaWs0s4hPxSaENAdmjPVOX5zGHVKzKTjXSWgdxi8LC48zFS0HpGmPwLsU77XkEYA%3D%3D'),
  '9': Profile(
      uid: '9',
      shortName: 'Ole Andreas H.',
      firstName: 'Ole Andreas',
      name: 'Ole Andreas Hansen',
      imageUrl:
          'https://storage.googleapis.com/progit-social.appspot.com/images/olea.webp?GoogleAccessId=firebase-adminsdk-b8qw4%40progit-social.iam.gserviceaccount.com&Expires=16447014000&Signature=DcHXm22zTsSjvoyPxBxdgrnxvaOuHarNGPPF7LI0NEjS9sOboYu6VxNYJZBxcChzzV33EPTfZwvv1rgw2hBpyvxvlYYm7Tu2V6Dk5grP5uHofURnJWzLByQyBi5jhzJBF0qaKcQwP1VERVs2BQcBZRhwSb0PK7eZl%2FN1yfMsoXRQpAHSnovDCq6ivlTeUjtRFHFuCGYEbstUIvmnyLnBwelr4Rekq64NG1p1KyRC4YniEZ85lvOsNEQytn%2F40OQZ%2Bp3r9f7QK%2F8X9RW487ssEk2nZ9pbZ7cAyuOiX%2BuDdWyJrXqDkqQ6SGZDHN9IzLFkh0%2F4CVy%2BYiZI2P0Y1qoR%2Bw%3D%3D'),
  '10': Profile(
      uid: '10',
      shortName: 'Ole Martin S.',
      firstName: 'Ole Martin',
      name: 'Ole Marting Skaug',
      imageUrl:
          'https://storage.googleapis.com/progit-social.appspot.com/images/olem.webp?GoogleAccessId=firebase-adminsdk-b8qw4%40progit-social.iam.gserviceaccount.com&Expires=16447014000&Signature=Dx7hEPGCaRWRJWaB2bGJ4uGpf1tErSu9lkeiwQHXfzOMhlqQvKBxj1e%2BcX9PiigVm%2B8YNQDESe43UViYhV%2BeP%2BuOTOEp9NZ01QGRGCvyWkr0ToQPAqbg83tYeAjYXloRyT75ck4SXPes55vcKFRB%2BaqNTWux2aAmFl0nmjbQNpofohstsOXOF4oXgafeMphBodZMMygjdqbD6wrKuNIowdCLLLmGxIACoVF9xFELsdILooI4fJ6BNh%2BTQkCQXvaCH6FVUh0dlfCV1D1JsVhO2kUYhOZY2QpDF6ob%2BjUnA0J%2BOQbNA3iMECmbuTjOcMdyo4n4uT7SC9eze7DEY6yv8Q%3D%3D'),
  '11': Profile(
      uid: '11',
      shortName: 'Patrick H.',
      firstName: 'Patrick',
      name: 'Patrick Hjerpseth',
      imageUrl:
          'https://storage.googleapis.com/progit-social.appspot.com/images/patrick.webp?GoogleAccessId=firebase-adminsdk-b8qw4%40progit-social.iam.gserviceaccount.com&Expires=16447014000&Signature=e9vCSniRXSXXKoeBU0qr7sn32D82hOO7gQkntGxjXFB6mWWM2%2BZACiXprDZ050mso5TQiP4KVs4Gxe6g342hgxEgdE2YSUJ5DqtCHK%2FW8d2eBygVd4NpaNAdLlf2KfhTcBG0g1aVWPKQi4P0ITbYJ5sGkH3XR4zoA5JpOwmb0IPS4NtddCV77JeA%2Bo279kL58pY%2Fl4RWHNxVDXlDtP2zS8ugOSZi3jxeqHXs%2B6b7ImfsqKb5Y7Hb3bAzHkRmm8JLde4wNHk4KO2uZvSINFK2iXeP5aGTcQX%2FmhcYSamietJNV0PHNLPgQhSf2K4FG1QSxEkgDTEe9dOWOxy1%2BIJ%2F1A%3D%3D'),
  '12': Profile(
      uid: '12',
      shortName: 'Sigurd G.',
      firstName: 'Sigurd',
      name: 'Sigurd Glende',
      imageUrl:
          'https://storage.googleapis.com/progit-social.appspot.com/images/sigurd.webp?GoogleAccessId=firebase-adminsdk-b8qw4%40progit-social.iam.gserviceaccount.com&Expires=16447014000&Signature=lFZZlkuait3Q2xmGIx2eGuzEcz9NmOuq1MQGkja8yLRjlQhi5pZSWARjJpBJLOedd8d0TpeT2qmM7tEpOU3FNCfrVXKwrnuKNQJzKeCrDvW2u1cUbDYL6j8Jw%2Bsr4w%2FuCxpT8stlUBe6jZnKqP2zXd75eaSf%2FZBKeuGg5%2FXa%2FiTIdEwLRlA5ljW%2FYDsOdwm%2BLa61le5CZ93kBTqSnZvDTrGiNMpnbmYlFUZQ1BFxx%2Big8B5lVWrxvo4CcX8MpSzl7rLOObkiF8UT6%2FT%2BCHNafC%2FhQVkfucaMu%2FG8MSSNK8nI19RzkV8D5jbFHjUEQivN1dWL7aouEOxhTL9S8L%2BeLg%3D%3D'),
  '13': Profile(
      uid: '13',
      shortName: 'Silje H.',
      firstName: 'Silje',
      name: 'Silje Hansen',
      imageUrl:
          'https://storage.googleapis.com/progit-social.appspot.com/images/silje.webp?GoogleAccessId=firebase-adminsdk-b8qw4%40progit-social.iam.gserviceaccount.com&Expires=16447014000&Signature=SyO1L6lAe0gjlkazIqeoZhF72W2v0IPcZ7Owf7HyfjEoscISmieY6qHV78FQs0JB77qZS%2BV%2BjsAEEm%2Fl5dojTVrLLEUHNjhu6RW1LZO1nlNoYo1gmUgLeaOzcx6DiJN1Lsq9LkcVOj2jJGgNsCVTUKAZR9e6iaKJSMw%2BOCxer56ZEF8v1y3rK1hGRFJ9XCEBu%2BBGOJo1mqRmGY3Fe5bxYJUZzkiHA6lchEGxk70uKmxHwFOuP6ebCjvJHVexPUJOkANWwNdVH194o9KFLvs2dRhDzdB9aHQHS1B3ClgouIZAkvuFeHJCGP3CxyiySqSRKcRGpxYYhOCS33Uchqll9g%3D%3D'),
  '14': Profile(
      uid: '14',
      shortName: 'Steffen A.',
      firstName: 'Steffen',
      name: 'Steffen Aas',
      imageUrl:
          'https://storage.googleapis.com/progit-social.appspot.com/images/steffen.webp?GoogleAccessId=firebase-adminsdk-b8qw4%40progit-social.iam.gserviceaccount.com&Expires=16447014000&Signature=Dax9EsUHrtj%2B2A3F%2FmghWTFmkY3Ss%2FntaEMXYcGlf6ezJhPO3%2BtnGkStn9g2%2BjK5KNtNWoDsiNZvOjB4RWdvGGnR4fm0xHqa0bCjSTo4N8ZiDqzWZdVJz6WEC8JHabtRFmerT7Yn5FVR78%2BrF4JfuXRUoHqyDCiyGLQ4hzSyUEjfuj3yVVgn8EVK9eA7VILWy6q4U6WtlCuyOn6kCEO%2BVV%2FZQJHVtFr4Ce58nl1t5QRmJkV6z6lgKECY6L2bTIDX219kEQkDCjPJj2xyJ8AL3Lz7c7acDifgxsP9Vhjg3CluX3L2jERV49%2FN0LTI7DvnqMC9C8vn8drJ1e%2B%2Bc%2FAQNg%3D%3D'),
  '15': Profile(
      uid: '15',
      shortName: 'Stian D.',
      firstName: 'Stian',
      name: 'Stian Dysthe',
      imageUrl:
          'https://storage.googleapis.com/progit-social.appspot.com/images/stian.webp?GoogleAccessId=firebase-adminsdk-b8qw4%40progit-social.iam.gserviceaccount.com&Expires=16447014000&Signature=gKglifd7xkPCJzifTKkPGcckb21EOczemGh80Eg2%2BVIIC9p%2BdMHaTyw%2F1lOQzGQI8riBHn%2BjaTBnyh999Z0MHvgnJc%2FvzLkP1FcgyGc%2Fb0SvioL3Us58%2BsgqCkWJzAGdZD63hL0V3aho1d0rLXGptb9ZnhgRNCLZEgj21oS7l9KMh8dJrZWvXdJ0A0tJNwbA7xQez8dgcqcfuuhDZS3HXhZMC88tT8HQDEb%2FL7zdLYRY8iu6BgnEevK%2FZ7zLj7n7CJT1jjTDudW2t%2BLW7YfJezd%2Fe7rWR7vfs17dRgj4vSEhMyYaMJkFcjyDD5wRqQjcIvhf19tvJt8ScS2r8r90eA%3D%3D'),
  '16': Profile(
      uid: '16',
      shortName: 'Tore H.',
      firstName: 'Tore',
      name: 'Tore Hågensen',
      imageUrl:
          'https://storage.googleapis.com/progit-social.appspot.com/images/tore.webp?GoogleAccessId=firebase-adminsdk-b8qw4%40progit-social.iam.gserviceaccount.com&Expires=16447014000&Signature=Rtguv6nEkEftKlYnb7Z9D4kGtdW%2Ba86SC3bBujDbVMKgdt2vV%2FEuhRfXmgSA32b5TNCgsd7F9M5lgGpXQdDd%2BcTelO3Jc%2Bwb8SqOsbzx0k43l3WQKDo%2BZN0XplSHKnh9GwZtZJRW98ifJODVnsKYteqAIg8aykXjpgxociG%2BqpndZy04H6OoKj69H0mwyj6367cGZq8r90X%2BXRu2A8Yy49BiL2TE45pXq8hQBRTVi%2BeTRGknyYRygxl9btqwVjqifsr%2FRRr9ckKwZHb19RfFIKsgWqoAMahgp%2BoUXLpF8WEGwkOKt4gK2DLjX8EkFwb2kVTqOikNw%2BQwx1r7iX2Img%3D%3D'),
  '17': Profile(
      uid: '17',
      shortName: 'Øystein W.',
      firstName: 'Øystein',
      name: 'Øystein Waage',
      imageUrl:
          'https://storage.googleapis.com/progit-social.appspot.com/images/%C3%B8ystein.webp?GoogleAccessId=firebase-adminsdk-b8qw4%40progit-social.iam.gserviceaccount.com&Expires=16447014000&Signature=amrHgnQrw%2Ffpd3qS8s41krgXyAZp%2F%2BhIu8A5EAgTOa4xmJbjolvh9gZEwbZWdfKpsmQBS11%2BFj4prvsqZyoHyvq5l8VLw0g1R7sQZrIBleHMzod%2FgXGcYVHmgTvHDZkRAJ2ra1aRmRIgLs%2Bil8%2FJgyj8DAVs0IFzuVM1UtC%2BwksOPevClpHcakPvumC4L50uu03HQKAW1jamzF3Etmc0Q2pXg59iuv9%2FjIoj5ChW9TjGy0gO7CchzXFfIFzO7SI2M0Xb8tP7NQB5k%2ByM9PJF4D6%2B1Ljx4b%2BvTMFbDJY%2B1O1gD4mjvYAHNjfr4j1wfFT%2FbaGQhd3W76WbkE79gKE9Zg%3D%3D'),
  '18': Profile(
      uid: '18',
      shortName: 'Øyvind A.',
      firstName: 'Øyvind',
      name: 'Øyvind Ahlstrøm',
      imageUrl:
          'https://storage.googleapis.com/progit-social.appspot.com/images/%C3%B8yvind.webp?GoogleAccessId=firebase-adminsdk-b8qw4%40progit-social.iam.gserviceaccount.com&Expires=16447014000&Signature=fwwL1BOdZiE8jl8YFkaVp4Q5dIg3JiBSwQGY9C4zd4KVuO4%2BKwQ88BmWIs6TtotTrDCI9Dxl9IWARy%2Fe%2Fyb4XWq%2BBvK%2BE6uY2RvUggMAKburciE%2FVKFeLjMxobqwaAdJxzzR%2B5Mqe5lBbGUauI%2FWxt73hncbyeslVBOkq0YxnUCpREQfsh4Jszfvi2LpfgEO1d9WcTi%2B3Bc3noOKQpVueD5d3leQyMs9BlMIN0JZsoBVkPjUG5cvmvtD2aaT7kRp0h8uzZbQKfJ0vwnUG3JDzSJ7AVc4yf68RcWw%2Fbf0jYjtyHlrDgXtvkw7wY5c4lQ%2BWLpq%2FSpYD5oNqse%2FU1MnqA%3D%3D')
};
