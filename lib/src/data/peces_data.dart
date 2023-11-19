import 'package:login_flutter/src/database/database_helper.dart';
import 'package:login_flutter/src/models/peces_model.dart';

const carouselImages = <Pez>[
  Pez(
    id: 1,
    name: "Marbled Headstander",
    imageRoute: "assets/carousel/marbled_headstander.jpg",
    description: "El Marbled Headstander (Abramites hypselonotus) es conocido como el 'Cabezón Marmoleado' o 'Cabezón de Espalda Alta'. Pertenece a la familia Anostomidae y al orden Characiformes. A diferencia de lo que su nombre sugiere, el Marbled Headstander no es un habitante de la superficie; más bien, se encuentra en las partes medias e inferiores del acuario. En su hábitat natural, a menudo se le encuentra con la cabeza hacia abajo y la cola hacia arriba en fisuras rocosas verticales estrechas.",
  ),
  Pez(
    id: 2,
    name: "Spotted Raphael Catfish",
    imageRoute: "assets/carousel/spotted_raphael_catfish.jpg",
    description: "El Spotted Raphael Catfish (Agamyxis pectinifrons) es un pez de la familia Doradidae. Es conocido por sus patrones moteados y su comportamiento nocturno. Este pez originario de América del Sur prefiere hábitats con escondites y se alimenta principalmente de insectos y pequeños invertebrados. Su apariencia única y su comportamiento cautivador lo convierten en una adición interesante para acuarios comunitarios.",
  ),
  Pez(
    id: 3,
    name: "Common Clown Fish",
    imageRoute: "assets/carousel/common_clown_fish.jpg",
    description: "El Common Clown Fish (Amphiprion ocellaris) es famoso por su apariencia colorida y su relación simbiótica con las anémonas de mar. Originario de las aguas cálidas del Pacífico y el Índico, este pez es conocido por su comportamiento territorial y su capacidad para cambiar de género. Su asociación mutualista con las anémonas proporciona protección contra depredadores y un lugar seguro para poner huevos.",
  ),
  Pez(
    id: 4,
    name: "Cichlid",
    imageRoute: "assets/carousel/cichild.jpg",
    description: "El Cichlid (Cíclido) es un grupo diverso de peces pertenecientes a varias familias. Conocidos por su variada coloración y comportamiento territorial, los cíclidos se encuentran en una amplia variedad de hábitats, desde lagos hasta ríos. Muchas especies de cíclidos son apreciadas en acuarismo debido a su belleza y comportamiento único.",
  ),
  Pez(
    id: 5,
    name: "Black Ghost Knifefish",
    imageRoute: "assets/carousel/black_gohs_knifefish.jpg",
    description: "El Black Ghost Knifefish (Apteronotus albifrons) es conocido por su cuerpo negro y alargado, con una aleta anal que se extiende a lo largo de su parte inferior. Originario de América del Sur, este pez nocturno es electrogénico, utilizando descargas eléctricas débiles para navegar y comunicarse. Su naturaleza única y su apariencia fascinante lo convierten en una opción popular para acuarios avanzados.",
  ),
  Pez(
    id: 6,
    name: "Shadow Sea Catfish",
    imageRoute: "assets/carousel/shadow_sea_catfish.jpg",
    description: "El Shadow Sea Catfish (Centromochlus perugiae) es un pequeño bagre de agua dulce con una apariencia distintiva. Con su cuerpo oscuro y ojos grandes, parece una sombra en movimiento en el agua. Originario de la cuenca del Amazonas, este pez pacífico es adecuado para acuarios comunitarios y prefiere esconderse en áreas sombreadas.",
  ),
  Pez(
    id: 7,
    name: "Tiger Oscar",
    imageRoute: "assets/carousel/tiger_oscar.jpg",
    description: "El Tiger Oscar (Astronotus ocellatus) es un pez cíclido grande y vibrante conocido por su coloración rayada y patrones únicos. Originario de América del Sur, el Oscar es apreciado por su personalidad carismática y su capacidad para reconocer a sus cuidadores. Sin embargo, es importante proporcionar un entorno espacioso para este pez robusto.",
  ),
  Pez(
    id: 8,
    name: "Mexican Cavefish",
    imageRoute: "assets/carousel/mexican_cavefish.jpg",
    description: "El Mexican Cavefish (Astyanax mexicanus) es una especie de pez adaptada a la vida en cuevas. Carece de pigmentación y ojos desarrollados debido a su entorno oscuro. Originario de México, este pez es interesante desde el punto de vista evolutivo y es una elección única para acuaristas especializados en biología subterránea.",
  ),
  Pez(
    id: 9,
    name: "Gold Barb",
    imageRoute: "assets/carousel/gold_barb.jpg",
    description: "El Gold Barb (Puntius semifasciolatus) es un pez de agua dulce conocido por su color dorado y su comportamiento activo. Originario de Asia, este pez de cardumen es adecuado para acuarios comunitarios y se lleva bien con una variedad de otras especies pacíficas. Su coloración vibrante lo convierte en una opción popular para acuarios plantados.",
  ),
  Pez(
    id: 10,
    name: "Machaca",
    imageRoute: "assets/carousel/machaca.jpg",
    description: "El Machaca (Brycon guatemalensis) es un pez de agua dulce nativo de América Central y América del Sur. Conocido por su cuerpo plateado y forma delgada, el Machaca es una especie migratoria que se encuentra en ríos y arroyos. Su papel en los ecosistemas acuáticos como dispersor de semillas lo hace vital para la salud de estos hábitats.",
  ),
  Pez(
    id: 11,
    name: "Tetra",
    imageRoute: "assets/carousel/tetra.jpg",
    description: "El Tetra es un grupo diverso de peces pequeños y coloridos pertenecientes a varias especies dentro de la familia Characidae. Originarios de América del Sur y Central, los tetras son conocidos por su comportamiento de cardumen y su coloración brillante. Son populares en acuarios comunitarios y a menudo se eligen por su naturaleza pacífica y su fácil cuidado.",
  ),
  Pez(
    id: 12,
    name: "Characidum",
    imageRoute: "assets/carousel/characidum.jpg",
    description: "El Characidum es un género de peces de agua dulce perteneciente a la familia Crenuchidae. Conocidos por su forma alargada y aleta dorsal prominente, los peces del género Characidum son originarios de América del Sur. Muchas especies de este género son apreciadas en acuarismo por su aspecto distintivo y su comportamiento activo.",
  ),
  Pez(
    id: 13,
    name: "Characidium",
    imageRoute: "assets/carousel/characidium.jpg",
    description: "El Characidium es un género de peces de agua dulce perteneciente a la familia Crenuchidae. Conocidos por su forma alargada y aleta dorsal prominente, los peces del género Characidium son originarios de América del Sur. Muchas especies de este género son apreciadas en acuarismo por su aspecto distintivo y su comportamiento activo.",
  ),
  Pez(
    id: 14,
    name: "Clown Loach",
    imageRoute: "assets/carousel/clown_loach.jpg",
    description: "El Clown Loach (Chromobotia macracanthus) es un pez de agua dulce originario de ríos en Indonesia. Conocido por sus colores vibrantes y patrones llamativos, el Clown Loach es popular en acuarios comunitarios. Este pez pacífico prefiere vivir en grupos y es conocido por su comportamiento activo y juguetón.",
  ),
  Pez(
    id: 15,
    name: "Delphax Catfish",
    imageRoute: "assets/carousel/delphax_catfish.jpg",
    description: "El Delphax Catfish (Dianema longibarbis) es un pequeño bagre de agua dulce originario de América del Sur. Conocido por sus espinas pectorales alargadas y su comportamiento nocturno, este pez es adecuado para acuarios comunitarios. Prefiere áreas con escondites y se alimenta principalmente de insectos y pequeños invertebrados.",
  ),
  Pez(
    id: 16,
    name: "Netted Catfish",
    imageRoute: "assets/carousel/netted_catfish.jpg",
    description: "El Netted Catfish (Agamyxis pectinifrons) es un bagre de agua dulce conocido por su patrón de red en su cuerpo. Originario de América del Sur, este pez es popular en acuarios comunitarios debido a su apariencia única y su comportamiento nocturno. Prefiere hábitats con escondites y se alimenta de insectos y pequeños invertebrados.",
  ),
  Pez(
    id: 17,
    name: "Common Carp",
    imageRoute: "assets/carousel/commom_carp.jpg",
    description: "La Common Carp (Cyprinus carpio) es un pez de agua dulce originario de Asia y Europa. Conocida por su tamaño grande y su capacidad para adaptarse a una variedad de entornos acuáticos, la carpa común es una especie de importancia económica y cultural en todo el mundo. A menudo se cría en estanques y embalses para la pesca deportiva y la alimentación.",
  ),
  Pez(
    id: 18,
    name: "Electric Eel",
    imageRoute: "assets/carousel/electric_eel.jpg",
    description: "La Electric Eel (Electrophorus electricus) es un pez eléctrico nativo de la cuenca del Amazonas en América del Sur. Aunque no es una anguila, se le conoce comúnmente como 'anguila eléctrica'. Puede generar descargas eléctricas para la caza, la comunicación y la autodefensa. Su capacidad eléctrica única lo hace fascinante desde el punto de vista biológico.",
  ),
  Pez(
    id: 19,
    name: "River Hatchetfish",
    imageRoute: "assets/carousel/river_hatchetfish.jpg",
    description: "El River Hatchetfish (Carnegiella marthae) es un pequeño pez de agua dulce conocido por su cuerpo transparente y su forma de hacha. Originario de América del Sur, este pez se encuentra comúnmente en arroyos y ríos lentos. Su apariencia única y su comportamiento de cardumen lo convierten en una opción interesante para acuarios más pequeños.",
  ),
  Pez(
    id: 20,
    name: "Red Rainbow Fish",
    imageRoute: "assets/carousel/red_rainbow_fish.jpg",
    description: "El Red Rainbow Fish (Glossolepis incisus) es un pez de agua dulce originario de Papua Nueva Guinea. Conocido por sus colores vibrantes y aletas alargadas, este pez es popular en acuarios tropicales. Prefiere hábitats con plantas y es adecuado para acuarios comunitarios con otras especies pacíficas.",
  ),
];


createPeces() async{
  final PezRepository pezRepository = PezRepository();

  for (Pez pez in carouselImages){
    await pezRepository.insert(item: pez);
  }
}


