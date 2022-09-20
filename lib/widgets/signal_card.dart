part of 'widgets.dart';

// ignore: must_be_immutable
class SignalCard extends StatelessWidget {
  NumberFormat format = NumberFormat.decimalPattern('id');
  final Data? signal;
  SignalCard(this.signal);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10.0))
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(signal!.companyCode.toString(), style: blackTextFont.copyWith(fontWeight: FontWeight.bold)),
                      SizedBox(width: 10.0),
                      Text(signal!.companyName.toString(), style: blackTextFont.copyWith(fontSize: 12, fontWeight: FontWeight.bold))
                  ]),
                  SizedBox(height: 10.0,),
                  Text("10 Oktober 2021", style: blackTextFont.copyWith(fontSize: 12, letterSpacing: -0.5))
                ],
              ),
              Text(format.format(signal!.currentPrice), style: greenTextFont.copyWith(fontSize: 18, fontWeight: FontWeight.bold),),  
            ],
          ),
          SizedBox(height: 10,),
          Divider(color: Colors.black12),
          SizedBox(height: 10,),
          _signalData()
        ]
      ),
    );
  }

  Widget _signalData() => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Entry Price", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black54)),
                SizedBox(height: 4.0,),
                Text(format.format(signal!.entryPrice), style: blackTextFont.copyWith(fontSize: 12),)
              ],
            ),
            SizedBox(height: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Allocation", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black54)),
                SizedBox(height: 4.0,),
                Text(signal!.allocation.toString(), style: blackTextFont.copyWith(fontSize: 12),)
              ],
            ), 
          ]
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Take Profit #1", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black54)),
                SizedBox(height: 4.0,),
                Text(format.format(signal!.takeProfit1), style: blackTextFont.copyWith(fontSize: 12),)
              ],
            ),
            SizedBox(height: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Take Profit #2", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black54)),
                SizedBox(height: 4.0,),
                Text(format.format(signal!.takeProfit2), style: blackTextFont.copyWith(fontSize: 12),)
              ],
            ), 
          ]
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Stop Loss", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black54)),
                SizedBox(height: 4.0,),
                Text(format.format(signal!.stopLoss), style: blackTextFont.copyWith(fontSize: 12),)
              ],
            ),
            SizedBox(height: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Status", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black54)),
                SizedBox(height: 4.0,),
                Text(signal!.status.toString(), style:( 
                  signal!.status == "HOLD" ? 
                    holdText : signal!.status == "EXIT SOON" ? 
                      exitSoonText : signal!.status == "ENTRY SOON" ?
                        entrySoonText : signal!.status == "PARTIALLY SOLD" ?
                          partialSoldText : signal!.status == "SOLD" ? 
                            soldText : signal!.status == "STOP LOSS" ? 
                              stopLossText : yellowTextFont
                ))
              ],
            ), 
          ]
        ),
      ],
    );
}