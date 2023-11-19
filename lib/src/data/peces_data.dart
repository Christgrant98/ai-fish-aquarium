import 'package:login_flutter/src/database/database_helper.dart';
import 'package:login_flutter/src/models/peces_model.dart';

import '../models/user_model.dart';

List<Pez> peces = <Pez>[
  Pez(
    id: 1,
    name: "Marbled Headstander",
    imageRoute: "assets/carousel/marbled_headstander.jpg",
    description:
        "El Marbled Headstander (Abramites hypselonotus) es conocido como el 'Cabezón Marmoleado' o 'Cabezón de Espalda Alta'. Pertenece a la familia Anostomidae y al orden Characiformes. A diferencia de lo que su nombre sugiere, el Marbled Headstander no es un habitante de la superficie; más bien, se encuentra en las partes medias e inferiores del acuario. En su hábitat natural, a menudo se le encuentra con la cabeza hacia abajo y la cola hacia arriba en fisuras rocosas verticales estrechas.",
    comments: [
      {
        const User(
            id: 1,
            username: 'username',
            password: 'password',
            mail: 'mail',
            profilePicture: 'profilePicture'): 'aaaaaaa'
      },
    ],
  ),
  Pez(
    id: 2,
    name: "Spotted Raphael Catfish",
    imageRoute: "assets/carousel/spotted_raphael_catfish.jpg",
    description:
        "El Spotted Raphael Catfish (Agamyxis pectinifrons) es un pez de la familia Doradidae. Es conocido por sus patrones moteados y su comportamiento nocturno. Este pez originario de América del Sur prefiere hábitats con escondites y se alimenta principalmente de insectos y pequeños invertebrados. Su apariencia única y su comportamiento cautivador lo convierten en una adición interesante para acuarios comunitarios.",
  ),
  Pez(
    id: 3,
    name: "Common Clown Fish",
    imageRoute: "assets/carousel/common_clown_fish.jpg",
    description:
        "El Common Clown Fish (Amphiprion ocellaris) es famoso por su apariencia colorida y su relación simbiótica con las anémonas de mar. Originario de las aguas cálidas del Pacífico y el Índico, este pez es conocido por su comportamiento territorial y su capacidad para cambiar de género. Su asociación mutualista con las anémonas proporciona protección contra depredadores y un lugar seguro para poner huevos.",
  ),
  Pez(
    id: 4,
    name: "Cichlid",
    imageRoute: "assets/carousel/cichild.jpg",
    description:
        "El Cichlid (Cíclido) es un grupo diverso de peces pertenecientes a varias familias. Conocidos por su variada coloración y comportamiento territorial, los cíclidos se encuentran en una amplia variedad de hábitats, desde lagos hasta ríos. Muchas especies de cíclidos son apreciadas en acuarismo debido a su belleza y comportamiento único.",
    comments: [],
  ),
  Pez(
    id: 5,
    name: "Black Ghost Knifefish",
    imageRoute: "assets/carousel/black_gohs_knifefish.jpg",
    description:
        "El Black Ghost Knifefish (Apteronotus albifrons) es conocido por su cuerpo negro y alargado, con una aleta anal que se extiende a lo largo de su parte inferior. Originario de América del Sur, este pez nocturno es electrogénico, utilizando descargas eléctricas débiles para navegar y comunicarse. Su naturaleza única y su apariencia fascinante lo convierten en una opción popular para acuarios avanzados.",
    comments: [
      {
        const User(
          id: 201,
          username: 'Gabriela',
          password: '',
          mail: 'gabriela@example.com',
          profilePicture: '',
        ): 'Este Black Ghost Knifefish tiene una apariencia fascinante.',
      },
      {
        const User(
          id: 202,
          username: 'Luis',
          password: '',
          mail: 'luis@example.com',
          profilePicture: '',
        ): 'Me encanta observar la actividad nocturna del Black Ghost Knifefish.',
        const User(
          id: 203,
          username: 'María',
          password: '',
          mail: 'maria@example.com',
          profilePicture: '',
        ): '¿Alguien ha experimentado con la electrogénesis de este pez?',
      },
    ],
  ),
  Pez(
    id: 6,
    name: "Shadow Sea Catfish",
    imageRoute: "assets/carousel/shadow_sea_catfish.jpg",
    description:
        "El Shadow Sea Catfish (Centromochlus perugiae) es un pequeño bagre de agua dulce con una apariencia distintiva. Con su cuerpo oscuro y ojos grandes, parece una sombra en movimiento en el agua. Originario de la cuenca del Amazonas, este pez pacífico es adecuado para acuarios comunitarios y prefiere esconderse en áreas sombreadas.",
    comments: [
      {
        const User(
          id: 301,
          username: 'Carlos',
          password: '',
          mail: 'carlos@example.com',
          profilePicture: '',
        ): '¡El Shadow Sea Catfish es realmente único en su apariencia!',
      },
      {
        const User(
          id: 302,
          username: 'Laura',
          password: '',
          mail: 'laura@example.com',
          profilePicture: '',
        ): '¿Cómo es la interacción del Shadow Sea Catfish en un acuario comunitario?',
        const User(
          id: 303,
          username: 'Pedro',
          password: '',
          mail: 'pedro@example.com',
          profilePicture: '',
        ): 'Este pez parece un maestro del camuflaje. ¡Increíble!',
      },
    ],
  ),
  Pez(
    id: 7,
    name: "Tiger Oscar",
    imageRoute: "assets/carousel/tiger_oscar.jpg",
    description:
        "El Tiger Oscar (Astronotus ocellatus) es un pez cíclido grande y vibrante conocido por su coloración rayada y patrones únicos. Originario de América del Sur, el Oscar es apreciado por su personalidad carismática y su capacidad para reconocer a sus cuidadores. Sin embargo, es importante proporcionar un entorno espacioso para este pez robusto.",
    comments: [
      {
        const User(
          id: 401,
          username: 'Martina',
          password: '',
          mail: 'martina@example.com',
          profilePicture: '',
        ): '¡El Tiger Oscar tiene un patrón tan llamativo!',
      },
      {
        const User(
          id: 402,
          username: 'Antonio',
          password: '',
          mail: 'antonio@example.com',
          profilePicture: '',
        ): '¿Cómo es la interacción del Tiger Oscar con otros cíclidos en un acuario?',
        const User(
          id: 403,
          username: 'Valeria',
          password: '',
          mail: 'valeria@example.com',
          profilePicture: '',
        ): 'Me encanta la personalidad juguetona del Tiger Oscar.',
      },
    ],
  ),
  Pez(
    id: 8,
    name: "Mexican Cavefish",
    imageRoute: "assets/carousel/mexican_cavefish.jpg",
    description:
        "El Mexican Cavefish (Astyanax mexicanus) es una especie de pez adaptada a la vida en cuevas. Carece de pigmentación y ojos desarrollados debido a su entorno oscuro. Originario de México, este pez es interesante desde el punto de vista evolutivo y es una elección única para acuaristas especializados en biología subterránea.",
    comments: [
      {
        const User(
          id: 501,
          username: 'Hugo',
          password: '',
          mail: 'hugo@example.com',
          profilePicture: '',
        ): 'El Mexican Cavefish es fascinante desde el punto de vista evolutivo.',
      },
      {
        const User(
          id: 502,
          username: 'Adriana',
          password: '',
          mail: 'adriana@example.com',
          profilePicture: '',
        ): '¿Cómo se adapta el Mexican Cavefish a la vida en cuevas?',
        const User(
          id: 503,
          username: 'Francisco',
          password: '',
          mail: 'francisco@example.com',
          profilePicture: '',
        ): '¡Increíble que no tenga pigmentación ni ojos desarrollados!',
      },
    ],
  ),
  Pez(
    id: 9,
    name: "Gold Barb",
    imageRoute: "assets/carousel/gold_barb.jpg",
    description:
        "El Gold Barb (Puntius semifasciolatus) es un pez de agua dulce conocido por su color dorado y su comportamiento activo. Originario de Asia, este pez de cardumen es adecuado para acuarios comunitarios y se lleva bien con una variedad de otras especies pacíficas. Su coloración vibrante lo convierte en una opción popular para acuarios plantados.",
    comments: [
      {
        const User(
          id: 601,
          username: 'Isabella',
          password: '',
          mail: 'isabella@example.com',
          profilePicture: '',
        ): 'Los Gold Barbs son hermosos en un acuario plantado.',
      },
      {
        const User(
          id: 602,
          username: 'Sebastián',
          password: '',
          mail: 'sebastian@example.com',
          profilePicture: '',
        ): '¿Cuál es la mejor dieta para mantener la coloración vibrante de los Gold Barbs?',
        const User(
          id: 603,
          username: 'Ana',
          password: '',
          mail: 'ana@example.com',
          profilePicture: '',
        ): 'Me encanta observar el comportamiento activo de los Gold Barbs en el acuario.',
      },
    ],
  ),
  Pez(
    id: 10,
    name: "Machaca",
    imageRoute: "assets/carousel/machaca.jpg",
    description:
        "El Machaca (Brycon guatemalensis) es un pez de agua dulce nativo de América Central y América del Sur. Conocido por su cuerpo plateado y forma delgada, el Machaca es una especie migratoria que se encuentra en ríos y arroyos. Su papel en los ecosistemas acuáticos como dispersor de semillas lo hace vital para la salud de estos hábitats.",
    comments: [
      {
        const User(
          id: 701,
          username: 'Javier',
          password: '',
          mail: 'javier@example.com',
          profilePicture: '',
        ): '¡El Machaca es esencial para la salud de los hábitats acuáticos!',
      },
      {
        const User(
          id: 702,
          username: 'Carmen',
          password: '',
          mail: 'carmen@example.com',
          profilePicture: '',
        ): '¿Alguien ha observado el comportamiento migratorio del Machaca en cautiverio?',
        const User(
          id: 703,
          username: 'Sergio',
          password: '',
          mail: 'sergio@example.com',
          profilePicture: '',
        ): 'Me encanta la plateada brillante del Machaca.',
      },
    ],
  ),
  Pez(
    id: 11,
    name: "Tetra",
    imageRoute: "assets/carousel/tetra.jpg",
    description:
        "El Tetra es un grupo diverso de peces pequeños y coloridos pertenecientes a varias especies dentro de la familia Characidae. Originarios de América del Sur y Central, los tetras son conocidos por su comportamiento de cardumen y su coloración brillante. Son populares en acuarios comunitarios y a menudo se eligen por su naturaleza pacífica y su fácil cuidado.",
    comments: [
      {
        const User(
          id: 801,
          username: 'Monica',
          password: '',
          mail: 'monica@example.com',
          profilePicture: '',
        ): 'Los tetras son una adición colorida y vibrante a cualquier acuario.',
      },
      {
        const User(
          id: 802,
          username: 'Daniel',
          password: '',
          mail: 'daniel@example.com',
          profilePicture: '',
        ): '¿Cuál es tu especie favorita de tetra?',
        const User(
          id: 803,
          username: 'Lorena',
          password: '',
          mail: 'lorena@example.com',
          profilePicture: '',
        ): 'Me encanta ver el hermoso cardumen de tetras en mi acuario.',
      },
    ],
  ),
  Pez(
    id: 12,
    name: "Characidum",
    imageRoute: "assets/carousel/characidum.jpg",
    description:
        "El Characidum es un género de peces de agua dulce perteneciente a la familia Crenuchidae. Conocidos por su forma alargada y aleta dorsal prominente, los peces del género Characidum son originarios de América del Sur. Muchas especies de este género son apreciadas en acuarismo por su aspecto distintivo y su comportamiento activo.",
    comments: [
      {
        const User(
          id: 901,
          username: 'Roberto',
          password: '',
          mail: 'roberto@example.com',
          profilePicture: '',
        ): 'El Characidum tiene una aleta dorsal tan llamativa.',
      },
      {
        const User(
          id: 902,
          username: 'Elena',
          password: '',
          mail: 'elena@example.com',
          profilePicture: '',
        ): '¿Alguien ha mantenido especies del género Characidum en un acuario comunitario?',
        const User(
          id: 903,
          username: 'Miguel',
          password: '',
          mail: 'miguel@example.com',
          profilePicture: '',
        ): 'Me encanta la variedad de formas y colores en el género Characidum.',
      },
    ],
  ),
  Pez(
    id: 13,
    name: "Characidium",
    imageRoute: "assets/carousel/characidium.jpg",
    description:
        "El Characidium es un género de peces de agua dulce perteneciente a la familia Crenuchidae. Conocidos por su forma alargada y aleta dorsal prominente, los peces del género Characidium son originarios de América del Sur. Muchas especies de este género son apreciadas en acuarismo por su aspecto distintivo y su comportamiento activo.",
  ),
  Pez(
    id: 14,
    name: "Clown Loach",
    imageRoute: "assets/carousel/clown_loach.jpg",
    description:
        "El Clown Loach (Chromobotia macracanthus) es un pez de agua dulce originario de ríos en Indonesia. Conocido por sus colores vibrantes y patrones llamativos, el Clown Loach es popular en acuarios comunitarios. Este pez pacífico prefiere vivir en grupos y es conocido por su comportamiento activo y juguetón.",
  ),
  Pez(
    id: 15,
    name: "Delphax Catfish",
    imageRoute: "assets/carousel/delphax_catfish.jpg",
    description:
        "El Delphax Catfish (Dianema longibarbis) es un pequeño bagre de agua dulce originario de América del Sur. Conocido por sus espinas pectorales alargadas y su comportamiento nocturno, este pez es adecuado para acuarios comunitarios. Prefiere áreas con escondites y se alimenta principalmente de insectos y pequeños invertebrados.",
    comments: [
      {
        const User(
          id: 1201,
          username: 'Diego',
          password: '',
          mail: 'diego@example.com',
          profilePicture: '',
        ): 'El Delphax Catfish es una adición única a mi acuario.',
      },
      {
        const User(
          id: 1202,
          username: 'Laura',
          password: '',
          mail: 'laura@example.com',
          profilePicture: '',
        ): '¿Cómo interactúa el Delphax Catfish con otros peces nocturnos?',
        const User(
          id: 1203,
          username: 'Martín',
          password: '',
          mail: 'martin@example.com',
          profilePicture: '',
        ): 'Me encanta ver cómo se alimenta el Delphax Catfish por la noche.',
      },
    ],
  ),
  Pez(
    id: 16,
    name: "Netted Catfish",
    imageRoute: "assets/carousel/netted_catfish.jpg",
    description:
        "El Netted Catfish (Agamyxis pectinifrons) es un bagre de agua dulce conocido por su patrón de red en su cuerpo. Originario de América del Sur, este pez es popular en acuarios comunitarios debido a su apariencia única y su comportamiento nocturno. Prefiere hábitats con escondites y se alimenta de insectos y pequeños invertebrados.",
    comments: [
      {
        const User(
          id: 1201,
          username: 'Diego',
          password: '',
          mail: 'diego@example.com',
          profilePicture: '',
        ): 'El Delphax Catfish es una adición única a mi acuario.',
      },
      {
        const User(
          id: 1202,
          username: 'Laura',
          password: '',
          mail: 'laura@example.com',
          profilePicture: '',
        ): '¿Cómo interactúa el Delphax Catfish con otros peces nocturnos?',
        const User(
          id: 1203,
          username: 'Martín',
          password: '',
          mail: 'martin@example.com',
          profilePicture: '',
        ): 'Me encanta ver cómo se alimenta el Delphax Catfish por la noche.',
      },
    ],
  ),
  Pez(
    id: 17,
    name: "Common Carp",
    imageRoute: "assets/carousel/commom_carp.jpg",
    description:
        "La Common Carp (Cyprinus carpio) es un pez de agua dulce originario de Asia y Europa. Conocida por su tamaño grande y su capacidad para adaptarse a una variedad de entornos acuáticos, la carpa común es una especie de importancia económica y cultural en todo el mundo. A menudo se cría en estanques y embalses para la pesca deportiva y la alimentación.",
  ),
  Pez(
    id: 18,
    name: "Electric Eel",
    imageRoute: "assets/carousel/electric_eel.jpg",
    description:
        "La Electric Eel (Electrophorus electricus) es un pez eléctrico nativo de la cuenca del Amazonas en América del Sur. Aunque no es una anguila, se le conoce comúnmente como 'anguila eléctrica'. Puede generar descargas eléctricas para la caza, la comunicación y la autodefensa. Su capacidad eléctrica única lo hace fascinante desde el punto de vista biológico.",
    comments: [
      {
        const User(
          id: 1801,
          username: 'Ricardo',
          password: '',
          mail: 'ricardo@example.com',
          profilePicture: '',
        ): 'La Electric Eel es un ejemplo fascinante de la adaptación en la naturaleza.',
      },
      {
        const User(
          id: 1802,
          username: 'Isabella',
          password: '',
          mail: 'isabella@example.com',
          profilePicture: '',
        ): '¿Alguien ha tenido experiencia en mantener una Electric Eel en cautiverio?',
        const User(
          id: 1803,
          username: 'Jorge',
          password: '',
          mail: 'jorge@example.com',
          profilePicture: '',
        ): 'Me asombra la capacidad de la Electric Eel para generar descargas eléctricas.',
      },
    ],
  ),
  Pez(
    id: 19,
    name: "River Hatchetfish",
    imageRoute: "assets/carousel/river_hatchetfish.jpg",
    description:
        "El River Hatchetfish (Carnegiella marthae) es un pequeño pez de agua dulce conocido por su cuerpo transparente y su forma de hacha. Originario de América del Sur, este pez se encuentra comúnmente en arroyos y ríos lentos. Su apariencia única y su comportamiento de cardumen lo convierten en una opción interesante para acuarios más pequeños.",
    comments: [
      {
        const User(
          id: 1901,
          username: 'Natalia',
          password: '',
          mail: 'natalia@example.com',
          profilePicture: '',
        ): 'El River Hatchetfish tiene una forma tan única.',
      },
      {
        const User(
          id: 1902,
          username: 'Alejandro',
          password: '',
          mail: 'alejandro@example.com',
          profilePicture: '',
        ): '¿Cuál es la mejor manera de recrear el hábitat del River Hatchetfish en un acuario?',
        const User(
          id: 1903,
          username: 'Carolina',
          password: '',
          mail: 'carolina@example.com',
          profilePicture: '',
        ): 'Me encanta ver cómo los River Hatchetfish se mueven en formaciones en mi acuario.',
      },
    ],
  ),
  Pez(
    id: 20,
    name: "Red Rainbow Fish",
    imageRoute: "assets/carousel/red_rainbow_fish.jpg",
    description:
        "El Red Rainbow Fish (Glossolepis incisus) es un pez de agua dulce originario de Papua Nueva Guinea. Conocido por sus colores vibrantes y aletas alargadas, este pez es popular en acuarios tropicales. Prefiere hábitats con plantas y es adecuado para acuarios comunitarios con otras especies pacíficas.",
    comments: [
      {
        const User(
          id: 2001,
          username: 'Andrés',
          password: '',
          mail: 'andres@example.com',
          profilePicture: '',
        ): 'El Red Rainbow Fish agrega un toque de color vibrante a mi acuario tropical.',
      },
      {
        const User(
          id: 2002,
          username: 'Patricia',
          password: '',
          mail: 'patricia@example.com',
          profilePicture: '',
        ): '¿Alguien ha logrado la reproducción exitosa del Red Rainbow Fish?',
        const User(
          id: 2003,
          username: 'Juan',
          password: '',
          mail: 'juan@example.com',
          profilePicture: '',
        ): 'Me encanta ver cómo los Red Rainbow Fish interactúan con otras especies pacíficas en mi acuario comunitario.',
      },
    ],
  ),
];

createPeces() async {
  final PezRepository pezRepository = PezRepository();

  for (Pez pez in peces) {
    await pezRepository.insert(item: pez);
  }
}
