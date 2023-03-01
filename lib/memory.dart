class Memory {
  static const operations = ['%', '/', '+', '-', 'x', '='];
  String? operator;
  bool usedOperation = false;
  int bufferIndex = 0;
  final buffer = [0.0, 0.0];
  String result = '0';
  String operationDo = '';

  Memory() {
    clear();
  }

  void applyCommand(String command) {
    if (command == 'C') {
      clear();
    } else if (command == 'DEL') {
      deleteLastDigit();
    } else if (operations.contains(command)) {
      setOperation(command);
    } else {
      addDigit(command);
    }
  }

  void clear() {
    result = '0';
    operator = null;
    usedOperation = false;
    bufferIndex = 0;
    buffer.setAll(0, [0.0, 0.0]);
  }

  void deleteLastDigit() {
    result = result.length > 1 ? result.substring(0, result.length - 1) : '0';
  }

  void setOperation(String operator) {
    if (usedOperation && operator == this.operator) return;

    if (bufferIndex == 0) {
      bufferIndex = 1;
    } else {
      buffer[0] = calculate();
    }

    if (operator != '=') this.operator = operator;

    result = buffer[0].toString();
    result = result.endsWith('.0') ? result.split('.')[0] : result;

    usedOperation = true;
  }

  void addDigit(String digit) {
    if (usedOperation) result = '0';
    if (result.contains('.') && digit == '.') digit = '';
    if (result == '0' && digit != '.') result = '';

    result += digit;
    buffer[bufferIndex] = double.parse(result);

    usedOperation = false;
  }

  double calculate() {
    double calc = 0.0;
    switch (operator) {
      case '%':
        calc = (buffer[0] / 100) * buffer[1];
        break;
      case '/':
        calc = buffer[0] / buffer[1];
        break;
      case 'x':
        calc = buffer[0] * buffer[1];
        break;
      case '-':
        calc = buffer[0] - buffer[1];
        break;
      case '+':
        calc = buffer[0] + buffer[1];
        break;
      default:
        calc = double.parse(result);
        break;
    }
    operator = null;
    return calc;
  }
}
