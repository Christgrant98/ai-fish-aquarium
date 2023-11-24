import 'package:login_flutter/src/database/database_helper.dart';
import 'package:login_flutter/src/models/comment.dart';
import 'package:login_flutter/src/models/peces_model.dart';

List<Pez> peces = <Pez>[
  Pez(
    id: 1,
    name: "Marbled Headstander",
    imageRoute: "assets/carousel/marbled_headstander.jpg",
    description:
        "El Marbled Headstander (Abramites hypselonotus) es conocido como el 'Cabezón Marmoleado' o 'Cabezón de Espalda Alta'. Pertenece a la familia Anostomidae y al orden Characiformes. A diferencia de lo que su nombre sugiere, el Marbled Headstander no es un habitante de la superficie; más bien, se encuentra en las partes medias e inferiores del acuario. En su hábitat natural, a menudo se le encuentra con la cabeza hacia abajo y la cola hacia arriba en fisuras rocosas verticales estrechas.",
    comments: [
      Comment(
        username: 'Lucius_92',
        mail: 'lucius_92@example.com',
        comment:
            '¡Este pez es increíble! Su postura única en el acuario siempre llama la atención. Definitivamente, una joya para cualquier aficionado.',
      ),
      Comment(
        username: 'Aurelia_77',
        mail: 'aurelia_77@example.com',
        comment:
            '¡Qué fascinante el Marbled Headstander! Su apariencia marmoleada y su comportamiento distintivo hacen que mi acuario sea aún más especial. ¡Amo tenerlo!',
      ),
      Comment(
        username: 'Maximus_45',
        mail: 'maximus_45@example.com',
        comment:
            'Este pez realmente agrega un toque único a mi acuario. Siempre me sorprende verlo con la cabeza hacia abajo. ¡Simplemente espectacular!',
      ),
    ],
  ),
  Pez(
    id: 2,
    name: "Spotted Raphael Catfish",
    imageRoute: "assets/carousel/spotted_raphael_catfish.jpg",
    description:
        "El Spotted Raphael Catfish (Agamyxis pectinifrons) es un pez de la familia Doradidae. Es conocido por sus patrones moteados y su comportamiento nocturno. Este pez originario de América del Sur prefiere hábitats con escondites y se alimenta principalmente de insectos y pequeños invertebrados. Su apariencia única y su comportamiento cautivador lo convierten en una adición interesante para acuarios comunitarios.",
    isLiked: false,
    comments: [
      Comment(
        username: 'Valentina_28',
        mail: 'valentina_28@example.com',
        comment:
            '¡El Spotted Raphael Catfish es realmente sorprendente! Me encanta verlo explorar mi acuario por la noche. Sus patrones moteados lo hacen tan atractivo.',
      ),
      Comment(
        username: 'Santiago_89',
        mail: 'santiago_89@example.com',
        comment:
            '¡Increíble descubrimiento! El Spotted Raphael Catfish es la joya de mi acuario. Su comportamiento nocturno agrega un toque misterioso y emocionante.',
      ),
      Comment(
        username: 'Isabella_12',
        mail: 'isabella_12@example.com',
        comment:
            'Este pez es una maravilla. Los patrones en su piel son hipnóticos, y su naturaleza nocturna hace que cada visita al acuario sea emocionante. ¡Lo recomiendo totalmente!',
      ),
    ],
  ),
  Pez(
    id: 3,
    name: "Common Clown Fish",
    imageRoute: "assets/carousel/common_clown_fish.jpg",
    description:
        "El Common Clown Fish (Amphiprion ocellaris) es famoso por su apariencia colorida y su relación simbiótica con las anémonas de mar. Originario de las aguas cálidas del Pacífico y el Índico, este pez es conocido por su comportamiento territorial y su capacidad para cambiar de género. Su asociación mutualista con las anémonas proporciona protección contra depredadores y un lugar seguro para poner huevos.",
    isLiked: false,
    comments: [
      Comment(
        username: 'Lorena_56',
        mail: 'lorena_56@example.com',
        comment:
            '¡El Common Clown Fish es una maravilla de la naturaleza! Sus colores vibrantes y su relación con las anémonas hacen que mi acuario sea un espectáculo vivo. ¡Siempre me alegra verlo nadar!',
      ),
      Comment(
        username: 'Gabriel_34',
        mail: 'gabriel_34@example.com',
        comment:
            'Este pez es asombroso. Su comportamiento territorial y la forma en que interactúa con las anémonas son fascinantes. ¡Definitivamente una adición imprescindible para cualquier amante de los acuarios!',
      ),
      Comment(
        username: 'Camila_77',
        mail: 'camila_77@example.com',
        comment:
            '¡El Common Clown Fish es una joya acuática! La simbiosis con las anémonas es un espectáculo impresionante. Cada vez que lo veo, me recuerda la increíble diversidad de la vida marina.',
      ),
    ],
  ),
  Pez(
    id: 4,
    name: "Cichlid",
    imageRoute: "assets/carousel/cichild.jpg",
    description:
        "El Cichlid (Cíclido) es un grupo diverso de peces pertenecientes a varias familias. Conocidos por su variada coloración y comportamiento territorial, los cíclidos se encuentran en una amplia variedad de hábitats, desde lagos hasta ríos. Muchas especies de cíclidos son apreciadas en acuarismo debido a su belleza y comportamiento único.",
    isLiked: false,
    comments: [
      Comment(
        username: 'Antonio_65',
        mail: 'antonio_65@example.com',
        comment:
            '¡Los cíclidos son fascinantes! Su variada coloración agrega un toque vibrante a mi acuario. Cada uno tiene su personalidad única, ¡es como tener un arco iris nadando en casa!',
      ),
      Comment(
        username: 'Valeria_44',
        mail: 'valeria_44@example.com',
        comment:
            'Me encanta la diversidad de los cíclidos. Siempre hay algo nuevo que descubrir en su comportamiento territorial. Definitivamente, una elección excelente para cualquier amante de los acuarios.',
      ),
      Comment(
        username: 'Javier_21',
        mail: 'javier_21@example.com',
        comment:
            'Los cíclidos son la joya de mi acuario. Su comportamiento activo y sus colores brillantes hacen que cada día sea emocionante. ¡Recomiendo a todos tener al menos un cíclido en su colección!',
      ),
    ],
  ),
  Pez(
    id: 5,
    name: "Black Ghost Knifefish",
    imageRoute: "assets/carousel/black_gohs_knifefish.jpg",
    description:
        "El Black Ghost Knifefish (Apteronotus albifrons) es conocido por su cuerpo negro y alargado, con una aleta anal que se extiende a lo largo de su parte inferior. Originario de América del Sur, este pez nocturno es electrogénico, utilizando descargas eléctricas débiles para navegar y comunicarse. Su naturaleza única y su apariencia fascinante lo convierten en una opción popular para acuarios avanzados.",
    isLiked: false,
    comments: [
      Comment(
        username: 'Elena_78',
        mail: 'elena_78@example.com',
        comment:
            '¡El Black Ghost Knifefish es impresionante! Su aspecto negro y su habilidad electrogénica lo hacen destacar en mi acuario. Siempre es emocionante verlo en acción durante la noche.',
      ),
      Comment(
        username: 'Mateo_55',
        mail: 'mateo_55@example.com',
        comment:
            'Este pez es único en todos los sentidos. Sus descargas eléctricas son fascinantes, y su color negro le da un toque misterioso. ¡Una elección perfecta para los amantes de la pecera!',
      ),
      Comment(
        username: 'Carolina_33',
        mail: 'carolina_33@example.com',
        comment:
            'El Black Ghost Knifefish es una joya en mi colección. Su comportamiento nocturno y su capacidad electrogénica lo convierten en el centro de atención en mi acuario. ¡Lo recomiendo a todos!',
      ),
    ],
  ),
  Pez(
    id: 6,
    name: "Shadow Sea Catfish",
    imageRoute: "assets/carousel/shadow_sea_catfish.jpg",
    description:
        "El Shadow Sea Catfish (Centromochlus perugiae) es un pequeño bagre de agua dulce con una apariencia distintiva. Con su cuerpo oscuro y ojos grandes, parece una sombra en movimiento en el agua. Originario de la cuenca del Amazonas, este pez pacífico es adecuado para acuarios comunitarios y prefiere esconderse en áreas sombreadas.",
    isLiked: false,
    comments: [
      Comment(
        username: 'Valentín_19',
        mail: 'valentin_19@example.com',
        comment:
            '¡El Shadow Sea Catfish es asombroso! Su apariencia oscura y misteriosa agrega un toque único a mi acuario. Siempre me sorprende verlo deslizarse como una sombra.',
      ),
      Comment(
        username: 'Isabel_42',
        mail: 'isabel_42@example.com',
        comment:
            'Este pequeño bagre es mi favorito. Su comportamiento pacífico y su aspecto único lo hacen destacar entre los demás. ¡Definitivamente una joya en mi acuario!',
      ),
      Comment(
        username: 'Lucía_68',
        mail: 'lucia_68@example.com',
        comment:
            'El Shadow Sea Catfish es una adición encantadora a mi acuario. Siempre encuentro alegría al verlo nadar con gracia entre las sombras. ¡Lo recomiendo a todos los amantes de los peces!',
      ),
    ],
  ),
  Pez(
    id: 7,
    name: "Tiger Oscar",
    imageRoute: "assets/carousel/tiger_oscar.jpg",
    description:
        "El Tiger Oscar (Astronotus ocellatus) es un pez cíclido grande y vibrante conocido por su coloración rayada y patrones únicos. Originario de América del Sur, el Oscar es apreciado por su personalidad carismática y su capacidad para reconocer a sus cuidadores. Sin embargo, es importante proporcionar un entorno espacioso para este pez robusto.",
    isLiked: false,
    comments: [
      Comment(
        username: 'Luisa_87',
        mail: 'luisa_87@example.com',
        comment:
            '¡El Tiger Oscar es simplemente magnífico! Sus colores vibrantes y su personalidad juguetona lo convierten en el rey de mi acuario. ¡Siempre me sorprende con su comportamiento activo!',
      ),
      Comment(
        username: 'Jorge_50',
        mail: 'jorge_50@example.com',
        comment:
            'Este pez es una maravilla. Su capacidad para reconocer a sus cuidadores demuestra su inteligencia. Estoy enamorado de la forma en que ilumina mi acuario con su presencia imponente.',
      ),
      Comment(
        username: 'María_63',
        mail: 'maria_63@example.com',
        comment:
            'El Tiger Oscar es mi favorito absoluto. Aunque es grande, su carisma y sus colores lo hacen destacar. ¡Cada día es una aventura tenerlo en mi acuario!',
      ),
    ],
  ),
  Pez(
    id: 8,
    name: "Mexican Cavefish",
    imageRoute: "assets/carousel/mexican_cavefish.jpg",
    description:
        "El Mexican Cavefish (Astyanax mexicanus) es una especie de pez adaptada a la vida en cuevas. Carece de pigmentación y ojos desarrollados debido a su entorno oscuro. Originario de México, este pez es interesante desde el punto de vista evolutivo y es una elección única para acuaristas especializados en biología subterránea.",
    isLiked: false,
    comments: [
      Comment(
        username: 'Ricardo_74',
        mail: 'ricardo_74@example.com',
        comment:
            '¡El Mexican Cavefish es un verdadero tesoro biológico! Su adaptación a la vida en cuevas es asombrosa. Cada vez que lo veo en mi acuario, me maravillo de la evolución.',
      ),
      Comment(
        username: 'Elena_28',
        mail: 'elena_28@example.com',
        comment:
            'Este pez es fascinante. Su falta de pigmentación y ojos desarrollados es un testimonio de la adaptación al entorno oscuro de las cuevas. ¡Una elección perfecta para aquellos que aman explorar la biología subterránea!',
      ),
      Comment(
        username: 'Andrés_52',
        mail: 'andres_52@example.com',
        comment:
            'El Mexican Cavefish es una joya única en mi acuario. Cada detalle de su adaptación evolutiva es increíble. ¡Definitivamente un pez para apreciar desde una perspectiva científica!',
      ),
    ],
  ),
  Pez(
    id: 9,
    name: "Gold Barb",
    imageRoute: "assets/carousel/gold_barb.jpg",
    description:
        "El Gold Barb (Puntius semifasciolatus) es un pez de agua dulce conocido por su color dorado y su comportamiento activo. Originario de Asia, este pez de cardumen es adecuado para acuarios comunitarios y se lleva bien con una variedad de otras especies pacíficas. Su coloración vibrante lo convierte en una opción popular para acuarios plantados.",
    isLiked: false,
    comments: [
      Comment(
        username: 'Gabriela_39',
        mail: 'gabriela_39@example.com',
        comment:
            '¡El Gold Barb es un tesoro en mi acuario plantado! Su color dorado brilla entre las plantas, y su comportamiento activo agrega vida a todo el tanque. ¡Siempre es un placer verlos nadar!',
      ),
      Comment(
        username: 'Alejandro_81',
        mail: 'alejandro_81@example.com',
        comment:
            'Este pez es una adición maravillosa. Su comportamiento de cardumen es encantador, y su color dorado ilumina mi acuario. ¡Definitivamente, un must-have para cualquier entusiasta de los acuarios!',
      ),
      Comment(
        username: 'Sofía_56',
        mail: 'sofia_56@example.com',
        comment:
            'Los Gold Barb son la estrella de mi acuario comunitario. Su adaptabilidad y su coloración brillante los convierten en una elección perfecta. ¡Recomiendo a todos tener un cardumen de estos peces!',
      ),
    ],
  ),
  Pez(
    id: 10,
    name: "Machaca",
    imageRoute: "assets/carousel/machaca.jpg",
    description:
        "El Machaca (Brycon guatemalensis) es un pez de agua dulce nativo de América Central y América del Sur. Conocido por su cuerpo plateado y forma delgada, el Machaca es una especie migratoria que se encuentra en ríos y arroyos. Su papel en los ecosistemas acuáticos como dispersor de semillas lo hace vital para la salud de estos hábitats.",
    isLiked: false,
    comments: [
      Comment(
        username: 'Carlos_46',
        mail: 'carlos_46@example.com',
        comment:
            '¡El Machaca es una maravilla de la naturaleza! Su forma delgada y su papel como dispersor de semillas hacen que sea un pez fascinante. ¡Siempre me asombra su importancia en la salud de los ecosistemas acuáticos!',
      ),
      Comment(
        username: 'Laura_22',
        mail: 'laura_22@example.com',
        comment:
            'Este pez es esencial para mantener el equilibrio en los ríos y arroyos. Su capacidad para dispersar semillas contribuye significativamente a la salud de los ecosistemas acuáticos. ¡Una especie realmente valiosa!',
      ),
      Comment(
        username: 'Juan_67',
        mail: 'juan_67@example.com',
        comment:
            'El Machaca es uno de mis peces favoritos. Su apariencia plateada y su importancia ecológica lo convierten en una joya en mi acuario. ¡Cuidemos de estos peces para preservar nuestros ecosistemas!',
      ),
    ],
  ),
  Pez(
    id: 11,
    name: "Tetra",
    imageRoute: "assets/carousel/tetra.jpg",
    description:
        "El Tetra es un grupo diverso de peces pequeños y coloridos pertenecientes a varias especies dentro de la familia Characidae. Originarios de América del Sur y Central, los tetras son conocidos por su comportamiento de cardumen y su coloración brillante. Son populares en acuarios comunitarios y a menudo se eligen por su naturaleza pacífica y su fácil cuidado.",
    isLiked: false,
    comments: [
      Comment(
        username: 'Camilo_40',
        mail: 'camilo_40@example.com',
        comment:
            '¡Los Tetras son mi debilidad! Su colorido y su comportamiento de cardumen le dan vida a mi acuario. Nunca me canso de verlos nadar juntos. ¡Son la estrella de mi tanque!',
      ),
      Comment(
        username: 'Ana_55',
        mail: 'ana_55@example.com',
        comment:
            'Estos pequeños peces son simplemente encantadores. Su colorido y su naturaleza pacífica los convierten en la opción perfecta para acuarios comunitarios. ¡Siempre alegran mi día!',
      ),
      Comment(
        username: 'Miguel_28',
        mail: 'miguel_28@example.com',
        comment:
            'Los Tetras son la joya de mi acuario. Su facilidad de cuidado y su vibrante colorido hacen que sean ideales para cualquier amante de los peces. ¡No puedo imaginar mi tanque sin ellos!',
      ),
    ],
  ),
  Pez(
    id: 12,
    name: "Characidum",
    imageRoute: "assets/carousel/characidum.jpg",
    description:
        "El Characidum es un género de peces de agua dulce perteneciente a la familia Crenuchidae. Conocidos por su forma alargada y aleta dorsal prominente, los peces del género Characidum son originarios de América del Sur. Muchas especies de este género son apreciadas en acuarismo por su aspecto distintivo y su comportamiento activo.",
    isLiked: false,
    comments: [
      Comment(
        username: 'Marcela_62',
        mail: 'marcela_62@example.com',
        comment:
            '¡El Characidum es mi favorito! Su forma alargada y su aleta dorsal prominente le dan una elegancia única. Cada vez que nado en mi acuario, se roba el espectáculo. ¡Una adición imprescindible para cualquier aficionado!',
      ),
      Comment(
        username: 'Andrés_40',
        mail: 'andres_40@example.com',
        comment:
            'Estos peces son realmente especiales. Su aspecto distintivo agrega un toque único a mi acuario. ¡Me encanta observar su comportamiento activo! Definitivamente, una joya entre los peces de agua dulce.',
      ),
      Comment(
        username: 'Lorena_75',
        mail: 'lorena_75@example.com',
        comment:
            'Los Characidum son la estrella de mi acuario. Su elegancia y su activo nado hacen que sean fascinantes de observar. ¡Recomiendo a todos tener al menos uno en su colección!',
      ),
    ],
  ),
  Pez(
    id: 13,
    name: "Characidium",
    imageRoute: "assets/carousel/characidium.jpg",
    description:
        "El Characidium es un género de peces de agua dulce perteneciente a la familia Crenuchidae. Conocidos por su forma alargada y aleta dorsal prominente, los peces del género Characidium son originarios de América del Sur. Muchas especies de este género son apreciadas en acuarismo por su aspecto distintivo y su comportamiento activo.",
    isLiked: false,
    comments: [
      Comment(
        username: 'Carmen_33',
        mail: 'carmen_33@example.com',
        comment:
            '¡Los Characidium son simplemente fascinantes! Su forma alargada y aleta dorsal prominente los hacen destacar en cualquier acuario. Siempre me encuentro admirándolos por su elegancia.',
      ),
      Comment(
        username: 'Fernando_50',
        mail: 'fernando_50@example.com',
        comment:
            'Estos peces son una joya. Su comportamiento activo agrega vida a mi acuario, y su aspecto distintivo los convierte en el centro de atención. ¡Definitivamente una elección acertada para cualquier aficionado!',
      ),
      Comment(
        username: 'Mónica_27',
        mail: 'monica_27@example.com',
        comment:
            'Los Characidium son una adición encantadora a mi colección de peces. Su origen sudamericano y su belleza hacen que mi acuario sea aún más especial. ¡Recomiendo a todos tener al menos uno!',
      ),
    ],
  ),
  Pez(
    id: 14,
    name: "Clown Loach",
    imageRoute: "assets/carousel/clown_loach.jpg",
    description:
        "El Clown Loach (Chromobotia macracanthus) es un pez de agua dulce originario de ríos en Indonesia. Conocido por sus colores vibrantes y patrones llamativos, el Clown Loach es popular en acuarios comunitarios. Este pez pacífico prefiere vivir en grupos y es conocido por su comportamiento activo y juguetón.",
    isLiked: false,
    comments: [
      Comment(
        username: 'Isabella_45',
        mail: 'isabella_45@example.com',
        comment:
            '¡El Clown Loach es la alegría de mi acuario! Sus colores vibrantes y su comportamiento juguetón siempre alegran mi día. Verlos en grupo es todo un espectáculo.',
      ),
      Comment(
        username: 'Gabriel_60',
        mail: 'gabriel_60@example.com',
        comment:
            'Este pez es simplemente adorable. Su forma de nadar y sus patrones llamativos lo hacen destacar en mi acuario. ¡No puedo tener suficientes Clown Loaches!',
      ),
      Comment(
        username: 'Carolina_37',
        mail: 'carolina_37@example.com',
        comment:
            'Los Clown Loaches son la estrella de mi tanque. Su comportamiento pacífico y su disposición a vivir en grupo los convierten en una opción perfecta para acuarios comunitarios. ¡Definitivamente, un favorito entre mis peces!',
      ),
    ],
  ),
  Pez(
    id: 15,
    name: "Delphax Catfish",
    imageRoute: "assets/carousel/delphax_catfish.jpg",
    description:
        "El Delphax Catfish (Dianema longibarbis) es un pequeño bagre de agua dulce originario de América del Sur. Conocido por sus espinas pectorales alargadas y su comportamiento nocturno, este pez es adecuado para acuarios comunitarios. Prefiere áreas con escondites y se alimenta principalmente de insectos y pequeños invertebrados.",
    isLiked: false,
    comments: [
      Comment(
        username: 'Valentina_28',
        mail: 'valentina_28@example.com',
        comment:
            '¡El Delphax Catfish es una joya en mi acuario! Sus espinas pectorales alargadas le dan un aspecto único, y su comportamiento nocturno agrega misterio a mi tanque. ¡Definitivamente, un favorito entre mis peces!',
      ),
      Comment(
        username: 'Javier_50',
        mail: 'javier_50@example.com',
        comment:
            'Este pequeño bagre es asombroso. Su comportamiento nocturno lo hace fascinante de observar, y su preferencia por áreas con escondites lo convierte en un residente interesante en mi acuario comunitario. ¡Altamente recomendado!',
      ),
      Comment(
        username: 'Catalina_35',
        mail: 'catalina_35@example.com',
        comment:
            'Los Delphax Catfish son una adición encantadora. Su tamaño compacto y su comportamiento activo durante la noche los hacen perfectos para acuarios comunitarios. ¡Siempre estoy emocionada de verlos explorar su entorno!',
      ),
    ],
  ),
  Pez(
    id: 16,
    name: "Netted Catfish",
    imageRoute: "assets/carousel/netted_catfish.jpg",
    description:
        "El Netted Catfish (Agamyxis pectinifrons) es un bagre de agua dulce conocido por su patrón de red en su cuerpo. Originario de América del Sur, este pez es popular en acuarios comunitarios debido a su apariencia única y su comportamiento nocturno. Prefiere hábitats con escondites y se alimenta de insectos y pequeños invertebrados.",
    isLiked: false,
    comments: [
      Comment(
        username: 'María_25',
        mail: 'maria_25@example.com',
        comment:
            '¡El Netted Catfish es simplemente fascinante! Su patrón de red agrega un toque artístico a mi acuario. Cada vez que sale de su escondite durante la noche, todos los ojos están puestos en él. ¡Un verdadero tesoro!',
      ),
      Comment(
        username: 'Roberto_42',
        mail: 'roberto_42@example.com',
        comment:
            'Este bagre es una joya en mi tanque. Su comportamiento nocturno y su patrón de red lo hacen destacar entre los demás. Si buscas un pez único y atractivo, el Netted Catfish es la elección perfecta.',
      ),
      Comment(
        username: 'Ana_33',
        mail: 'ana_33@example.com',
        comment:
            'Los Netted Catfish son una adición increíble a mi acuario. Su apariencia única y su preferencia por escondites crean un ambiente intrigante. ¡Cada vez que los veo, descubro algo nuevo sobre su fascinante comportamiento!',
      ),
    ],
  ),
  Pez(
    id: 17,
    name: "Common Carp",
    imageRoute: "assets/carousel/commom_carp.jpg",
    description:
        "La Common Carp (Cyprinus carpio) es un pez de agua dulce originario de Asia y Europa. Conocida por su tamaño grande y su capacidad para adaptarse a una variedad de entornos acuáticos, la carpa común es una especie de importancia económica y cultural en todo el mundo. A menudo se cría en estanques y embalses para la pesca deportiva y la alimentación.",
    isLiked: false,
    comments: [
      Comment(
        username: 'Luisa_38',
        mail: 'luisa_38@example.com',
        comment:
            '¡La Common Carp es impresionante! Su tamaño grande y su adaptabilidad la convierten en una especie fascinante. Cada vez que la veo en mi estanque, me maravillo de su presencia majestuosa.',
      ),
      Comment(
        username: 'Martín_45',
        mail: 'martin_45@example.com',
        comment:
            'Criar Common Carps ha sido una experiencia gratificante. Su importancia económica y cultural es evidente, y su tamaño impresionante agrega emoción a la pesca deportiva. ¡Definitivamente una elección sabia!',
      ),
      Comment(
        username: 'Laura_29',
        mail: 'laura_29@example.com',
        comment:
            'Las Common Carps son el orgullo de mi embalse. Su capacidad para adaptarse a diversos entornos las hace valiosas. Estoy agradecida por tener estas magníficas criaturas en mi entorno.',
      ),
    ],
  ),
  Pez(
    id: 18,
    name: "Electric Eel",
    imageRoute: "assets/carousel/electric_eel.jpg",
    description:
        "La Electric Eel (Electrophorus electricus) es un pez eléctrico nativo de la cuenca del Amazonas en América del Sur. Aunque no es una anguila, se le conoce comúnmente como 'anguila eléctrica'. Puede generar descargas eléctricas para la caza, la comunicación y la autodefensa. Su capacidad eléctrica única lo hace fascinante desde el punto de vista biológico.",
    isLiked: false,
    comments: [
      Comment(
        username: 'Rosa_42',
        mail: 'rosa_42@example.com',
        comment:
            '¡La Electric Eel es una maravilla de la naturaleza! Su capacidad para generar descargas eléctricas es simplemente asombrosa. Cada vez que la veo en mi acuario, me quedo boquiabierta ante su singularidad.',
      ),
      Comment(
        username: 'Alejandro_55',
        mail: 'alejandro_55@example.com',
        comment:
            'Tener una Electric Eel es como tener un tesoro viviente. Su capacidad eléctrica la hace única en el reino acuático. ¡Definitivamente un punto destacado en mi colección de peces!',
      ),
      Comment(
        username: 'Camila_31',
        mail: 'camila_31@example.com',
        comment:
            'Las Electric Eels son criaturas fascinantes. Su habilidad para generar descargas eléctricas para cazar y comunicarse las convierte en una adición emocionante al acuario. ¡Nunca me canso de observarlas!',
      ),
    ],
  ),
  Pez(
    id: 19,
    name: "River Hatchetfish",
    imageRoute: "assets/carousel/river_hatchetfish.jpg",
    description:
        "El River Hatchetfish (Carnegiella marthae) es un pequeño pez de agua dulce conocido por su cuerpo transparente y su forma de hacha. Originario de América del Sur, este pez se encuentra comúnmente en arroyos y ríos lentos. Su apariencia única y su comportamiento de cardumen lo convierten en una opción interesante para acuarios más pequeños.",
    isLiked: false,
    comments: [
      Comment(
        username: 'Gabriel_27',
        mail: 'gabriel_27@example.com',
        comment:
            '¡El River Hatchetfish es una joya en mi acuario! Su cuerpo transparente y su forma de hacha son simplemente impresionantes. Los veo nadar en cardúmenes y es como tener un espectáculo acuático en casa.',
      ),
      Comment(
        username: 'Isabella_40',
        mail: 'isabella_40@example.com',
        comment:
            'Este pequeño pez es una maravilla de la naturaleza. Su cuerpo transparente le da un toque etéreo, y verlos nadar juntos en cardúmenes es verdaderamente hipnotizante. ¡Una elección perfecta para acuarios más pequeños!',
      ),
      Comment(
        username: 'Felipe_32',
        mail: 'felipe_32@example.com',
        comment:
            'Los River Hatchetfish son la atracción principal en mi acuario. Su apariencia única y su comportamiento coordinado en cardúmenes agregan vida y energía al tanque. ¡Definitivamente, una especie que no debe faltar!',
      ),
    ],
  ),
  Pez(
    id: 20,
    name: "Red Rainbow Fish",
    imageRoute: "assets/carousel/red_rainbow_fish.jpg",
    description:
        "El Red Rainbow Fish (Glossolepis incisus) es un pez de agua dulce originario de Papua Nueva Guinea. Conocido por sus colores vibrantes y aletas alargadas, este pez es popular en acuarios tropicales. Prefiere hábitats con plantas y es adecuado para acuarios comunitarios con otras especies pacíficas.",
    isLiked: false,
    comments: [
      Comment(
        username: 'Valentina_29',
        mail: 'valentina_29@example.com',
        comment:
            '¡Los Red Rainbow Fish son la joya de mi acuario! Sus colores vibrantes iluminan todo el tanque, y verlos nadar entre las plantas es simplemente hermoso. Una elección perfecta para acuarios tropicales.',
      ),
      Comment(
        username: 'Carlos_36',
        mail: 'carlos_36@example.com',
        comment:
            'Criar Red Rainbow Fish ha sido una experiencia increíble. Su belleza y elegancia agregan un toque tropical a mi acuario. Son pacíficos y se llevan bien con otras especies, lo que hace que sean ideales para acuarios comunitarios.',
      ),
      Comment(
        username: 'Isabel_45',
        mail: 'isabel_45@example.com',
        comment:
            'Los Red Rainbow Fish son la atracción principal en mi acuario. Su comportamiento vivaz y sus aletas alargadas crean una escena animada. Definitivamente, una adición imprescindible para cualquier amante de los peces tropicales.',
      ),
    ],
  ),
];

createPeces() async {
  final PezRepository pezRepository = PezRepository();

  for (Pez pez in peces) {
    await pezRepository.insert(item: pez);
  }
}
