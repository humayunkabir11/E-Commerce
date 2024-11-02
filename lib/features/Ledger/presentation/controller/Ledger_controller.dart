
import 'package:get/get.dart';
import '../../domain/usecase/Ledger_use_case.dart';


class LedgerController extends GetxController implements GetxService{
 final LedgerUseCase? ledgerUseCase;
  LedgerController({ this.ledgerUseCase });


}

