# Trabalho GA - Roteamento com BIRD

Leonardo Littig - Redes II

Topologia em anel com 5 roteadores BIRD em containers Docker, em 3 sistemas autônomos
(AS100 = R1, R2; AS200 = R3, R4; AS300 = R5). A mesma topologia roda RIP, OSPF ou BGP.

    R1 --- R2 --- R3 --- R4
    |                    |
     -------- R5 --------

Enlaces: 10.0.XY.0/24 entre Rx e Ry. LANs: 192.168.N.0/24 no RN.
O roteador N usa sempre o final .1N (ex.: R3 = 10.0.23.13, 192.168.3.13).

Arquivos:

- Dockerfile: imagem do roteador (Ubuntu + bird2 + ping + tcpdump)
- compose.yaml: roteadores e redes
- rip/, ospf/, bgp/: configuração do BIRD de cada roteador (.conf)

imagem:

    docker build -t bird-router .

Export no protocolo (PROTO):

    export PROTO=rip #rip, ospf, bgp
    docker compose up -d

Ver rotas:

    docker compose exec r1 birdc show route
    docker compose exec r1 ping -I 192.168.1.11 192.168.3.13

Simular uma queda do enlace (ex.: R2-R3):

    docker network disconnect trabalho1_net23 trabalho1-r2-1
