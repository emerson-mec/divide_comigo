import 'package:flutter/material.dart';

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopApp(),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 10),
            child: Text('Gastos no mês'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 8),
          ),
          GastosMes(),
          SizedBox(height: 15),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 5),
            child: Text('Despesas'),
          ),
          Despesas(),
          Despesas(),
          Despesas(),
          Despesas()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}

class TopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFF00a9ea),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Emerson deve',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'R\$ ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                '6.211,12',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class GastosMes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: 100,
          width: 110,
          decoration: BoxDecoration(
            color: Color.fromRGBO(150, 150, 150, 0.1),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.monetization_on_outlined,
                size: 30,
                color: Color(0xFF00a9ea),
              ),
              Text(
                'Total de gastos no mês',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                'R\$ 10.541,52',
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 110,
          width: 110,
          decoration: BoxDecoration(
            color: Color.fromRGBO(150, 150, 150, 0.1),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.person_pin_circle_outlined,
                size: 30,
                color: Color(0xFF00a9ea),
              ),
              Text(
                'Total de gastos Emerson',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                'R\$ 6.211,12',
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 110,
          width: 110,
          decoration: BoxDecoration(
            color: Color.fromRGBO(150, 150, 150, 0.1),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.person_pin_circle_outlined,
                size: 30,
                color: Color(0xFF00a9ea),
              ),
              Text(
                'Total de gastos Larissa',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                'R\$ 3.952,12',
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Despesas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Color.fromRGBO(150, 150, 150, 0.1),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    maxRadius: 15,
                    backgroundColor: Color(0xFF00a9ea),
                    child: Icon(
                      Icons.home,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                  SizedBox(width: 5),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 35,
                          width: MediaQuery.of(context).size.width / 2.5,
                          child: Text(
                            'Rack para TV Rack para TV para TV Rack para TV Rack para TV',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                        Text(
                          '15/02/2020',
                          style: TextStyle(color: Colors.black38, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 3.5,
                            child: Text(
                              'Emerson deve R\$ 250,25',
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                          ),
                          Text(
                            'Total item: R\$ 500,50',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Icon(Icons.more_vert_rounded),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
