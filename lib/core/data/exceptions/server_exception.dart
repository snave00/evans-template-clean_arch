import '../../../utils/constants/error_const.dart';

/// * A map of status code error messages
class ServerException implements Exception {
  ServerException(this._statusCode);
  final String _statusCode;

  @override
  String toString() {
    switch (_statusCode) {
      case '400':
        return ErrorConst.server400ErrorMessage;
      case '401':
        return ErrorConst.server401ErrorMessage;
      case '402':
        return ErrorConst.server402ErrorMessage;
      case '403':
        return ErrorConst.server403ErrorMessage;
      case '404':
        return ErrorConst.server404ErrorMessage;
      case '405':
        return ErrorConst.server405ErrorMessage;
      case '406':
        return ErrorConst.server406ErrorMessage;
      case '407':
        return ErrorConst.server407ErrorMessage;
      case '408':
        return ErrorConst.server408ErrorMessage;
      case '409':
        return ErrorConst.server409ErrorMessage;
      case '410':
        return ErrorConst.server410ErrorMessage;
      case '411':
        return ErrorConst.server411ErrorMessage;
      case '412':
        return ErrorConst.server412ErrorMessage;
      case '413':
        return ErrorConst.server413ErrorMessage;
      case '414':
        return ErrorConst.server414ErrorMessage;
      case '415':
        return ErrorConst.server415ErrorMessage;
      case '416':
        return ErrorConst.server416ErrorMessage;
      case '417':
        return ErrorConst.server417ErrorMessage;
      case '418':
        return ErrorConst.server418ErrorMessage;
      case '419':
        return ErrorConst.server419ErrorMessage;
      case '420':
        return ErrorConst.server420ErrorMessage;
      case '421':
        return ErrorConst.server421ErrorMessage;
      case '422':
        return ErrorConst.server422ErrorMessage;
      case '423':
        return ErrorConst.server423ErrorMessage;
      case '424':
        return ErrorConst.server424ErrorMessage;
      case '426':
        return ErrorConst.server426ErrorMessage;
      case '428':
        return ErrorConst.server428ErrorMessage;
      case '429':
        return ErrorConst.server429ErrorMessage;
      case '431':
        return ErrorConst.server431ErrorMessage;
      case '500':
        return ErrorConst.server500ErrorMessage;
      case '501':
        return ErrorConst.server501ErrorMessage;
      case '502':
        return ErrorConst.server502ErrorMessage;
      case '503':
        return ErrorConst.server503ErrorMessage;
      case '504':
        return ErrorConst.server504ErrorMessage;
      case '505':
        return ErrorConst.server505ErrorMessage;
      case '506':
        return ErrorConst.server506ErrorMessage;
      case '507':
        return ErrorConst.server507ErrorMessage;
      case '508':
        return ErrorConst.server508ErrorMessage;
      case '509':
        return ErrorConst.server509ErrorMessage;
      case '510':
        return ErrorConst.server510ErrorMessage;
      case '511':
        return ErrorConst.server511ErrorMessage;
      default:
        return ErrorConst.serverGeneralErrorMessage;
    }
  }
}
