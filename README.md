# Voting-App-Clear-DAO

### Problemática a resolver
Clear busca resolver los procesos de asignación de roles en comunidades y DAOs de forma simple y transparente, a través de un smart contract.
El objetivo es poder brindarles el script del contrato a cualquier protocolo u organización que quiera utilizarla para un proceso de votación interna de definición de candidatas para desarrollar un rol específico en su organización durante un tiempo determinado. 
Se busca resolver la problemática de la falta de transparencia y practicidad en los procesos tradicionales de votación, la lentitud o burocracia y la posibilidad de fraude o alteración de votos y resultados.

### Posible solución
Utilizando un smart contract deployado (desplegado) en la blockchain se permite que cualquier persona que tenga una address y sea habilitado por el owner del contrato, pueda emitir su voto entre las candidatas presentadas de forma rápida, práctica, económica y segura. La votación directa a través de la blockchain, utilizando esta tecnología permite que el voto quede registrado de forma firme e inalterable en la red y brinde transparencia en todo el proceso y los resultados.
Por eso, destacamos cualidades de esta tecnología (blockchain) que poseen varias ventajas por sobre otras tecnologías tradicionales, como: la transparencia, la trazabilidad ya que todo queda registrado en la blockchain y por ende puede consultarse esa información en cualquier momento posterior a la votación, la inmutabilidad y la horizontalidad ya que permite la organización directa entre las personas e instituciones sin necesidad de intermediarios o jerarquías.

### Qué funcionalidades tiene el contrato?
1. El contrato permite tener una votación justa, ya que se tienen a las candidatas registradas en la plataforma.
2. Un “propietario” otorga el permiso para votar.
3. Con el permiso para votar un votante solo puede emitir un voto por alguna de las candidatas
4. Se suman los votos totales
5. Muestra a la candidata ganadora

### Tecnologías y servicios utilizados
- Remix 0.27.0 , Creación del contrato inteligente y testeo
- License MIT, licencia libre para usar el código para futuras votaciones
- Compiler EVM 0.8.0, versión del compilador de la EVM de la red de ethereum
- Metamask extensión para navegador Versión 10.18.3, pruebas y deploy del contrato
