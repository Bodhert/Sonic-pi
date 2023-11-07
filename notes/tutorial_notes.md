# Synths
los envelopes me dicen como debo de controlar el sonido, es como decirle a alguien cuando subir el volumen de la guitarra, que tan rápido, etc…

la opción de **release** me dice cuanto puede durar el sonido,

![release](resources/envelope_1.png)

sustain me dice cuanto tiempo sostengo el sonido entre el ataque, el el release

![sustain](resources/sustain.png)

sirve para darle precencia en la mezcla, se puede poner el ataque y el release en 0, lo que causaria un sonido sin "fade in" ni "fade out", pero puede producir clicks, en el audio, se recomienda usar valores cortos

el decay es el tiempo entre el ataque y el sustain, y me dice cuanto va a caer del `attack_level` al  `decay_level`, que por defecto tendra el sustain level 

![decay](resources/decay.png)

básicamente, con estos parametros puedo jugar bastante con las ondas


1. attack - time from 0 amplitude to the attack_level, 
2. decay - time to move amplitude from attack_level to decay_level, 
3. sustain - time to move the amplitude from decay_level to sustain_level, 
4. release - time to move amplitude from sustain_level to 0 

los niveles a los que pueden llegar ya estan preconfigurados. la duracion del sonido es la suma de 3 fases

`play 60, attack: 0.5, decay: 1, sustain: 2, release: 0.5` con una duracion total de  `0.5 + 1 + 2 + 0.5 = 4` 

# Samples
el `sleep` solo describe cuanto se separa un sonido del otro, no  la duracion, es decir que si el sample dura mas que el sleep se va a sobreponer

los samples son sonidos pregrabados como numeros que dicen como mover el cono de sonido para reproducirlo (nunca habia pensado en esto la verdad), para reproducir el sonido lo mas fiel posible, se necesitan guardar muchos por segundo

* Rate: lo podemos ver como un resorte, si le ponemos 2 estamos comprimiendo el resorte a la mitad, si le ponemos menos de 1, lo estamos alargando, esta transformacion conlleva a que se modifique la densidad del resorte (numero de alambres por cm) y en el sonido se traduce a una modificación del pitch, entre mas lo 'precione' mayor será el pitch, y viceversa

## math behin
