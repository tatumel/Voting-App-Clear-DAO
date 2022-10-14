 ## PASOS PARA INICIO Y “DESPLIEGUE”

Paso 1. Tener el código fuente correspondiente del proyecto en el medio que se te ha proporcionado o que puedes obtenerlo del siguiente enlace del repositorio correspondiente en github: https://github.com/tatumel/Voting-App-Clear-DAO
[<img "https://i.postimg.cc/0QLJGxvZ/1.png"/>]()

Paso 2. En metamask recomendamos crear un nuevo espacio de trabajo únicamente para abrir el Smart Contract, y posteriormente brir el archivo correspondiente desde la interfaz de REMIX, recordamos que el nombre del archivo es votating-app.sol
! (https://i.postimg.cc/prfyDFqX/2.png)

Paso 3. Una vez cargado el archivo en la interfaz de REMIX, se ve así:
https://i.postimg.cc/0y2rwrmP/3.png

Paso 4. Seleccionar el compilador, recomendamos utilizar la EVM 0.8.0 o superior:
https://i.postimg.cc/pVz9NwRb/4.png

Paso 5. Compilar el smart contract usando pinchando en el botón de Solidity Compiler:
https://i.postimg.cc/QxDFjfdB/5.png

Paso 6. Despliegue del contrato:
https://i.postimg.cc/X7gpq9rs/6.png

Paso 7. Siguiendo los pasos anteriores tu Smart Contract debe verse desplegado así:
https://i.postimg.cc/CxP5HYHD/7.png 



### USO DEL SMART CONTRACT

1. Sólo el propietario puede asignar candidatos o candidatas a las votaciones:
https://i.postimg.cc/dVqZj5MM/1-1.png

2. Sólo el propietario puede iniciar la Votación o terminarla:
https://i.postimg.cc/WbmJZQH6/1-2.png

3. Se tiene la opción de cambiar de “Propietario” del contrato:
https://i.postimg.cc/ncfDCH0h/1-3.png

4. Solamente el “Propietario” de contrato puede dar permiso a las votaciones:
https://i.postimg.cc/YS04Jjqb/1-4.png

5. Una ve desplegado el contrato inteligente, puedes saber en todo momento quién es el Propietario (1) , si se tiene permiso de Votar (2), el estado de la votación (3) y el total de votos (4).
https://i.postimg.cc/XNC5jZKP/1-5.png

6. Cuando el propietario del contrato ha dado el permiso a la dirección correspondiente, puede elegir a alguna de las candidatas o candidatos disponibles:
https://i.postimg.cc/QMzBssFs/1-6.png

7. Al ejecutar la transacción del voto se sumará en éste caso a la candidata elegida:
https://i.postimg.cc/x1tJxLYX/1-7.png

8. Si consultamos el total de Votos:
https://i.postimg.cc/QC1K0PxD/1-8.png   

9. Al ejecutar un segundo voto podemos obtener el total de votos nuevamente y confirmar quien es el ganador o ganadora de la votación
https://i.postimg.cc/Hx7rkKMM/1-9.png 

10. Si los votos se han completado el propietario puede dar finalizada la votación y ya no se podrá agregar ningún voto adicional:
https://i.postimg.cc/zvZVbjwc/2-1.png 
