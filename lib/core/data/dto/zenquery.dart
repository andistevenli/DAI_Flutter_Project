class ZEnqueryDTO {
  final String noSO;
  final String kodeCustomer;
  final String namaCustomer;
  final String noPO;
  final String noSJ;
  final String tglOrder;
  final String tglKirim;
  final String kodeScala;
  final String eanCode;
  final String brand;
  final String tradeChannel;
  final String salesman;
  final int qtyOrder;
  final int qtyKirim;
  final int nilaiNetto;
  final String category;
  final String remark;

  ZEnqueryDTO({
    required this.noSO,
    required this.kodeCustomer,
    required this.namaCustomer,
    required this.noPO,
    required this.noSJ,
    required this.tglOrder,
    required this.tglKirim,
    required this.kodeScala,
    required this.eanCode,
    required this.brand,
    required this.tradeChannel,
    required this.salesman,
    required this.qtyOrder,
    required this.qtyKirim,
    required this.nilaiNetto,
    required this.category,
    required this.remark,
  });
}
