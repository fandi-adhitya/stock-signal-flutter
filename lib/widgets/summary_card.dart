part of 'widgets.dart';


// ignore: must_be_immutable
class SummaryCard extends StatelessWidget {
  NumberFormat format = NumberFormat.decimalPattern('id');
  final SummaryTradeData summaryTradeData;
  final SummaryTradeList? summaryTradeList;
  // final List<SummaryTradeList> summaryTradeList;
  // const SummaryCard({ Key? key }) : super(key: key);
  SummaryCard(this.summaryTradeData, {this.summaryTradeList});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        border: Border(
          top: BorderSide(width: 0.5, color: cloudColor),
          bottom: BorderSide(width: 0.5, color: cloudColor),
          left: BorderSide(width: 0.5, color: cloudColor),
          right: BorderSide(width: 0.5, color: cloudColor)
        )
      ),
      child: Column(
        children: [
          _nameOfCompany(),
          SizedBox(height: 5.0),
          Divider(color: cloudColor),
          _listOfSummary()
        ]
      ),
    );
  }

  Widget _nameOfCompany() => 
    Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(summaryTradeData.companyCode, style: blackTextFont.copyWith(fontWeight: FontWeight.bold)),
        SizedBox(width: 18.0),
        Text(summaryTradeData.companyName, style: blackTextFont.copyWith(fontWeight: FontWeight.bold, fontSize: 12)),
      ],
    );

  Widget _listOfSummary(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: summaryTradeData.summaryTrade.map((e) => 
        _listSummaryData(e)
      ).toList()
    );
  }

  Widget _listSummaryData(SummaryTradeList list) => 
    Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.symmetric(vertical: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        border: Border(
          top: BorderSide(width: 0.5, color: cloudColor),
          bottom: BorderSide(width: 0.5, color: cloudColor),
          left: BorderSide(width: 0.5, color: cloudColor),
          right: BorderSide(width: 0.5, color: cloudColor)
        )
      ),
      child: Row(
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
                  Text(format.format(list.entryPrice), style: blackTextFont.copyWith(fontSize: 12),)
                ],
              ),
              SizedBox(height: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Allocation", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black54)),
                  SizedBox(height: 4.0,),
                  Text(list.allocation + " %", style: blackTextFont.copyWith(fontSize: 12),)
                ],
              ),
              SizedBox(height: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Entry Date", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black54)),
                  SizedBox(height: 4.0,),
                  Text(list.entryDate, style: blackTextFont.copyWith(fontSize: 12),)
                ],
              ), 
              SizedBox(height: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Exit Date", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black54)),
                  SizedBox(height: 4.0,),
                  Text(list.exitDate, style: blackTextFont.copyWith(fontSize: 12),)
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
                  Text(format.format(list.takeProfit1), style: blackTextFont.copyWith(fontSize: 12),)
                ],
              ),
              SizedBox(height: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Take Profit #2", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black54)),
                  SizedBox(height: 4.0,),
                  Text(format.format(list.takeProfit2), style: blackTextFont.copyWith(fontSize: 12),)
                ],
              ),
              SizedBox(height: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Current Price", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black54)),
                  SizedBox(height: 4.0,),
                  Text(format.format(list.currentPrice), style: blackTextFont.copyWith(fontSize: 12),)
                ],
              ), 
              SizedBox(height: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Risk To Reward", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black54)),
                  SizedBox(height: 4.0,),
                  Text(list.riskToReward, style: blackTextFont.copyWith(fontSize: 12),)
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
                  Text(format.format(list.stopLoss), style: blackTextFont.copyWith(fontSize: 12),)
                ],
              ),
              SizedBox(height: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Duration", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black54)),
                  SizedBox(height: 4.0,),
                  Text(list.duration, style: blackTextFont.copyWith(fontSize: 12),)
                ],
              ),
              SizedBox(height: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Return", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black54)),
                  SizedBox(height: 4.0,),
                  Text(list.returning, style: blackTextFont.copyWith(fontSize: 12),)
                ],
              ), 
              SizedBox(height: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Status", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black54)),
                  SizedBox(height: 4.0,),
                  Text(list.status.toString(), style:( 
                    list.status == "HOLD" ? 
                      holdText : list.status == "EXIT SOON" ? 
                        exitSoonText : list.status == "ENTRY SOON" ?
                          entrySoonText : list.status == "PARTIALLY SOLD" ?
                            partialSoldText : list.status == "SOLD" ? 
                              soldText : list.status == "STOP LOSS" ? 
                                stopLossText : yellowTextFont
                  ))              
                ],
              ), 
            ]
          ), 
        ]
      ),
    );
}